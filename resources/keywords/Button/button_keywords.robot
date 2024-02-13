*** Settings *** 
Resource    ${EXECDIR}/resources/keywords/common_keywords.robot 
Resource    ${EXECDIR}/resources/pages/Button/button_page.robot

*** Keywords *** 
Double click on the Double Click Me button 
    Perform a double mouse click     ${DOUBLE_CLICK_BTN}

Check if the message You have done a double click is visible 
    Check if the message for clicking on the Double Click Me button is visible      You have done a double click

Click on the Right Click Me button 
    Perform a simple mouse click     ${RIGHT_CLICK_BTN}     right

Check if the message You have done a right click is visible 
    Check if the message for clicking on the Right Click Me button is visible     You have done a right click

Click on the Click Me button 
    Perform a simple mouse click     ${SIMPLE_CLICK_BTN}

Check if the message You have done a dynamic click is visible 
    Check if the message for clicking on the Click Me button is visible     You have done a dynamic click
