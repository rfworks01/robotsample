*** Settings ***
Library    SeleniumLibrary
Library    Screenshot
Library    OperatingSystem  

Test Setup     Open Browser   https://www.google.com/      chrome
Test Teardown  Close Browser

*** Variables ***
${dir}      ${EXECDIR}/screens

*** Test Cases ***
# Test01- attach screenshot to report as default
#     Maximize Browser Window 
#     Log To Console    ${EXECDIR}
#     Input Text    q    robotframework\n
#     Sleep  3s
#     # Screenshot.Set Screenshot Directory     ${EXECDIR}/screens
#     Screenshot.Take Screenshot  ${EXECDIR}/screens/01.png
#     Capture Page Screenshot    ${dir}/file-{index}.png
#     Click Element    //h3
#     Sleep  3s



# Tes02-attach screenshot with save file
#     Log To Console    ${EXECDIR}
#     Go To      https://demo.snipeitapp.com/login
#     Sleep    3s
#     Maximize Browser Window
#     Input Text     username    admin
#     Input Text     password    password
#     Screenshot.Take Screenshot
#     Click Button   //button[contains(text(),'Login')]  
    # Sleep   3s
    # # Screenshot.Set Screenshot Directory    img1 
    # Screenshot.Take Screenshot    
    



Test03-attach screenshot with fixed width
    Log To Console    ${EXECDIR}
    Go To      https://demo.snipeitapp.com/login
    Maximize Browser Window
    Input Text     username    admin
    Input Text     password    password
    Click Button   //button[contains(text(),'Login')]  
    Sleep   6s
    ${asset_table}   Get WebElement    //h2[contains(text(),'Asset Categories')] 
    Scroll Element Into View    ${asset_table}
    Sleep  3s
    ${chart_ele}     Get WebElement    //div[@class='col-md-4']/div
    Execute Javascript    arguments[0].scrollIntoView({behavior: "smooth", block: "center", inline: "nearest"})      ARGUMENTS    ${chart_ele} 
    Capture Element Screenshot       //div[@class='col-md-4']/div     ./reports/ele-{index}.png
    # Execute Javascript    arguments[0].scrollIntoView({behavior: "smooth", block: "center", inline: "nearest"})      ARGUMENTS      ${asset_table}
    # sleep   1s
    sleep   3s
    Execute Javascript    arguments[0].scrollIntoView({block: "center", inline: "nearest"})      ARGUMENTS      ${asset_table}
    sleep   3s
    Execute Javascript    window.scrollTo(0,2500)
    sleep   3s
*** Keywords ***



#--outputdir reports/%date:~-4,4%%date:~-10,2%%date:~-7,2% --timestampoutputs