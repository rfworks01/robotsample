*** Settings ***
Library       SeleniumLibrary
Suite Setup   Start Chrome With Options

# Suite Setup   Open Browser      https://www.google.com/    browser=chrome  options=Add Chrome Options


*** Test Cases ***
Starting a browser with a page
    Input Text     xpath=//*[@name='q']    playwright-robotframework\n
    Sleep    3s
    ${result_stat}   Get Text    id=result-stats
    Log To Console      ${result_stat}

*** Keywords ***
Start Chrome With Options
    ${options}  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method  ${options}  add_argument  --disable-notifications
    Call Method  ${options}  add_argument  --disable-infobars
    Call Method  ${options}  add_argument  --disable-extensions
    Call Method  ${options}  add_argument  --no-sandbox
    Call Method  ${options}  add_argument  --headless
    Call Method  ${options}  add_argument  --disable-dev-shm-usage
    Call Method  ${options}  add_argument  --log-level\=3
    # SeleniumLibrary.Open Browser  ${BASE_URL}  Chrome  options=${options}
    Open Browser      https://www.google.com/    browser=chrome  options=${options}
    



