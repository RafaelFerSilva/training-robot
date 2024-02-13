*** Settings *** 
Resource     ${EXECDIR}/resources/utils/common_imports.robot 
Resource     ${EXECDIR}/resources/keywords/Button/button_keywords.robot

Suite Setup         Open the browser on the DEMOQA website
Test Setup          Run Keywords     Access the card screen Elements     AND    
...                 Validate whether the Elements category and its sub-categories are visible    AND
...                 Select the sub-category Buttons of the category Elements and validate that the page title is Buttons

Test Teardown       Return to the home screen by clicking on the TOOLSQA link
Suite Teardown      Close the Browser 

Test Tags     elements     button

*** Test Cases *** 
The message You have done a double click should be displayed if you click on the 
    Double click on the Double Click Me button
    Check if the message You have done a double click is visible

The message You have done a right click should be displayed if you click on the Right Click Me button 
    Click on the Right Click Me button 
    Check if the message You have done a right click is visible

The message You have done a dynamic click must be displayed if you click on the 
    Click on the Click Me button 
    Check if the message You have done a dynamic click is visible