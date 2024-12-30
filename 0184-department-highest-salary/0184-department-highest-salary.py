import pandas as pd

def department_highest_salary(employee: pd.DataFrame, department: pd.DataFrame) -> pd.DataFrame:
    result = employee.join(department.set_index('id'), on='departmentId', lsuffix='_employee', rsuffix='_department', validate='m:1')
    result = result.rename(columns={'name_department':'Department','name_employee':'Employee','salary':'Salary'})
    max_salaries = result.groupby('Department')['Salary'].transform('max')
    result = result[result['Salary'] == max_salaries]
    return result[['Department','Employee','Salary']]