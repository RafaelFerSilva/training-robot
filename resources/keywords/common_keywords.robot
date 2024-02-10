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
    ${email}=                 FakerLibrary.Email 
    ${current_address}=       FakerLibrary.Address 
    ${permanent_address}=     FakerLibrary.Address

    &{user}=     Create Dictionary     name=${name} 
    ...          email=${email} 
    ...          current_address=${current_address} 
    ...          permanent_address=${permanent_address}

    RETURN     ${user}
