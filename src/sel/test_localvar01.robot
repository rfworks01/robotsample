*** Variables ***
${msg}     'This is var from section level'
${arg1}

*** Test Cases ***
Test01
   define local level variable

Test02
   my keyword1   ${arg1}

*** Keywords ***
define local level variable
      
    ${hi}    Set Variable       Hello, world!
    Log To Console    \n
    Log To Console    ${hi}
    Log To Console    ${hi}
    ${arg1} Set Variable   ${hi}
    # ${arg1} = ${hi}
my keyword1
  [Arguments]  ${arg1}
  Log To Console    ${arg1}

