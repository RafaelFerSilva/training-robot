*** Settings ***
Library     Browser
Resource    ${EXECDIR}/resources/keywords/common_keywords.robot 
Resource    ${EXECDIR}/resources/locators/Table/table_locators.robot

*** Keywords ***
Check if the Add button is visible
  Get Text    ${ADD_NEW_RECORD_BUTTON}    ==      Add

Check if the search input is visible
  Get Element By    selection_strategy=Placeholder   text=Type to search      exact=True

Check if the table is visible on the screen
  Get Text    ${TABLE}     *=      First Name\nLast Name\nAge\nEmail\nSalary\nDepartment\nAction

Check the contents of a cell in the table 
  [Arguments]     ${content} 
  ${element}=    Replace String     ${TABLE_ROW_ITEM}     $$     ${content} 
  Get Text     ${element}

Check if the contents of a cell are not in the table 
  [Arguments]     ${content} 
  ${element}=     String Replace     ${TABLE_ROW_ITEM}     $$     ${content} 
  Get Element States     ${element}     ==     detached

Insert text in the search field 
  [Arguments]     ${text} 
  Fill Text     ${TABLE_SEARCH_BOX}     ${text} 
  Get Text     ${TABLE_SEARCH_BOX}     ==     ${text}

Click on the button to delete a row from the table 
  [Arguments]     ${value} 
  ${element}=     String Replace     ${TABLE_ROW_ITEM_DELETE}     $$     ${value} 
  CLick     ${element}

Check if the table is empty 
  Get Text     ${TABLE_ROWS_NOT_FOUND}     ==     No rows found

Click to remove each item from the table 
  ${count}=     Get Element Count     ${DELETE_ICON} 
  FOR  ${index}  IN RANGE  ${count} 
      Click     (${DELETE_ICON})[1] 
  END

Click on the button to edit a row in the table 
  [Arguments]     ${value} 
  ${element}=    String Replace     ${TABLE_ROW_ITEM_EDIT}     $$     ${value} 
  CLick     ${element}

Click on the button to open the item registration form in the table
  CLick   ${ADD_NEW_RECORD_BUTTON}

Check if the registration modal is visible
  [Arguments]     ${status}=visible    ${wait}=10s
  Wait For Elements State   ${MODAL_HEADER}      ${status}     ${wait}   

Click to close table record modal
  CLick       ${MODAL_HEADER_CLOSE}

Insert a value in the name field
  [Arguments]     ${value}
  Fill Text   ${MODAL_HEADER_FIRST_NAME}      ${value}
  Get Text    ${MODAL_HEADER_FIRST_NAME}  ==  ${value}

Insert a value in the last name field
  [Arguments]     ${value}
  Fill Text   ${MODAL_HEADER_LAST_NAME}      ${value}
  Get Text    ${MODAL_HEADER_LAST_NAME}  ==  ${value}

Insert a value in the email field
  [Arguments]     ${value}
  Fill Text   ${MODAL_HEADER_EMAIL}      ${value}
  Get Text    ${MODAL_HEADER_EMAIL}  ==  ${value}

Insert a value in the age field
  [Arguments]     ${value}
  Fill Text   ${MODAL_HEADER_AGE}      ${value}
  ${string_value}=    Convert To String   ${value}
  Get Text    ${MODAL_HEADER_AGE}  ==  ${string_value}

Insert a value in the salary field
  [Arguments]     ${value}
  Fill Text   ${MODAL_HEADER_FIRST_SALARY}      ${value}
  ${string_value}=    Convert To String   ${value}
  Get Text    ${MODAL_HEADER_FIRST_SALARY}  ==  ${string_value}

Insert a value in the department field
  [Arguments]     ${value}
  Fill Text   ${MODAL_HEADER_DEPARTMENT}      ${value}
  Get Text    ${MODAL_HEADER_DEPARTMENT}  ==  ${value}

Click on the submit button on the table registration form
  Click   ${MODAL_HEADER_BUTTON_SUBMIT}