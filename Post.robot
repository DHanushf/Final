*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections

*** Variables ***
${POST_URL}    https://reqres.in/api/users
${GET_URL}     https://reqres.in/api/users?page=2
${HEADERS}     {"Content-Type": "application/json"}
${PAYLOAD}     {"name": "Dhanush", "job": "Reddy"}

*** Test Cases ***
Post Request Test
    Create Session    reqres    ${POST_URL}   
    ${response}=    POST On Session    reqres    /    data=${PAYLOAD}
    Log    ${response.text}    console=True
    ${response_body}=    Evaluate    json.loads('''${response.text}''')    json
    Log    ${response_body}    console=True
    Should Be Equal As Strings    201    ${response.status_code}
    ${id}=    Get From Dictionary    ${response_body}    id
    Should Not Be Empty    ${id}

Get Request Test
    Create Session    reqres    ${GET_URL}
    ${response}=    GET On Session    reqres    /
    ${response_body}=    Evaluate    json.loads('''${response.text}''')    json
    Log    ${response_body}    console=True
    Should Be Equal As Strings    200    ${response.status_code}
    ${data}=    Get From Dictionary    ${response_body}    data
    Should Not Be Empty    ${data}
