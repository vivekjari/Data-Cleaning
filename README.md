## Nashville Housing Dataset Cleaning with SQL

A dataset collected from a Nashville’s Housing company contains information about the customers and the housing along with the sale date and price.

However, Dataset contains multiple Null values and it is not organized in a way so that an analysis can be done and visualized.


## Data

- ***Property data:*** Unique ID, Property address, Land use, Tax District, Land Value, Building Value, Total Value, Bedrooms,  Baths, etc.
- ***Customer data:***  Owner Name, Owner Address, etc.
- ***Sale Data:***  Sale Date, Sale price, Legal reference, etc.


## Tasks

-To clean the available data by looking for null values and filling them. 
-Aggregating and splitting the columns as per the need. 
-Deleting the unwanted Data columns.

## Checkpoints

The checkpoints for the assignment are as follows:

1. Load the Dataset in MySQL.

2. Perform EDA to look for null values and misaligned data types.

3. change data type of ‘Sale_Date’ column to Date.

4. Populate the missing values in ‘PropertyAddress’ column having similar ParcelID but distinct UniqueID.

5. Now split the Property Address into Address, City, and State for better organizing of data.

6. Replace the data in ‘sold as vacant’ column, where Y with YES and N with NO to make the data uniform.

7. Delete the unwanted columns from the dataset. 



