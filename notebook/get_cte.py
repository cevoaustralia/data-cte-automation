import pandas as pd

# storing csv path 
product_csv = "csv/products.csv"
output_sql = "sql/output.sql"

def get_cte(csv_path, table_name):
    """
    Generates a Common Table Expression (CTE) SQL query from a CSV file.

    Args:
        csv_path (str): The file path to the CSV file.
        table_name (str): The desired name for the CTE table.

    Returns:
        str: A CTE SQL query string that can be used to create a temporary table
             with the data from the CSV file.
    """
    
    df_csv = pd.read_csv(csv_path)
    # Determining the Column Names 
    column_names = ', '.join(df_csv.columns.to_list())

    sql_values = []
    for index, row in df_csv.iterrows():
        values_str = "(" + ", ".join([str(val) if isinstance(val, (int, float)) else f"'{val}'" for val in row.values]) + ")"
        sql_values.append(values_str)

    values_statement = ",\n".join(sql_values)

    cte_query = f"""
WITH {table_name} ({column_names}) AS (
VALUES 
{values_statement}
)
SELECT * FROM temp_product tp
    """
    return cte_query

sql_file = open(output_sql, "w")
sql_file.write(get_cte(product_csv, 'temp_product'))
sql_file.close()

print(f"Please find the SQL script at the path {output_sql}")