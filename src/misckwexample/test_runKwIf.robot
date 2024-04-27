*** Settings ***
Library          SeleniumLibrary
Library          String
Test Setup       Open Browser       https://www.google.com/           chrome
Test Teardown    Close Browser



*** Variables ***
${speed}      2s

*** Test Cases ***
# test01_runkeywordif_example
#    Maximize Browser Window
#    Input Text    q    robotframework\n
#    Wait Until Element Is Visible    xpath=//div[@id='result-stats']    timeout=15s
#    ${result_stat}    Get Text      xpath=//div[@id='result-stats']       
#    Log To Console     ${result_stat}   
#    Sleep    5s
#    vertical Scroll by pixel  150
#    Sleep    2s
#    Capture Element Screenshot    css=div.I6TXqe
#    ${resultURLs}   Get WebElements    xpath=//cite[contains(@role,'text')] 
#    ${serachUrlCount}   Get Length    ${resultURLs}
#    Log To console     ${serachUrlCount}\[0]
#    ${textURL}    Get Text    ${resultURLs}[0]
#    Log To console     \n${textURL} 

#    #Check condition and execute other keyword
#    Run Keyword If   '${textURL}'=='https://robotframework.org'
#    ...    Click Element    ${resultURLs}[0]
   
   
#    ${pageTitle}   Get Title  
#    Log To Console     ${pageTitle}
#    Sleep    3s
#    ${title}   Get Text    css=h1.title
#    ${title}   Convert To String    ${title}
#    Log To Console     ${title}


#    Run Keyword If   '${pageTitle}' == 'Robot Framework'    Click Button      name=go-to-Getting started
#         Run Keywords
#         ...    Click Button      name=go-to-Resources
#         ...    AND     Sleep       3s
#         ...    AND     Click Button      name=go-to-Community
#         ...    AND     Sleep       3s
#         ...    AND     Click Button        name=go-to-Development
#         ...    AND     Sleep       3s
    
#    vertical Scroll by pixel  400
#    Sleep   3s
#    Capture Element Screenshot      xpath=//div[contains(@class,'container mb-xlarge')]/div[5]/div[2]/div[1]


test02_runkeywordif_example_user_manual_steps
   Search with some keyword    robotframework\n
   Scroll the webelement in proper view-port to capture Screenshot
   Collect all sites from search result
   User check if site-url is same and execute test   'https://robotframework.org'
   Verify page title
   Run multiple commands when title is meet
   Take screenshot of devloper banners  



*** Keywords ***
vertical Scroll by pixel
   [Arguments]    ${yPixel}     ${counter}==1
   ${counter}  Evaluate     1

   FOR    ${x}    IN RANGE    0   ${counter}    
       Log To Console    ${x}
       Execute Javascript       window.scrollBy(0,${yPixel})      
   END



#####
 Search with some keyword  
     [Arguments]   ${search_keyword}
     Maximize Browser Window
     Input Text    q    ${search_keyword}
     Wait Until Element Is Visible    xpath=//div[@id='result-stats']    timeout=15s
   ${result_stat}    Get Text      xpath=//div[@id='result-stats']       
   Log To Console     ${result_stat}   
   Sleep    5s

Scroll the webelement in proper view-port to capture Screenshot
   vertical Scroll by pixel  150
   Sleep    2s
   Capture Element Screenshot    css=div.I6TXqe
   
Collect all sites from search result
   ${resultURLs}   Get WebElements    xpath=//cite[contains(@role,'text')] 
   ${serachUrlCount}   Get Length    ${resultURLs}
   Log To console     ${serachUrlCount}\[0]
   ${textURL}    Get Text    ${resultURLs}[0]
   Set Test Variable    ${testURL}          ${textURL}
   Set Test Variable    ${searchSites}      ${resultURLs}
   Log To console     \n${testURL} 

User check if site-url is same and execute test
   [Arguments]     ${argURL}
   #Check condition and execute other keyword
   Run Keyword If   '${testURL}'==${argURL}
   ...    Click Element    ${searchSites}[0]

Verify page title
   ${pageTitle}   Get Title  
   Log To Console     ${pageTitle}
   Set Test Variable    ${page_title}      ${pageTitle}
   Sleep    3s
   ${title}   Get Text    css=h1.title
   ${title}   Convert To String    ${title}
   Log To Console     ${title}

Run multiple commands when title is meet
   Run Keyword If   '${page_title}' == 'Robot Framework'    Click Button      name=go-to-Getting started
      Run Keywords
      ...    Click Button      name=go-to-Resources
      ...    AND     Sleep       3s
      ...    AND     Click Button      name=go-to-Community
      ...    AND     Sleep       3s
      ...    AND     Click Button        name=go-to-Development
      ...    AND     Sleep       3s

Take screenshot of devloper banners
   vertical Scroll by pixel  400
   Sleep   3s
   Capture Element Screenshot      xpath=//div[contains(@class,'container mb-xlarge')]/div[5]/div[2]/div[1]







