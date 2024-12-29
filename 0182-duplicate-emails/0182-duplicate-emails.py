import pandas as pd

def duplicate_emails(person: pd.DataFrame) -> pd.DataFrame:
    if person['email'].duplicated().any():
        return person[['email']][(person['email'].duplicated(keep=False)) & (~person['email'].duplicated())]
    return person[['email']][person['email'].duplicated()]
    