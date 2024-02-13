*** Settings *** 
Resource        ${EXECDIR}/resources/utils/common_imports.robot 
Resource        ${EXECDIR}/resources/keywords/Upload_Download/upload_download_keywords.robot

Suite Setup         Open the browser on the DEMOQA website
Test Setup          Run Keywords     Access the card screen Elements     AND    
...                 Validate whether the Elements category and its sub-categories are visible    AND
...                 Select the sub-category Upload and Download of the category Elements and validate that the page title is Upload and Download

Test Teardown       Return to the home screen by clicking on the TOOLSQA link
Suite Teardown      Close the Browser 

Test Tags   elements    upload_download

*** Test Cases *** 
It must be possible to upload a file 
    Upload a file using the Selector     ${EXECDIR}\\assets\    robot_logo.png

It must be possible to upload a file - Promisse 
    Upload a file     ${EXECDIR}\\assets\     robot_logo.png 

Download a file 
    Downloading a file     sampleFile.jpeg

Download a file via URL 
    Downloading a file via URL     ${URL_BTN_DOWNLOAD}

Download a file by extracting the href 
    Downloading a file via URL extracting the href      ${BTN_DOWNLOAD}