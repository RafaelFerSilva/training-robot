*** Settings *** 
Resource    ${EXECDIR}/resources/pages/Links/links_page.robot

*** Keywords *** 
Validate if the links section to open a new tab is visible 
    Check the subtitle of the links screen     Following links will open new tab
    Check if the Home link is visible on the screen
    Check if the Home Dinamico link is visible on the screen

Validate if the links section to send an API call is visible 
    Check the subtitle of the links screen     Following links will send an api call
    Check if the Created link is visible on the screen 
    Check if the No Content link is visible on the screen 
    Check if the Moved link is visible on the screen
    Check if the Bad Request link is visible on the screen
    Check if the Unauthorized link is visible on the screen
    Check if the Forbidden link is visible on the screen
    Check if the Not Found link is visible on the screen

Click on the ${key} link to send a call to the API 
    Click on link ${key}

    IF  '${key}' == 'Moved' 
        Validate the response text of the Moved Permanently API link
    ELSE 
        Validate the response text of the ${key} API link
    END

Access the new tab by clicking on the link 
    [Arguments]     ${link}

    Click on link ${link} 
    ${previous}=    Switch Page     NEW
    Set Test Variable   ${CURRENT}     ${previous}

    RETURN    ${previous}
  
Return to main tab
     Switch Page     ${CURRENT}