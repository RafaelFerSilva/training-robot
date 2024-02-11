*** Settings *** 
Resource        ${EXECDIR}/resources/keywords/common_keywords.robot 
Resource        ${EXECDIR}/resources/keywords/Home/home_keywords.robot 
Resource        ${EXECDIR}/resources/keywords/Category/category_keywords.robot
Resource        ${EXECDIR}/resources/keywords/Check_Box/check_box_keywords.robot

Suite Setup     Run keywords     Open the browser on the DEMOQA website     AND
...                              Access the card screen Elements     AND
...                              Validate whether the Elements category and its sub-categories are visible 
Suite Teardown     Close the Browser 

Test Tags  elements    check_box

*** Test Cases *** 
The Desktop, Documents and Downloads check boxes must be displayed when expanding the Home check box 
    [Setup]     Select the sub-category Check Box of the category Elements and validate that the page title is Check Box 

    Click to expand the check box group Home
    Validate that the sub check boxes of the Home check box are visible 

    [Teardown]    Run Keywords    Click to collapse the check box group Home    AND
    ...                           Validate that the sub check boxes of the Home check box are not visible 
