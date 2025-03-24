*** Settings *** 
Library     Browser 
Library     String
Resource     ${EXECDIR}/resources/locators/Home/home_locators.robot

*** Keywords ***
Validate if the home banner is visible 
    Get Text     ${HOME_BANNER}

Validate if the ${card} card is visible 
    ${element}   Replace String    ${CARDS}   $$    ${card}
    Get Text     ${element}
  
Click on the ${card}
    ${element}      Replace String    ${CARDS}   $$    ${card} 
    Click     ${element}
  
Check the card page header ${card} 
    Get Text        //h1       ==    ${card}
  
Click on the TOOLSQA link in the card screen header
    Click     ${LINK_TOOLQA_HEADER}