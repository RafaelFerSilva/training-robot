*** Settings ***

Library    Browser 
Resource    ${EXECDIR}/resources/locators/Button/button_locators.robot

*** Keywords ***

Check if the message for clicking on the Double Click Me button is visible 
    [Arguments]     ${message} 
    Get Text     ${DOUBLE_CLICK_MESSAGE}  ==  ${message}

Check if the message for clicking on the Right Click Me button is visible 
    [Arguments]     ${message} 
    Get Text     ${RIGHT_CLICK_MESSAGE}  ==  ${message}

Check if the message for clicking on the Click Me button is visible 
    [Arguments]     ${message} 
    Get Text     ${SIMPLE_CLICK_MESSAGE}  ==  ${message}