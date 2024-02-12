*** Settings *** 
Resource        ${EXECDIR}/resources/pages/Table/table_page.robot

*** Keywords *** 
Validate the page elements Table 
    Check if the Add button is visible 
    Check if the search input is visible
    Check if the table is visible on the screen

Validate the default content of the table 
    Check the contents of a cell in the table    Cierra 
    Check the contents of a cell in the table    Legal 
    Check the contents of a cell in the table    alden@example.com

Search for an item in the table and validate that it is visible 
    [Arguments]     ${item} 
    Insert text in the search field     ${item} 
    Check the contents of a cell in the table     ${item}

Delete a row from the table 
    [Arguments]     ${value} 
    Click on the button to delete a row from the table     ${value} 
    Check if the contents of a cell are not in the table     ${value}

Delete all items from the table 
    Click to remove each item from the table 
    Check if the table is empty

Open the table item registration modal 
    Click on the button to open the item registration form in the table
    Check if the registration modal is visible

Close the modal for registering items in the table 
    Click to close table record modal 
    Check if the registration modal is visible     detached

Fill in the registration modal data from the table 
    [Arguments]    ${user} 
    Insert a value in the name field           ${user.name} 
    Insert a value in the last name field      ${user.last_name} 
    Insert a value in the email field          ${user.email} 
    Insert a value in the age field            ${user.age} 
    Insert a value in the salary field         ${user.salary} 
    Insert a value in the department field     ${user.department}

Register a new item in the table 
    [Arguments]    ${user} 
    Fill in the registration modal data from the table    ${user} 
    Click on the submit button on the table registration form 
    Check if the registration modal is visible     detached