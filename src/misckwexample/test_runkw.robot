*** Settings ***
Library          SeleniumLibrary
Library          String
Test Setup       Open Browser       https://www.google.com/           chrome
Test Teardown    Close Browser



*** Variables ***
${speed}      2s

*** Test Cases ***
test01_runkeywordif_example
   Input Text    q    robotframework\n
#    Sleep  5s
   Wait Until Element Is Visible    xpath=//div[@id='result-stats']    timeout=15s
   ${result_stat}    Get Text      xpath=//div[@id='result-stats']       
   Log To Console     ${result_stat}   
   ${total_results}   convert string literal to integar  ${result_stat}
   Log To Console    ${total_results}
   
   Click Element     id=tools_1
   Click Element    //div[contains(text(),'Any time')]
   Click Element    //span[contains(text(),'Custom range...')]
   Sleep  5s


*** Keywords ***
convert string literal to integar
    [Documentation]
    ...   convert numbered string eg; 23,4888,000 to integar
    ...   remove literal's from string
    ...   then convert to integar value
    [Arguments]    ${txtFromWebEle}
    
    ${result_data}     Split String    ${txtFromWebEle}    ${SPACE} 
    ${newString1}     Replace String     ${result_data}[1]   ,   ${EMPTY}
    ${convertedString}     Convert To Integer    ${newString1}
    RETURN   ${convertedString}



