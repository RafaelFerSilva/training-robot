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

The name of all checkboxes must be displayed when selecting the home checkbox 
    [Setup]     Select the sub-category Check Box of the category Elements and validate that the page title is Check Box 
    Select the item check box Home
    Validate the values ​​displayed in the result session
    [Teardown]    Uncheck the checkbox Home

The name of the check boxes related to the Downloads check box must be displayed in the result section when we select Downloads 
    [Setup]     Select the sub-category Check Box of the category Elements and validate that the page title is Check Box 
    Click to expand the check box group Home 
    Select the check box Downloads    
    Validate the values ​​displayed in the result session     wordFile     excelFile
    [Teardown]     Run Keywords     Uncheck the checkbox Downloads     AND     Click to collapse the check box group Home
    
The name of the check boxes related to the Desktop check box must be displayed in the result section when we select Desktop 
    [Setup]     Select the sub-category Check Box of the category Elements and validate that the page title is Check Box 
    Click to expand the check box group Home 
    Select the check box Desktop 
    Validate the values ​​displayed in the result session     desktop     notes     commands 
    [Teardown]     Run Keywords     Uncheck the checkbox Desktop     AND     Click to collapse the check box group Home

The name of the check boxes related to the Documents check box must be displayed in the result section when we select Documents 
    [Setup]     Select the sub-category Check Box of the category Elements and validate that the page title is Check Box 
    Click to expand the check box group Home 
    Select the check box Documents 
    Validate the values ​​displayed in the result session     
    ...    documents     
    ...    workspace     
    ...    react     
    ...    angular     
    ...    veu     
    ...    office     
    ...    public     
    ...    private     
    ...    classified     
    ...    general 
    [Teardown]     Run Keywords     Uncheck the checkbox Documents     AND     Click to collapse the check box group Home