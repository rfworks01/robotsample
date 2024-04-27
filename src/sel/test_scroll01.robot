*** Settings ***
Library    SeleniumLibrary
Library    ../customlib/browserwork.py


*** Test Cases ***
 Test01_checkbrowser
     Init Browser    url1=https://www.google.com/     browser=chrome  headless_mode=True
     Sleep    1s
     Input Text     q        selenium\n
     sleep    1s
     scroll vertical by pixel   300   3
     Log To Console    \n${EXECDIR}
     sleep    1s
     

