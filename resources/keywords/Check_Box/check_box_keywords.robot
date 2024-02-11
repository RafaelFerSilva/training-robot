*** Settings *** 
Resource    ${EXECDIR}/resources/pages/Check_Box/check_box_page.robot

*** Keywords *** 
Click to expand the check box group ${check_box} 
    Click on the check box toggle button ${check_box} 
    Check if the check box ${check_box} is expanded

Click to collapse the check box group ${check_box} 
    Click on the check box toggle button ${check_box} 
    Check if the check box ${check_box} is collapsed
  
Select the item check box ${check_box} 
    Select the check box ${check_box}
    Validate if the check box ${check_box} is selected

Validate that the sub check boxes of the Home check box are visible 
    Check if the check box Desktop is visible 
    Check if the check box Documents is visible 
    Check if the check box Downloads is visible

Validate that the sub check boxes of the Home check box are not visible 
    Check if the check box Desktop is not visible 
    Check if the check box Documents is not visible 
    Check if the check box Downloads is not visible

Validate the values ​​displayed in the result session 
    [Arguments]    @{itens}
     Validate the checkbox items being displayed in the results section      ${itens}

Validate whether all check box items are displayed in the results section 
    Validate whether a list of all checkboxes are being displayed in the results section 

Unmark the check box for item ${check_box} 
    Uncheck the checkbox ${check_box} 
    Validate if the check box ${check_box} is not selected 
