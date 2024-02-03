*** Settings *** 
Resource    ${EXECDIR}/resources/keywords/common_keywords.robot 
Resource    ${EXECDIR}/resources/keywords/Home/home_keywords.robot 
Resource    ${EXECDIR}/resources/keywords/Category/category_keywords.robot
Resource    ${EXECDIR}/resources/keywords/Text_Box/text_box_keywords.robot

Suite Setup     Run keywords     Open the browser on the DEMOQA website     AND 
...                              Access the card screen Elements     AND 
...                              Validate whether the Elements category and its sub-categories are visible 
Suite Teardown     Close the Browser 


Test Tags      elements

*** Test Cases *** 
It must be possible to fill in the Text Box form fields
    Select the sub-category Text Box of the category Elements and validate that the page title is Text Box
    Validate if the Text Box screen form is visible 
    Fill in the form fields on the Text Box screen 
    [Teardown]    Clear the Text Box screen form fields

página 45