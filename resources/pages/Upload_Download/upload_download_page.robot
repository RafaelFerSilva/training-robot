*** Settings *** 
Library       Browser
Resource      ${EXECDIR}/resources/locators/Upload_Download/upload_download_locators.robot

*** Keywords ***

Click on the file upload button 
    Click     ${BTN_UPLOAD}

Click on the File Download button 
    Click     ${BTN_DOWNLOAD}

Uploading a file by selector 
    [Arguments]   ${file_path}    ${file_name}

    ${file}=    Catenate    SEPARATOR=\\     ${file_path}       ${file_name}
    Upload File By Selector     ${BTN_UPLOAD}     ${file}

Validate file path after upload 
    [Arguments]     ${file_name}

    ${file}=    Catenate     SEPARATOR=\\    C:\\fakepath      ${file_name} 
    Get Text    ${UPLOAD_FILE_PATH}   ==     ${file}

Uploading a file 
    [Arguments]     ${file_path}     ${file_name}

    ${file}=    Catenate    SEPARATOR=\\     ${file_path}       ${file_name} 
    ${promise}=    Promise To Upload File    ${file}

    RETURN    ${promise}

Wait for a file to download 
    [Arguments]     ${file_name}

    ${file}=    Catenate     SEPARATOR=\\    ${FILES_DOWNLOAD_FOLDER}      ${file_name}     
    ${dl_promise}=    Promise To Wait For Download    ${file}

    RETURN    ${dl_promise}