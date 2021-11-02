import pandas as pd
import numpy as np

def to_int(d):
    return pd.to_numeric(d, errors='coerce').astype('Int64').replace({np.nan: None})

def to_bool(df, colname):
    df[colname].replace('Yes', True, inplace=True)
    df[colname].replace('Y', True, inplace=True)
    df[colname].replace('true', True, inplace=True)
    df[colname].replace('No', False, inplace=True)
    df[colname].replace('N', False, inplace=True)
    df[colname].replace('false', False, inplace=True)

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
        return 1000 + year
    elif year > 0 and year <= 5:
        return 2000 + year
    return year
