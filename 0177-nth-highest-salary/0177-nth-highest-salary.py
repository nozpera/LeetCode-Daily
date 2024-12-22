import pandas as pd

def nth_highest_salary(employee: pd.DataFrame, N: int) -> pd.DataFrame:
    values = list(employee['salary'].sort_values(ascending=False))
    result = [y for x,y in enumerate(values) if y not in values[:x]]
    if N > len(result):
        return pd.DataFrame({'getNthHighestSalary({})'.format(N):[None]})
    else:
        return pd.DataFrame({'getNthHighestSalary({})'.format(N):[result[N-1]]})