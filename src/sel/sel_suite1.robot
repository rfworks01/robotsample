*** Settings ***
Library       SeleniumLibrary
Suite Setup   Open Browser      https://www.google.com/    browser=chrome

*** Test Cases ***
Starting a browser with a page
    Input Text     xpath=//*[@name='q']    playwright-robotframework\n
    Sleep    3s
    ${result_stat}   Get Text    id=result-stats
    Log To Console      ${result_stat}
