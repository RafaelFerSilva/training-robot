*** Settings ***
Resource     ${EXECDIR}/resources/keywords/common_keywords.robot
Resource     ${EXECDIR}/resources/keywords/Home/home_keywords.robot

Suite Setup        Open the browser on the DEMOQA website
Suite Teardown     Close the Browser

*** Test Cases ***
The home page must be accessed when we access the url of the DEMOQ website 
    Validate if the home page is visible 
    [Teardown]     Return to the home screen by clicking on the TOOLSQA link
    
Should be redirected to the Elements card screen when clicking on the Elements card 
    Access the card screen Elements
    [Teardown]     Return to the home screen by clicking on the TOOLSQA link

Should be redirected to the card Forms screen when clicking on the card Forms 
    Access the card screen Forms 
    [Teardown]     Return to the home screen by clicking on the TOOLSQA link

Should be redirected to the Alerts, Frame & Windows card screen when clicking on the Alerts, Frame & Windows card 
    Access the card screen Alerts, Frame & Windows 
    [Teardown]     Return to the home screen by clicking on the TOOLSQA link

Should be redirected to the Widgets card screen when clicking on the Widgets card 
    Access the card screen Widgets        
    [Teardown]     Return to the home screen by clicking on the TOOLSQA link

Should be redirected to the Interactions card screen when clicking on the Interactions card 
    Access the card screen Interactions
    [Teardown]     Return to the home screen by clicking on the TOOLSQA link

Should be redirected to the Book Store Application card screen when you click on the Book Store Application card 
    Access the card screen Book Store Application and validate that the title Book Store
    [Teardown]     Return to the home screen by clicking on the TOOLSQA link