import sqlite3
import cleaning
import database
import numpy as np
import pandas as pd


def generate_sql_conditions(off_cols, trr_cols):
    conditions = []
    for i in range(len(off_cols)):
        off_col = off_cols[i]
        trr_col = trr_cols[i]
        condition = f"""
            (off.{off_col} = 'NULL' OR trr.{trr_col} = 'NULL' OR off.{off_col} = trr.{trr_col})
        """
        conditions.append(condition)
    return ' AND '.join(conditions)


def generate_sql_query(off_cols, trr_cols):
    return f"""
        SELECT off.id as officer_id, trr.id as trr_id,
            {', '.join(off_cols + trr_cols)}
        FROM tmp_officers off, remaining_trr trr
        WHERE {generate_sql_conditions(off_cols, trr_cols)}
        ;
    """


def integrate():
    trr = cleaning.process_trr()
    officers = database.download('data_officer')

    officer_cols = [
        'appointed_date',
        'first_name',
        'middle_initial',
        'last_name',
        'gender',
        'race',
        'birth_year',
        'suffix_name',
    ]
    trr_officer_cols = [
        'officer_appointed_date',
        'officer_first_name',
        'officer_middle_initial',
        'officer_last_name',
        'officer_gender',
        'officer_race',
        'officer_birth_year',
        'officer_suffix_name',
    ]
    result_cols = list(trr.columns) + ['id_trr', 'id_officer']
    result_cols.remove('id')


    # cleanup officers table
    officers['birth_year'] = officers['birth_year'].astype('Int64').replace({np.nan: None})
    officers['race'] = officers['race'].str.upper()
    officers['race'].replace('UNKNOWN', None, inplace=True)
    officers['race'].replace('ASIAN/PACIFIC', 'ASIAN/PACIFIC ISLANDER', inplace=True)
    officers['appointed_date'] = officers['appointed_date'].apply(lambda date: date.strftime('%Y-%m-%d') if date != None else None)

    # convert to NULLs
    tmp_officers = officers.fillna('NULL')
    tmp_trr = trr.fillna('NULL')
    tmp_trr = tmp_trr.replace('REDACTED', 'NULL')
    tmp_trr = tmp_trr.replace(' ', 'NULL')


    # start by performing a full inner join on all columns
    results = pd.merge(
        tmp_officers,
        tmp_trr,
        left_on=officer_cols,
        right_on=trr_officer_cols,
        how='inner',
        suffixes=['_officer', '_trr']
    )

    # take the remaining trr rows
    remaining_trr = tmp_trr[~tmp_trr['id'].isin(set(results['id_trr']))]

    # try removing 1 column at a time, join with officers and concat the results
    for k in range(len(officer_cols)):
        res = pd.merge(
            tmp_officers,
            remaining_trr,
            left_on=officer_cols[:k] + officer_cols[k+1:],
            right_on=trr_officer_cols[:k] + trr_officer_cols[k+1:],
            how='inner',
            suffixes=['_officer', '_trr']
        )
        results = pd.concat([results, res])
        remaining_trr = remaining_trr[~remaining_trr['id'].isin(set(res['id_trr']))]

    # only take the columns we are interested in
    results = results[result_cols]


    # since pandas doesn't support conditional joins, we will do this by
    # temporarily writing to a sqlite3 databsae and perform the sql queries
    conn = sqlite3.connect(":memory:")

    # store to sqlite3 database
    tmp_officers[officer_cols + ['id']].to_sql("tmp_officers", conn, index=False)
    remaining_trr[trr_officer_cols + ['id']].to_sql("remaining_trr", conn, index=False)

    # perform a full join query on all conditions
    temp_results = pd.read_sql_query(generate_sql_query(officer_cols, trr_officer_cols), conn)

    # compute remaining trr
    remaining_trr = remaining_trr[~remaining_trr['id'].isin(set(temp_results['trr_id']))]

    # rewrite the db
    conn = sqlite3.connect(":memory:")
    tmp_officers[officer_cols + ['id']].to_sql("tmp_officers", conn, index=False)
    remaining_trr[trr_officer_cols + ['id']].to_sql("remaining_trr", conn, index=False)

    for k in range(len(officer_cols)):
        tmp_off_cols = officer_cols[:k] + officer_cols[k+1:]
        tmp_trr_cols = trr_officer_cols[:k] + trr_officer_cols[k+1:]
        # generate query by removing 1 column at a time
        query = generate_sql_query(tmp_off_cols, tmp_trr_cols)
        # update temp_results with newly matched results
        temp_results = pd.concat([temp_results, pd.read_sql_query(query, conn)])
        # reset remaining trr
        remaining_trr = remaining_trr[~remaining_trr['id'].isin(set(temp_results['trr_id']))]
        # rewrite db
        conn = sqlite3.connect(":memory:")
        tmp_officers[officer_cols + ['id']].to_sql("tmp_officers", conn, index=False)
        remaining_trr[trr_officer_cols + ['id']].to_sql("remaining_trr", conn, index=False)

    # temp_results now contains all valid matches, clean this up
    matched = pd.merge(
        trr,
        temp_results,
        left_on=['id'],
        right_on=['trr_id'],
        how='inner',
        suffixes=['', '_remove']
    ).rename(columns={"officer_id": "id_officer"})
    matched['id_trr'] = matched['id']

    # concat to final results
    results = pd.concat([results, matched[result_cols]])

    # rename columns
    rename_map = {
        "id_trr": "id",
        "id_officer": "officer_id",
        "event_number": "event_id",
        "cr_number": "crid",
        "notify_oemc": "notify_OEMC",
        "notify_op_command": "notify_OP_command",
        "notify_det_division": "notify_DET_division",
    }
    results = results.rename(columns=rename_map)

    final_columns = [
        'id',
        'crid',
        'event_id',
        'beat',
        'block',
        'direction',
        'street',
        'location',
        'trr_datetime',
        'indoor_or_outdoor',
        'lighting_condition',
        'weather_condition',
        'notify_OEMC',
        'notify_district_sergeant',
        'notify_OP_command',
        'notify_DET_division',
        'party_fired_first',
        'officer_assigned_beat',
        'officer_on_duty',
        'officer_in_uniform',
        'officer_injured',
        'officer_rank',
        'subject_armed',
        'subject_injured',
        'subject_alleged_injury',
        'subject_age',
        'subject_birth_year',
        'subject_gender',
        'subject_race',
        'point',
        'officer_id',
    ]

    results = results[final_columns]

    # add the remaining rows
    remaining = trr[~trr['id'].isin(set(results['id']))]
    remaining['officer_id'] = 'NULL'
    remaining = remaining.rename(columns=rename_map)
    remaining = remaining[final_columns]
    results = pd.concat([results, remaining])
    
    return results
