import pandas as pd

def rising_temperature(weather: pd.DataFrame) -> pd.DataFrame:
    weather = weather.sort_values('recordDate')
    return weather[['id']][(weather.recordDate - weather.recordDate.shift(1) == pd.Timedelta(days=1)) & (weather.temperature > weather.temperature.shift(1))] 