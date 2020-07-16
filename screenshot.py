from selenium import webdriver
from time import sleep
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
import sys

params=sys.argv[1:]

param = str(params[0])
urlparam=str(params[1])

if(param == "chrome"):
    driver = webdriver.Remote("http://127.0.0.1:4444/wd/hub", DesiredCapabilities.CHROME)
    driver.get(urlparam)
    driver.get_screenshot_as_file("chrome_screenshot.png")
    driver.quit()
    print("screenshot for chrome")
else:
    driver = webdriver.Remote("http://127.0.0.1:4445/wd/hub", DesiredCapabilities.FIREFOX)
    driver.get(urlparam)
    driver.get_screenshot_as_file("firefox_screenshot.png")
    driver.quit()
    print("screenshot for firefox")
print("python script  end")
