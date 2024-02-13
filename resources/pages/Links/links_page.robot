*** Settings *** 
Library     Browser 
Resource    ${EXECDIR}/resources/keywords/common_keywords.robot
Resource    ${EXECDIR}/resources/locators/Links/links_locators.robot

*** Keywords *** 
Check the subtitle of the links screen 
    [Arguments]     ${sub_titulo}     
    ${element}=   Replace String      ${LINKS_H5_TITLE}     $$    ${sub_titulo} 
    Get Text    ${element}

Check if the ${key} link is visible on the screen
    [Documentation]     To access the Moved link, use the Moved Permanently key
    Get Text     ${LINKS}[${key}]

Click on link ${key} 
    Click    ${LINKS}[${key}]

Validate the response text of the ${key} API link 
    ${element}=     String Replace    ${LINK_RESPONSE_TEXT}     ${API_LINK_RESPONSE}[${key}]    ${key} 
    Get Text    ${element}