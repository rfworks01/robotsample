*** Settings ***
Documentation    different type of usage of eval keyword 


*** Variables ***
${KEYWORD_NAME}    My Keyword


*** Test Cases ***
Test Keyword as Variable
   Set Variable    ${Kw}    Evaluate     ${KEYWORD_NAME}
   Run Keyword If   '${Kw}' == 'My Keyword'     ${Kw}
   

*** Keywords ***
My Keyword
   Log To Console     This is my keyword.

