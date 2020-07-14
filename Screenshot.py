from selenium import webdriver
from time import sleep
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
import sys


param = str(sys.argv[1])
urlparam=str(str.sys.argv[2])
browser=""
port=""
screenshot=""

if(param="chrome"):
    browser=DesiredCapabilities.CHROME
    port=4050
    screenshot="chrome_screenshot.png"
else:
    browser=DesiredCapabilities.FIREFOX
    port=4051
    screenshot="firefox_screenshot.png"

driver = webdriver.Remote(
    command_executor='http://127.0.0.1:'+port,
    desired_capabilities=browser)

driver.get(urlparam)
sleep(1)

driver.get_screenshot_as_file(screenshot)
driver.quit()
