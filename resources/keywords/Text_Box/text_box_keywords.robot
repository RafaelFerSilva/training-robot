*** Settings *** 
Library    FakerLibrary
Resource    ${EXECDIR}/resources/pages/Text_Box/text_box_page.robot

*** Keywords *** 
Validate if the Text Box screen form is visible 
  Validate if the input for the user name is visible 
  Validate whether the input for the user's email is visible 
  Validate that the input for the user's current address is visible 
  Validate that the input for the user's permanent address is visible 
  Validate if the submit button is visible

Fill in the form fields on the Text Box screen 
    [Arguments]    ${user}
    Insert text into the user's name field  ${user}[name] 
    Insert text into the user's email field  ${user}[email] 
    Insert text into the user's current address field     ${user}[current_address] 
    Insert text into the user's permanent address field     ${user}[permanent_address] 

Submit the form on the Text Box screen 
    Click on the submit button 

Clear the Text Box screen form fields 
    Clear text in user's name field 
    Clear text in user's email field 
    Clear text in user's current address field 
    Clear text in user's permanent address field 
  
Check the output of the Text Box screen form 
    [Arguments]     ${user} 
    Check if the user name is being displayed in the Text Box screen form output     ${user}[name]
    Check if the user email is being displayed in the Text Box screen form output      ${user}[email]
    Check if the current address is being displayed in the Text Box screen form output     ${user}[current_address]
    Check if the permanent address is being displayed in the Text Box screen form output     ${user}[permanent_address]
