*** Settings ***
Library     Browser
Library     String
Library     FakerLibrary    locale=pt_BR

*** Variables ***
${LOGIN URL}                   https://demoqa.com/
${BROWSER}                     chromium     
${HEADLESS}                    false 
${VIEWPORT}                    {'width': 1920, 'height': 1080}

&{MONTHS}           1=January
...                 2=February
...                 3=March
...                 4=April
...                 5=May
...                 6=June
...                 7=July
...                 8=August
...                 9=September
...                 10=October
...                 11=November
...                 12=December

&{MONTHS_ABBREVIATION}      1=Jan
...                         2=Feb
...                         3=Mar
...                         4=Apr
...                         5=May
...                         6=Jun
...                         7=Jul
...                         8=Aug
...                         9=Sep
...                         10=Oct
...                         11=Nov
...                         12=Dec

*** Keywords ***
Configure New Page
    ${old_timeout}=     Set Browser Timeout     1m 30 seconds    
    New Page     ${LOGIN URL}
    Set Browser Timeout     ${old_timeout}

Open the browser on the DEMOQA website
    New Browser     browser=${BROWSER}     headless=${HEADLESS}     downloadsPath=${EXECDIR}\\assets\\download
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
    ${subjects}=              FakerLibrary.Words        nb=3 
    ${current_address}=       FakerLibrary.Address 
    ${permanent_address}=     FakerLibrary.Address
    ${age}=                   FakerLibrary.Random Number  digits=2 
    ${salary}=                FakerLibrary.Random Number  digits=4 
    ${department}=            FakerLibrary.Word
    ${mobile}=                FakerLibrary.Phone Number
    ${mobile}=                Remove String    ${mobile}  +  -  (    )    ${SPACE}
    ${mobile}=                Get Substring     ${mobile}  -10
    ${date_of_birth}=         FakerLibrary.Date Of Birth
    ${genre}=                 Set Variable   Male 
    @{hobbies_list}=          Create List       Sports    Reading    Music 
    ${state}=                 Set Variable    Uttar Pradesh  
    ${city}=                  Set Variable   Lucknow 
    @{user_subjects}          Create List    Arts    Biology

    &{user}=     Create Dictionary     name=${name} 
    ...                                last_name=${last_name} 
    ...                                email=${email}
    ...                                mobile=${mobile} 
    ...                                date_of_birth=${date_of_birth} 
    ...                                subjects=${subjects} 
    ...                                current_address=${current_address}
    ...                                permanent_address=${permanent_address} 
    ...                                age=${age} 
    ...                                salary=${salary} 
    ...                                department=${department} 
    ...                                genre=${genre} 
    ...                                hobbies_list=${hobbies_list} 
    ...                                state= ${state} 
    ...                                city= ${city} 
    ...                                subjects=${user_subjects} 
    ...                                user_picture=robot_logo.png

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

Return the href of an element 
    [Arguments]     ${element_with_href}

    ${elem}=          Get Element   ${element_with_href} 
    ${href}=          Get Property  ${elem}  href

    RETURN    ${href}

Insert value into a field Input 
    [Arguments]     ${locator}     ${value}

    Fill Text       ${locator}     ${value} 
    Get Text        ${locator}  ==  ${value}