*** Settings *** 
Library    Browser 
Resource    ${EXECDIR}/resources/keywords/common_keywords.robot
Resource   ${EXECDIR}/resources/locators/Form/form_locators.robot

*** Keywords *** 
Validate if the form Title is visible 
    Get Text     ${FORM_TITLE}

Insert user's first name 
    [Arguments]     ${name}
    Insert value into a field Input       ${FIRST_NAME}     ${name} 

Insert user's last name
    [Arguments]    ${name}
    Insert value into a field Input       ${LAST_NAME}     ${name}

Enter user email 
    [Arguments]     ${email}
    Insert value into a field Input       ${USER_MAIL}     ${email} 

Insert user's current address
    [Arguments]    ${address}
    Insert value into a field Input    ${CURRENT_ADDRESS}    ${address}

Enter the student's gender
    [Documentation]     The options for gender today are: Male, Female or Other 
    [Arguments]     ${user_gender}

    ${element}=    String Replace      ${GENDER}    $$    ${user_gender}
    Check Checkbox      ${element}

Insert the user's cell phone 
    [Arguments]     ${mobile_phone} 
    Insert value into a field Input     ${MOBILE_NUMBER}     ${mobile_phone}

Insert user's date of birth 
    [Arguments]     ${date}

    ${insert_date}=    Catenate    ${date.month}    ${date.day}    ${date.year} 
    Fill Text       ${DATE_OF_BIRTH}         ${insert_date} 
    Press Keys      ${DATE_OF_BIRTH}         Enter

    ${date_input}=     Format date to day abbreviation month and year     ${date} 
    Get Text     ${DATE_OF_BIRTH}  ==  ${date_input}

Select a subject for the student 
    [Arguments]     @{user_subject}

    FOR  ${subject}  IN  @{user_subject}[0] 
        Insert value into a field Input    ${SUBJECTS}    ${subject} 
        Press Keys    ${SUBJECTS}    Enter 
    END

Insert the student's hobbies 
    [Documentation]     The options for hobbies today are: Sports, Reading or Music 
    [Arguments]     @{hobbies} 
    
    FOR  ${hobbi}  IN  @{hobbies}[0] 
        ${element}=    String Replace     ${CHECKBOX_HOBBIES_LABEL}     $$     ${hobbi} 
        Check Checkbox     ${element} 
    END

Upload a file 
    [Arguments]     ${file_path}     ${file_name}

    ${file}=    Catenate    SEPARATOR=\\     ${file_path}       ${file_name} 
    ${promise}=    Promise To Upload File    ${file}

    Click    ${UPLOAD_PICTURE} 
    ${upload_result}=    Wait For    ${promise} 

    ${file}=    Catenate     SEPARATOR=\\    C:\\fakepath      ${file_name} 
    Get Text    ${UPLOAD_PICTURE}   ==     ${file}

Select student state 
    [Arguments]     ${user_state}

    ${banner}=    Evaluate JavaScript    id=fixedban
    ...    document.getElementById("fixedban").style.display = "none";

    Insert value into a field Input    ${STATE}    ${user_state} 
    Press Keys    ${STATE}    Enter 
    Press Keys    ${STATE}    Tab

Select student city 
    [Arguments]     ${user_city}

    Insert value into a field Input     ${CITY}     ${user_city} 
    Press Keys     ${CITY}     Enter

Click on the finalize student registration button

    ${footer}=    Evaluate JavaScript    id=fixedban
    ...    document.evaluate('//footer', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null)
    ...    .singleNodeValue.style.display = "none";

    Click    ${SUBMIT_BUTTON}

Click on the button to close the submit confirmation modal in the form
    Click    ${CLOSE_LARGE_MODAL}

Validate the title of the form's submit modal 
    [Arguments]    ${title} 
    Get Text    ${MODAL_SUBMIT}  ==  ${title}

Validate if the ${label} line has the value ${value} 
    ${element}=    String Replace      ${TABLE_DATA}    $$    ${label}${value} 
    Get Text    ${element}

Format date to day abbreviation month and year 
    [Arguments]     ${date}
    ${mes}=    Convert To String    ${date.month} 
    ${date_input}=       Catenate    ${date.day}    ${MONTHS_ABBREVIATION}[${mes}]    ${date.year}

    ${day}=    Convert To String    ${date.day} 
    ${day_length}=    Get Length    ${day} 
    IF  ${day_length} == 1 
        ${date_input}=       Catenate    0${date.day}    ${MONTHS_ABBREVIATION}[${mes}]    ${date.year} 
    END

    RETURN    ${date_input}

Format date to day month, year 
    [Arguments]     ${date}
    ${mes}=    Convert To String    ${date.month} 
    ${date_input}=       Catenate    ${date.day}    ${MONTHS}[${mes}],${date.year}

    ${day}=    Convert To String    ${date.day} 
    ${day_length}=    Get Length    ${day} 
    IF  ${day_length} == 1 
        ${date_input}=       Catenate    0${date.day}    ${MONTHS}[${mes}],${date.year} 
    END

    RETURN    ${date_input}

Validate the student's date of birth in the submit modal 
    [Arguments]     ${date}

    ${data_input}=     Format date to day month, year     ${date} 
    Validate if the Date of Birth line has the value ${data_input}

Validate the student's subjets in the submit modal 
    [Arguments]     ${subjects}

    ${value}=     Catenate     SEPARATOR=,${SPACE}     @{subjects} 
    Validate if the Subjects line has the value ${value}

Validate the student's hobbies in the submit modal 
    [Arguments]     ${hobbies}

    ${value}=     Catenate     SEPARATOR=,${SPACE}     @{hobbies} 
    Validate if the Hobbies line has the value ${value}

Validate the student's state and city in the submit modal 
    [Arguments]     ${state_city}

    ${state_city}    Strip String    ${state_city}    mode=left 
    Validate if the State and City line has the value ${state_city}

Validate the student's address in the submit modal 
    [Arguments]     ${address}

    ${element}=     String Replace     ${address}     \n     ${EMPTY} 
    @{lines}=     Split To Lines     ${element} 
    ${value}=     Catenate     SEPARATOR=${SPACE}     @{lines} 
    Validate if the Address line has the value ${value}

Validate if the submit modal title is not visible 
    Wait For Elements State     ${MODAL_SUBMIT}      detached    10s
