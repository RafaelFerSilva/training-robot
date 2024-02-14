*** Settings *** 
Resource    ${EXECDIR}/resources/pages/Home/home_page.robot 
Resource    ${EXECDIR}/resources/pages/Form/form_page.robot

*** Keywords *** 
Validate if the student registration form page is visible 
    Check the card page header Practice Form
    Validate if the form title is visible

Fill in data for user registration 
    [Arguments]     ${user} 
    Insert user's first name              ${user}[name] 
    Insert user's last name               ${user}[last_name] 
    Enter user email                      ${user}[email] 
    Enter the student's gender            ${user}[genre] 
    Insert the user's cell phone          ${user}[mobile]
    Insert user's current address         ${user}[current_address]
    Insert user's date of birth           ${user}[date_of_birth]
    Upload a file                         ${EXECDIR}\\assets\    ${user}[user_picture] 
    Select student state                  ${user}[state]   
    Select student city                   ${user}[city]
    Select a subject for the student      ${user}[subjects] 
    Insert the student's hobbies          ${user}[hobbies_list] 
    Click on the finalize student registration button

Validate the submit modal data of the form 
    [Arguments]     ${user}

    Validate the title of the form's submit modal     Thanks for submitting the form 
    Validate if the Student Name line has the value ${user}[name] ${user}[last_name] 
    Validate if the Student Email line has the value ${user}[email] 
    Validate if the Gender line has the value ${user}[genre] 
    Validate if the Mobile line has the value ${user}[mobile] 
    Validate if the Picture line has the value ${user}[user_picture] 

    Validate the student's date of birth in the submit modal       ${user}[date_of_birth] 
    Validate the student's subjets in the submit modal             ${user}[subjects]
    Validate the student's hobbies in the submit modal             ${user}[hobbies_list] 
    Validate the student's address in the submit modal             ${user}[current_address] 
    Validate the student's state and city in the submit modal      ${user}[state]${user}[city] 

Close the submit confirmation modal in the form
    Click on the button to close the submit confirmation modal in the form 
    Validate if the submit modal title is not visible 