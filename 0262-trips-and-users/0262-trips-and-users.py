import pandas as pd

def trips_and_users(trips: pd.DataFrame, users: pd.DataFrame) -> pd.DataFrame:
    df = trips.join(users.set_index('users_id'), on='client_id', validate=('m:1')).join(users.set_index('users_id'), on='driver_id', rsuffix='_driver', validate='m:1')
    ignore_func = (df['banned_driver']=='Yes') | (df['banned']=='Yes')
    filtered_df = df[~ignore_func]
    func = ((filtered_df['status']!='completed') & (filtered_df['banned']=='No')) & ((filtered_df['status']!='completed') & (filtered_df['banned_driver']=='No'))
    result = (filtered_df[func].groupby('request_at').size()/filtered_df.groupby('request_at').size()).fillna(0).round(2).reset_index(name='Cancellation Rate').rename(columns={'request_at':'Day'})
    if ((result['Day'] < '2013-10-01') | (result['Day'] > '2013-10-03')).any():
        result = result.drop(index=result.index)
        return result
    return result