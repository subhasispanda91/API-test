*** Settings ***
Library     RequestsLibrary


*** Variables ***
${url}     http://vtech--tst1.custhelp.com

*** Test Cases ***
Get request
       [Tags]     API Test
       Test Get Request API




*** Keywords ***
Test Get Request API
      Create Session    mysession    ${url}    verify=true
      create dictionary    content-type=application/json    clear-cache=no-cache
      ${response}=    GET On Session   mysession     /app/businessphones/utils/login_form111/
      ${res_code}=    convert to string    ${response.status_code}
      log to console    ${res_code}
      should be equal    ${res_code}    200
     ${res_body}=    convert to string    ${response.content}
     log to console    ${res_body}
