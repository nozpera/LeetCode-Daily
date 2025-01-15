import pandas as pd

def find_managers(employee: pd.DataFrame) -> pd.DataFrame:
    result = employee.join(employee.set_index('managerId'), on='id', how='inner', rsuffix=('_employee'))
    filtered = result.groupby('id')['id'].count().reset_index(name='count')
    manager_id = filtered[filtered['count'] >= 5]['id']
    return employee[employee['id'].isin(manager_id)][['name']]