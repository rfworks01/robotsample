import time
from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn
from selenium import webdriver
from selenium.webdriver.chrome.options import Options

ROBOT_LIBRARY_SCOPE = 'GLOBAL'
SelInstance = BuiltIn().get_library_instance("SeleniumLibrary")

@keyword("open chrome with '${url}'")
def open_chrome_with_url(url):

    # user_dir = str(Path.home() ) +'/AppData/Local/Google/Chrome/User Data'
    # print("using use-dir: " +user_dir)
    chrome_options = Options()
    #
    # # prefs = {"download.default_directory": "/some/path"}
    # # adding Chrome Profile Path
    # # chrome_options.add_argument('user-data-dir='+user_dir)
    # # chrome_options.add_argument('--profile-directory=Profile 2')
    chrome_options.add_argument('--disable-infobar')
    chrome_options.add_argument('--window-size=900,600')
    chrome_options.add_argument('--disable-blink-features=AutomationControlled')
    chrome_options.add_argument('--disable-extensions')
    # options.headless = headless_mode

    driver = webdriver.Chrome()
    driver.get(url)
    time.sleep(2)


@keyword("Init_Browser")
def init_browser(browser, url1, headless_mode=False):
    if browser == "chrome":
       options = Options()
    #    prefs = {"download.default_directory": "/some/path"}
       # adding Chrome Profile Path
       # options.add_argument = {'user-data-dir':'/Users/Application/Chrome/Default'}
       options.add_argument('--disable-infobar')
       options.add_argument('--window-size=900,600')
       options.add_argument('--disable-blink-features=AutomationControlled')
       options.add_argument('--disable-extensions')
       # options.headless = headless_mode
       # driver = BuiltIn().get_library_instance('SeleniumLibrary')
       driver = SelInstance;
       driver.open_browser(url=url1, browser=browser, options=options) #, executable_path=path)
       time.sleep(5)


@keyword("scroll vertical by pixel")
def scroll_vertical_by_pixel(pxNumber,numTimes=0):
    print("sample keyword")
    driver = SelInstance;
    for i in range(0,numTimes):
       driver.execute_javascript("window.scrollTo(0,"+pxNumber+");")
