*** Settings *** 
Resource        ${EXECDIR}/resources/keywords/common_keywords.robot 
Resource        ${EXECDIR}/resources/locators/Category/category_locators.robot

*** Keywords *** 
Validate if the category ${category} is visible 
    ${element}     Replace String     ${ITEM_CATEGORY}     $$     ${category} 
    Get text     ${element}

Validate if the sub-category ${sub_categoria} is visible in the category ${categoria} 
    ${element}     String Replace     ${ITEM_SUB_CATEGORY}     ${categoria}     ${sub_categoria}
    Get text    ${element}
  
Click on sub-category ${sub_category} give category ${category} 
    ${element}=     String Replace     ${ITEM_SUB_CATEGORY}     ${category}     ${sub_category}     
    Click     ${element}