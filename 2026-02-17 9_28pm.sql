from snowflake.snowpark import Session
from snowflake.snowpark.functions import col

# Connection parameters
connection_parameters = {
    "account": "your_account",
    "user": "your_username",
    "password": "your_password",
    "role": "your_role",
    "warehouse": "your_warehouse",
    "database": "SNOWFLAKE",
    "schema": "INFORMATION_SCHEMA"
}

# Create session
session = Session.builder.configs(connection_parameters).create()

# Query the table
dataframe = session.table("PACKAGES")\
                   .filter(col("language") == 'python')

# Show results
dataframe.show()

# Close session
session.close()