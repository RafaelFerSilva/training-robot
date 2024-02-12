*** Settings *** 
Library     Browser 
Resource    ${EXECDIR}/resources/keywords/common_keywords.robot
Resource    ${EXECDIR}/resources/locators/Radio_button/radio_button_locators.robot

*** Keywords *** 
Check the radio button label ${label}
    ${element}=     String Replace      ${LABEL_RADIO}      $$  ${RADIO_IDS}[${label}] 
    Get Text    ${element}      ==      ${label}

Check the radio button input ${label} 
    ${element}=     String Replace      ${INPUT_RADIO}      $$      ${RADIO_IDS}[${label}] 
    Get Text    ${element}

Select radio button ${label} 
    ${element}=     String Replace      ${LABEL_RADIO}      $$      ${RADIO_IDS}[${label}] 
    Check Checkbox    ${element}

Validate if the radio button ${label} is selected 
    ${element}=    String Replace     ${INPUT_RADIO}     $$     ${RADIO_IDS}[${label}] 
    Get Element States     ${element}     *=     checked

Validate if the radio button ${label} is in a disabled state 
    ${element}=    String Replace     ${INPUT_RADIO}     $$     ${RADIO_IDS}[${label}] 
    Get Element States     ${element}     *=     disabled     unchecked

Check the result of the selected radio button ${label} 
    Get Text     ${RADIO_BUTTON_RESULT}     ==     ${label}
