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
    ${name}=     FakerLibrary.User Name 
    ${email}=     FakerLibrary.Email 
    ${current_address}=     FakerLibrary.Address 
    ${permanent_address}=     FakerLibrary.Address

    Insert text into the user's name field  ${name} 
    Insert text into the user's email field  ${email} 
    Insert text into the user's current address field     ${current_address} 
    Insert text into the user's permanent address field     ${permanent_address} 

Submit the form on the Text Box screen 
    Click on the submit button 

Clear the Text Box screen form fields 
    Clear text in user's name field 
    Clear text in user's email field 
    Clear text in user's current address field 
    Clear text in user's permanent address field 
    Take Screenshot     log_screenshot=true