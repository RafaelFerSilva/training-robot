*** Settings *** 
Resource     ${EXECDIR}/resources/utils/common_imports.robot 
Resource     ${EXECDIR}/resources/keywords/Table/table_keywords.robot

Suite Setup         Open the browser on the DEMOQA website
Test Setup          Run Keywords     Access the card screen Elements     AND    
...                 Validate whether the Elements category and its sub-categories are visible    AND
...                 Select the sub-category Web Tables of the category Elements and validate that the page title is Web Tables

Test Teardown       Return to the home screen by clicking on the TOOLSQA link
Suite Teardown      Close the Browser 

Test Tags      elements    web_tables

*** Test Cases *** 
It must be possible to access the web tables screen 
  Validate the page elements Table
  Validate the default content of the table

It must be possible to search for an item by the Email column 
  Search for an item in the table and validate that it is visible     alden@example.com 
  Check if the contents of a cell are not in the table      cierra@example.com 
  Check if the contents of a cell are not in the table      kierra@example.com table

It must be possible to search for an item by the Age column 
  Search for an item in the table and validate that it is visible     39 
  Check if the contents of a cell are not in the table     45 
  Check if the contents of a cell are not in the table     29

It must be possible to search for an item by the nSalary column 
  Search for an item in the table and validate that it is visible     2000 
  Check the contents of a cell in the table     12000 
  Check if the contents of a cell are not in the table     10000

It should be possible to remove an item from the table 
  Delete a row from the table    Kierra

It should be possible to remove all items from the table 
  Delete all items from the table
  Check if the table is empty

It must be possible to register an item in the table 
  ${user}=     Create data for a fake user
  Open the table item registration modal 
  Register a new item in the table     ${user}
  Check the contents of a cell in the table     ${user.name}
