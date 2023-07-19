*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections


*** Variables ***


*** Test Cases ***
Post request
       [Tags]     API Test
       [Documentation]      API post request sanity testing
       Test POST Request API




*** Keywords ***
Test POST Request API
      Create Session    mysession    https://jsonplaceholder.typicode.com    verify=true
      ${body}=      Create Dictionary    title=foo  body=bar  userId=9001
      ${header}=    Create Dictionary    Cache-Control=no-cache
      ${response}=  Post on session    mysession    /posts   data=${body}    headers=${header}

      ${res_code}=    convert to string    ${response.status_code}
      log to console    ${res_code}
     ${id}=  Get Value From Json  ${response.json()}  id
    ${idFromList}=  Get From List   ${id}  0
    ${idFromListAsString}=  Convert To String  ${idFromList}
    Should be equal As Strings  ${idFromListAsString}  101

