*** Settings ***
Library    SeleniumLibrary
Library    Screenshot
Library    OperatingSystem  

Test Setup     Open Browser   https://yopmail.com/#google_vignette      chrome
Test Teardown  Close Browser


*** Test Cases ***
Test01_yopmail.com
     Input Text    id=login    joymika
     Click Element    css=div#refreshbut
     Wait Until Element Is Visible    css=div.ycptalias         timeout=15s
     Select Frame    id=ifinbox
     #Wait Until Element Is Visible    body.bodyinbox.yscrollbar     timeout=15s
     
     ${inboxEle}       Get WebElements    xpath=//div[@class='m']
     ${inboxEleCount}       Get Length    ${inboxEle}
     Log To Console    ${inboxEleCount}
     Click Element     ${inboxEle}[1]
     Unselect Frame

     Sleep     5s
     Select Frame    id=ifmail
     ${getCode}      Get WebElements    xpath=//tbody/tr/td/p
     ${eLen}         Get Length    ${getCode}
     Log To Console    ${eLen}
     ${codeText}     Get Text    ${getCode}[1]
     Log To Console    ${codeText}