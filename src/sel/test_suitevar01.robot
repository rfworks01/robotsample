*** Settings ***

*** Variables ***
${msg}     'This is var from section level'

*** Test Cases ***
Test01
  assign and use suite Variables
  access the suite-level variable

Test02
   access the suite-level variable

Test03
   access the suite-level variable

Test04
   access the suite-level variable

*** Keywords ***
assign and use suite Variables
    Set Suite Variable    ${var}      my_suite_var

access the suite-level variable
    Log To Console    \n
    Log To Console    ${var}
    Log To Console    ${msg}  


