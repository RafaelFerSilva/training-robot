*** Settings *** 
Library     OperatingSystem
Resource    ${EXECDIR}/resources/keywords/common_keywords.robot
Resource    ${EXECDIR}/resources/pages/Upload_Download/upload_download_page.robot

*** Keywords *** 
Upload a file using the Selector 
    [Arguments]     ${file_path}    ${file_name} 
    Uploading a file by selector      ${file_path}    ${file_name} 
    Validate file path after upload     ${file_name}

Upload a file 
    [Arguments]     ${file_path}     ${file_name}

    ${promise}=     Uploading a file     ${file_path}     ${file_name} 
    Click on the file upload button 
    ${upload_result}=     Wait For     ${promise} 
    Validate file path after upload    ${file_name}

Downloading a file 
    [Arguments]     ${expected_file_name}

    ${dl_promise}=     Wait for a file to download     ${expected_file_name} 
    Click on the File Download button      
    ${file_obj}=     Wait For     ${dl_promise} 
    File Should Exist     ${file_obj}[saveAs]

Downloading a file via URL extracting the href 
    [Arguments]     ${element_with_href}

    ${href}=     Return the href of an element     ${element_with_href}     
    ${file_object}=     Download     ${href} 
    File Should Exist     ${file_object}[saveAs]

Downloading a file via URL 
    [Arguments]     ${url}

    ${file_object}=   Download    ${url} 
    File Should Exist    ${file_object}[saveAs]