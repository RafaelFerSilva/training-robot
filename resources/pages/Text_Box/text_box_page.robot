*** Settings *** 
Library    Browser
Resource    ${EXECDIR}/resources/locators/Text_Box/text_box_locators.robot

*** Keywords *** 
Validate if the input for the user name is visible
    Get Text     ${INPUT_USER_NAME}
  
Insert text into the user's name field 
    [Arguments]     ${text} 
    Fill Text     ${INPUT_USER_NAME}     ${text} 
    Get Text      ${INPUT_USER_NAME}     ==     ${text}

Clear text in user's name field 
    Clear Text     ${INPUT_USER_NAME}

Validate whether the input for the user's email is visible 
    Get Text     ${INPUT_USER_EMAIL}
  
Insert text into the user's email field 
    [Arguments]     ${text} 
    Fill Text     ${INPUT_USER_EMAIL}     ${text} 
    Get Text     ${INPUT_USER_EMAIL}     ==     ${text}

Clear text in user's email field 
    Clear Text     ${INPUT_USER_EMAIL}

Validate that the input for the user's current address is visible 
    Get Text     ${TEXT_AREA_CURRENT_ADDRESS}

Insert text into the user's current address field 
    [Arguments]     ${text} 
    Fill Text     ${TEXT_AREA_CURRENT_ADDRESS}     ${text} 
    Get Text     ${TEXT_AREA_CURRENT_ADDRESS}     ==     ${text}

Clear text in user's current address field 
    Clear Text     ${TEXT_AREA_CURRENT_ADDRESS}

Validate that the input for the user's permanent address is visible 
    Get Text     ${TEXT_AREA_PERMANENT_ADDRESS}

Insert text into the user's permanent address field 
    [Arguments]     ${text} 
    Fill Text     ${TEXT_AREA_PERMANENT_ADDRESS}     ${text} 
    Get Text     ${TEXT_AREA_PERMANENT_ADDRESS}     ==     ${text}

Clear text in user's permanent address field 
    Clear Text     ${TEXT_AREA_PERMANENT_ADDRESS}

Validate if the submit button is visible 
    Get Text     ${SUBMIT_BUTTON}

Click on the submit button 
    Click    ${SUBMIT_BUTTON}
