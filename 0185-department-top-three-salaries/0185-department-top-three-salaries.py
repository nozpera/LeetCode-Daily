import pandas as pd

def top_three_salaries(employee: pd.DataFrame, department: pd.DataFrame) -> pd.DataFrame:
    result = employee.join(department.set_index('id'), on='departmentId', lsuffix='_employee', rsuffix='_department', validate='m:1')
    result.rename(columns={'name_employee':'Employee','name_department':'Department','salary':'Salary'},inplace=True)
    result['rank'] = result.groupby('Department')['Salary'].rank(method='dense',ascending=False).astype(int)
    result = result.sort_values(by=['Department','rank'])
    return result[['Department','Employee','Salary']][result['rank'] <= 3]
    