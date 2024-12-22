import pandas as pd

def second_highest_salary(employee: pd.DataFrame) -> pd.DataFrame:
    values = list(employee['salary'].sort_values(ascending=False))
    result = [y for x,y in enumerate(values) if y not in values[:x]]
    if len(result) > 1:
        return pd.DataFrame({'SecondHighestSalary':[result[1]]})
    return pd.DataFrame({'SecondHighestSalary':[None]})
    

    