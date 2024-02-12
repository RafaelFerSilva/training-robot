*** Settings *** 
Library     Browser 
Resource    ${EXECDIR}/resources/pages/Radio_Button/radio_button_page.robot

*** Keywords *** 
Validate whether radio button labels are visible
    Check the radio button label Yes
    Check the radio button label Impressive
    Check the radio button label No

Validate whether radio button inputs are visible
    Check the radio button input Yes
    Check the radio button input Impressive
    Check the radio button input No

Check if the radio buttons are visible
    Validate whether radio button labels are visible 
    Validate whether radio button inputs are visible

Select the radio button ${label} and validate that the item was selected 
    Select radio button ${label}
    Validate if the radio button ${label} is selected 
    Check the result of the selected radio button ${label}

Validate if the radio button No is disabled 
    Validate if the radio button No is in a disabled state
