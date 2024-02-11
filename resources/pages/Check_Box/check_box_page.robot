*** Settings *** 
Library     Browser 
Resource    ${EXECDIR}/resources/locators/Check_Box/check_box_locators.robot
Resource    ${EXECDIR}/resources/keywords/common_keywords.robot

*** Keywords *** 
Click on the check box toggle button ${check_box} 
    ${element}=    String Replace    ${CHECK_BOX_TOOGLE_BUTTON}    $$    ${check_box}     
    Click       ${element}

Check if the check box ${check_box} is expanded
    ${element}=    String Replace    ${CHECK_BOX_EXPANDED}       $$      ${check_box} 
    Get Text    ${element}

Check if the check box ${check_box} is collapsed
    ${element}=    String Replace    ${CHECK_BOX_COLLAPSED}    $$      ${check_box} 
    Get Text    ${element}

Check if the check box ${check_box} is visible 
    ${element}=    String Replace  ${CHECKBOX_LABEL}    $$    ${CHECK_BOX_ITENS}[${check_box}] 
    Get Element States     ${element}   *=  visible

Check if the check box ${check_box} is not visible 
    ${element}=    String Replace    ${CHECKBOX_LABEL}     $$     ${CHECK_BOX_ITENS}[${check_box}] 
    Get Element States     ${element}     ==     detached

Select the check box ${check_box} 
    ${element}=    String Replace  ${CHECKBOX_LABEL}    $$    ${CHECK_BOX_ITENS}[${check_box}] 
    Check Checkbox      ${element}

Validate if the check box ${check_box} is selected
    ${element}=    String Replace  ${CHECKBOX_INPUT}    $$    ${CHECK_BOX_ITENS}[${check_box}] 
    Get Checkbox State      ${element}      ==    checked
