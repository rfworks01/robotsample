*** Settings ***
Library        SeleniumLibrary
Library        DateTime

*** Variables ***
${WEB}   https://www.google.com/
${BROWSER}   chrome
${TYPE OF FILE}   png
*** Keywords ***

Get DateTime
  ${date1}=  Get Current Date  result_format=%Y-%m-%d_%H-%M-%S_%p
  RETURN     ${date1}

Open Web
  Open Browser  ${WEB}   ${BROWSER}
  Maximize Browser Window
  ${Date}=  Get DateTime
  Set Global Variable  ${Path}    screenshots

Close Web
  Close Window
#   Close Browser

Screenshot
  [Arguments]  ${filename}
  Set Screenshot Directory  ${Path}
  Wait Until Page Contains  Element
  ${datetimeToken}=  Get DateTime
  Capture Page Screenshot  ${filename}_${datetimeToken}.${TYPE OF FILE}
  Log To Console  ${\n}Screenshot


*** Test Cases ***

Test01X1
    Open Web
    Screenshot    scr
    Close Web