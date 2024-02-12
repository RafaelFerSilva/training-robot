*** Settings *** 
Resource        ${EXECDIR}/resources/utils/common_imports.robot 
Resource        ${EXECDIR}/resources/keywords/Radio_Button/radio_button_keywords.robot

Suite Setup     Open the browser on the DEMOQA website

Test Setup      Run keywords     Access the card screen Elements     AND 
...             Validate whether the Elements category and its sub-categories are visible     AND
...             Select the sub-category Radio Button of the category Elements and validate that the page title is Radio Button    AND
...             Check if the radio buttons are visible

Test Teardown      Return to the home screen by clicking on the TOOLSQA link
Suite Teardown     Close the Browser 

Test Tags      elements    radio_button

*** Test Cases *** 
The text You have selected Yes must be returned when the radio button Yes is selected 
    Select the radio button Yes and validate that the item was selected

The text You have selected Impressive must be returned when the radio button Impressive is selected 
    Select the radio button Impressive and validate that the item was selected

The radio button must be disabled.
    Validate if the radio button No is disabled
