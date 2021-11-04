import cleaning
import integration
import os
import csv


def main():
    print('[BEGIN]')

    trr = integration.integrate_trr()
    print('Finished processing trr_trr_refresh')
    
    trrstatus = integration.integrate_trr_status()
    print('Finished processing trr_trrstatus_refresh')

    # get all valid trr ids from trr
    trr_ids = set(trr['id'])

    # remove rows without valid trr ids
    trrstatus = trrstatus[trrstatus['trr_id'].isin(trr_ids)]

    # remove rows without valid trr ids
    weapondischarge = cleaning.process_weapondischarge()
    weapondischarge = weapondischarge[weapondischarge['trr_id'].isin(trr_ids)]
    print('Finished processing trr_weapondischarge_refresh')

    # remove rows without valid trr ids
    actionresponse = cleaning.process_actionresponse()
    actionresponse = actionresponse[actionresponse['trr_id'].isin(trr_ids)]
    print('Finished processing trr_actionresponse_refresh')

    # remove rows without valid trr ids
    charge = cleaning.process_charge()
    charge = charge[charge['trr_id'].isin(trr_ids)]
    print('Finished processing trr_charge_refresh')

    # remove rows without valid trr ids
    subjectweapon = cleaning.process_subjectweapon()
    subjectweapon = subjectweapon[subjectweapon['trr_id'].isin(trr_ids)]
    print('Finished processing trr_subjectweapon_refresh')

    # create directory for output
    os.makedirs('output/', exist_ok=True)

    # write all dataframes to csv
    output(trr, 'output/trr-trr.csv')
    output(trrstatus, 'output/trr-trrstatus.csv')
    output(weapondischarge, 'output/trr-weapondischarge.csv')
    output(actionresponse, 'output/trr-actionresponse.csv')
    output(charge, 'output/trr-charge.csv')
    output(subjectweapon, 'output/trr-subjectweapon.csv')

    print('END')


def output(df, filename):
    df.to_csv(filename, index=False, quoting=csv.QUOTE_NONNUMERIC, na_rep='NULL')
    replace_nulls(filename)


def replace_nulls(filename):
    with open(filename) as f:
        replaced = f.read().replace('"NULL"', '')
    with open(filename, "w") as f:
        f.write(replaced)


if __name__ == "__main__":
    main()
