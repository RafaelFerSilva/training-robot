*** Settings *** 
Resource     ${EXECDIR}/resources/pages/Home/home_page.robot

*** Keywords *** 
Validate if the cards are visible on the home
    Validate if the Elements card is visible 
    Validate if the Forms card is visible 
    Validate if the Alerts, Frame & Windows card is visible 
    Validate if the Widgets card is visible 
    Validate if the Interactions card is visible 
    Validate if the Book Store Application card is visible

Validate if the home page is visible
    Validate if the home banner is visible 
    Validate if the cards are visible on the home

Access the card screen ${card} 
    Click on the ${card} 
    Check the card page header ${card}
  
Access the card screen ${card} and validate that the title ${title} 
    Click on the ${card} 
    Check the card page header ${title} 

Return to the home screen by clicking on the TOOLSQA link 
    Click on the TOOLSQA link in the card screen header
    Validate if the home page is visible