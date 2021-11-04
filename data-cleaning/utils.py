import pandas as pd
import numpy as np

def to_int(d):
    return pd.to_numeric(d, errors='coerce').astype('Int64').replace({np.nan: None})

def to_bool(df, colname):
    df[colname].replace('Yes', 1, inplace=True)
    df[colname].replace('Y', 1, inplace=True)
    df[colname].replace('true', 1, inplace=True)
    df[colname].replace('No', 0, inplace=True)
    df[colname].replace('N', 0, inplace=True)
    df[colname].replace('false', 0, inplace=True)

def reconcile_race(df, colname):
    df[colname].replace('UNKNOWN', None, inplace=True)
    df[colname].replace('UNKNOWN / REFUSED', None, inplace=True)
    df[colname].replace('AMER IND/ALASKAN NATIVE', 'NATIVE AMERICAN/ALASKAN NATIVE', inplace=True)
    df[colname].replace('AMER INDIAN / ALASKAN NATIVE', 'NATIVE AMERICAN/ALASKAN NATIVE', inplace=True)
    df[colname].replace('ASIAN / PACIFIC ISLANDER', 'ASIAN/PACIFIC ISLANDER', inplace=True)
    df[colname].replace('WHITE HISPANIC', 'HISPANIC', inplace=True)
    df[colname].replace('BLACK HISPANIC', 'HISPANIC', inplace=True)

def reconcile_subject_birth_year(year):
    if year > 5 and year < 100:
        return 1900 + year
    elif year > 0 and year <= 5:
        return 2000 + year
    return year

def process_suffix(df, namecol, suffixcol):
    valid = set([
        suffix.capitalize() 
        for suffix in ['I','II','III','IV','V','JR','SR','JR.']
    ])
    names, suffixes = [], []
    for n in df[namecol]:
        splitname = n.split(' ')
        names.append(' '.join([e for e in splitname if e not in valid]))
        sf = [e for e in splitname if e in valid]
        suffixes.append(' '.join(sf) if len(sf) > 0 else None)
    df[namecol] = names
    df[suffixcol] = suffixes
    df[suffixcol] = df[suffixcol].str.upper()
    df[suffixcol].replace('JR.', 'JR', inplace=True)

def process_timestamp(df, colname):
    df[colname] = pd.to_datetime(df[colname], utc=True) \
        .dt.tz_convert('US/Central') \
        .dt.strftime('%Y-%m-%d %I:%M:%S %p')
