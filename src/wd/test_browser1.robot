*** Settings ***
Library    SeleniumLibrary
Library    ../customlib/browserwork.py


*** Test Cases ***
 Test01_checkbrowser
     Init Browser    url1=https://www.google.com/     browser=chrome
     Sleep    3s
     Input Text     q        selenium\n
     sleep    4s
     scroll vertical by pixel   300   3
     Log To Console    \n${EXECDIR}
     sleep    4s


