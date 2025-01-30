*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections

*** Variables ***
${URL}    https://reqres.in/api/users/2

*** Test Cases ***
Get Request Test
    Create Session    reqres    ${URL}
    ${response}=    GET On Session    reqres    /
    ${response_body}=    Evaluate    json.loads('''${response.text}''')    json
    Log    ${response_body}    console=True
    Should Be Equal As Strings    200    ${response.status_code}
    ${data}=    Get From Dictionary    ${response_body}    data
    Should Not Be Empty    ${data}
