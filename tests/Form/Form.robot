*** Settings *** 
Resource     ${EXECDIR}/resources/utils/common_imports.robot 
Resource     ${EXECDIR}/resources/keywords/Form/form_keywords.robot

Suite Setup         Open the browser on the DEMOQA website
Test Setup          Run Keywords     Access the card screen Forms     AND    
...                 Select the sub-category Practice Form of the category Forms and validate that the page title is Practice Form    AND
...                 Validate if the student registration form page is visible 

Test Teardown       Return to the home screen by clicking on the TOOLSQA link
Suite Teardown      Close the Browser 

Test Tags  form

*** Test Cases *** 

It must be possible to register a new student 
    ${user}=     Create data for a fake user
    Fill in data for user registration     ${user}
    Validate the submit modal data of the form     ${user}
    Close the submit confirmation modal in the form
