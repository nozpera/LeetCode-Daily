import pandas as pd

def delete_duplicate_emails(person: pd.DataFrame) -> None:
    person.sort_values('id', inplace=True)
    person.drop(person.loc[person['email'].duplicated()].index, inplace=True)

    
    