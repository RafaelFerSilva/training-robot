*** Settings *** 
Resource        ${EXECDIR}/resources/utils/common_imports.robot 
Resource        ${EXECDIR}/resources/keywords/Links/links_keywords.robot 

Suite Setup         Open the browser on the DEMOQA website
Test Setup          Run Keywords     Access the card screen Elements     AND    
...                 Validate whether the Elements category and its sub-categories are visible    AND
...                 Select the sub-category Links of the category Elements and validate that the page title is Links

Test Teardown       Return to the home screen by clicking on the TOOLSQA link
Suite Teardown      Close the Browser 

Test Tags  elements    links

*** Test Cases *** 
It must be possible to access the Links screen 
    Validate if the links section to open a new tab is visible  
    Validate if the links section to send an API call is visible 

It should be possible to make an API call by clicking the links 
    Click on the Created link to send a call to the API 
    Click on the No Content link to send a call to the API 
    Click on the Moved link to send a call to the API 
    Click on the Bad Request link to send a call to the API 
    Click on the Unauthorized link to send a call to the API 
    Click on the Forbidden link to send a call to the API 
    Click on the Not Found link to send a call to the API 

Must be redirected to the home page when clicking on the simple link 
    Access the new tab by clicking on the link    Home     
    Validate if the home page is visible

    [Teardown]      Run Keywords    Return to a tab by its ID     ${CURRENT}     AND     
    ...             Return to the home screen by clicking on the TOOLSQA link

Must be redirected to the home page when clicking on the dinamic link 
    Access the new tab by clicking on the link    Home Dinamico     
    Validate if the home page is visible

    [Teardown]      Run Keywords    Return to a tab by its ID     ${CURRENT}     AND     
    ...             Return to the home screen by clicking on the TOOLSQA link
