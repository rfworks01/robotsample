import time
from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn
from selenium import webdriver
from selenium.webdriver.chrome.options import Options

ROBOT_LIBRARY_SCOPE = 'GLOBAL'
SelInstance = BuiltIn().get_library_instance("SeleniumLibrary")

@keyword("open chrome with '${url}'")
def open_chrome_with_url(url):

  
    chrome_options = Options()
  
    chrome_options.add_argument('--disable-infobar')
    chrome_options.add_argument('--window-size=900,600')
    chrome_options.add_argument('--disable-blink-features=AutomationControlled')
    chrome_options.add_argument('--disable-extensions')
    chrome_options.add_argument('--no-sandbox')
    chrome_options.add_argument('--disable-dev-shm-usage')
    chrome_options.add_argument('--headless=True')
    chrome_options.add_argument('--log-level=3')

    driver = webdriver.Chrome(options=chrome_options)
    driver.get(url)
    time.sleep(2)


@keyword("Init_Browser")
def init_browser(browser, url1, headless_mode=False):
    if browser == "chrome":
       chrome_options = Options()
       chrome_options.add_argument('--disable-infobar')
       chrome_options.add_argument('--window-size=900,600')
       chrome_options.add_argument('--disable-blink-features=AutomationControlled')
       chrome_options.add_argument('--disable-extensions')
       chrome_options.add_argument('--no-sandbox')
       chrome_options.add_argument('--disable-dev-shm-usage')
       chrome_options.add_argument('--headless='+str(headless_mode))
       chrome_options.add_argument('--log-level=3')
    driver = SelInstance;
    driver.open_browser(url=url1, browser=browser, options=chrome_options) #, executable_path=path)
    time.sleep(5)


@keyword("scroll vertical by pixel")
def scroll_vertical_by_pixel(pxNumber,numTimes=0):
    print("sample keyword")
    driver = SelInstance;
    for i in range(0,numTimes):
       driver.execute_javascript("window.scrollTo(0,"+pxNumber+");")
