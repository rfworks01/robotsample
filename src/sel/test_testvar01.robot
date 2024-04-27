*** Variables ***
${msg}     'This is var from section level'

*** Test Cases ***
Test01
   define test level variable
   access the test-level variable
   again access test-level variable with same test

Test02
   access the test-level variable

Test03
   access the test-level variable

*** Keywords ***
define test level variable
    Set Test Variable    ${T1}   This is test variable
    Log To Console    \n

again access test-level variable with same test
    Log To Console    ${T1}

access the test-level variable
    Log To Console    ${T1}