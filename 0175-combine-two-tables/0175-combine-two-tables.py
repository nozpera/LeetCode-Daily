import pandas as pd

def combine_two_tables(person: pd.DataFrame, address: pd.DataFrame) -> pd.DataFrame:
    result = pd.merge(person, address, how='left', on='personId')
    sort_cols = ['firstName', 'lastName', 'city', 'state']
    return result[sort_cols]
    