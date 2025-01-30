*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary    

*** Variables ***
${URL}    https://att.com
${BROWSER}    chrome

*** Test Cases ***
Open Browser And Check Title
    [Documentation]    Open the browser and check the title of the page
    Open Browser    ${URL}    ${BROWSER}
    Title Should Be    Example Domain
    Close Browser