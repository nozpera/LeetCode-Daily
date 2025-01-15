import pandas as pd

def gameplay_analysis(activity: pd.DataFrame) -> pd.DataFrame:
    first_login = activity.groupby('player_id')['event_date'].min().reset_index(name='first_login')
    activity['day_before_event'] = activity['event_date'] - pd.Timedelta(days=1)
    merged_df = activity.merge(first_login, on='player_id', suffixes=('_actual', '_first'))
    consecutive_login = merged_df[merged_df['day_before_event'] == merged_df['first_login']]
    fraction = round(consecutive_login['player_id'].nunique() / activity['player_id'].nunique(), 2)
    return pd.DataFrame({'fraction':[fraction]})