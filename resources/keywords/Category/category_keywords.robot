*** Settings *** 
Resource    ${EXECDIR}/resources/Pages/Category/category_page.robot
Resource    ${EXECDIR}/resources/keywords/Home/home_keywords.robot    

*** Keywords *** 
Validate whether the Elements category and its sub-categories are visible 
    Validate if the category Elements is visible 
    Validate if the sub-category Text Box is visible in the category Elements
    Validate if the sub-category Check Box is visible in the category Elements
    Validate if the sub-category Radio Button is visible in the category Elements
    Validate if the sub-category Web Tables is visible in the category Elements
    Validate if the sub-category Buttons is visible in the category Elements
    Validate if the sub-category Links is visible in the category Elements
    Validate if the sub-category Broken Links - Images is visible in the category Elements
    Validate if the sub-category Upload and Download is visible in the category Elements
    Validate if the sub-category Dynamic Properties is visible in the category Elements

Select the sub-category ${sub_category} of the category ${category} and validate that the page title is ${title} 
    Validate if the sub-category ${sub_category} is visible in the category ${category} 
    Click on sub-category ${sub_category} give category ${category} 
    Check the card page header ${title}