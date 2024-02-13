*** Settings ***
Library     Browser
Library     String
Library     FakerLibrary

*** Variables ***
${LOGIN URL}                   https://demoqa.com/
${BROWSER}                     chromium     
${HEADLESS}                    false 
${VIEWPORT}                    {'width': 1280, 'height': 720}

*** Keywords ***
Configure New Page
    ${old_timeout}=     Set Browser Timeout     1m 30 seconds    
    New Page     ${LOGIN URL}
    Set Browser Timeout     ${old_timeout}

Open the browser on the DEMOQA website
    New Browser     browser=${BROWSER}     headless=${HEADLESS} 
    New Context     viewport=${VIEWPORT}
    Configure New Page
    Get Title     ==     DEMOQA

Close the Browser
    Close Browser

String Replace
    [Documentation]  Replaces the ocurrences of '$$' for the respective strings.
    [Arguments]  ${template_string}  @{replacement_strings}

    FOR    ${string}    IN    @{replacement_strings}
        ${template_string} =   Replace String    ${template_string}   $$   ${string}    count=1
    END

    RETURN    ${template_string}

Create data for a fake user 
    ${name}=                  FakerLibrary.User Name 
    ${last_name}=             FakerLibrary.Last Name
    ${email}=                 FakerLibrary.Email 
    ${current_address}=       FakerLibrary.Address 
    ${permanent_address}=     FakerLibrary.Address
    ${age}=                   FakerLibrary.Random Number  digits=2 
    ${salary}=                FakerLibrary.Random Number  digits=4 
    ${department}=            FakerLibrary.Word

    &{user}=     Create Dictionary     name=${name}
    ...          last_name=${last_name} 
    ...          email=${email} 
    ...          current_address=${current_address} 
    ...          permanent_address=${permanent_address}
    ...          age=${age}
    ...          salary=${salary}
    ...          department=${department}

    RETURN     ${user}

Perform a simple mouse click
    [Arguments]     ${locator}      ${mouse_button}=left 
    Click   ${locator}      ${mouse_button}

Perform a double mouse click 
    [Arguments]     ${locator}     ${mouse_button}=left
    Click With Options      ${locator}      clickCount=2

Return to a tab by its ID 
    [Arguments]     ${id}
    Switch Page     ${id}
