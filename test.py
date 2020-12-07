import os
from time import sleep

from appium import webdriver
from selenium.webdriver.support.wait import WebDriverWait

# from tool.get_driver import GetDriver
#
# desired_caps = dict()
# # 平台名字大小写不区分
# desired_caps['platformName'] = 'Android'
# # 版本必须严格遵守，大版本可以兼容
# desired_caps['platformVersion'] = '9'
# # 设备名字可以随便写，不能为空，ios不能随便写
# desired_caps['deviceName'] = 'emulator-5554'
# desired_caps['appPackage'] = 'com.android.settings'
# desired_caps['appActivity'] = '.Settings'
# desired_caps['appPackage'] = 'com.android.calculator2'
# desired_caps['appActivity'] = '.Calculator'

# driver2 = webdriver.Remote('http://127.0.0.1:4723/wd/hub', desired_caps)
# driver2 = driver
# driver.close_app()
# driver2.start_activity('com.android.settings','.Settings')
# print('这是driver',driver)
# print('这是driver2',driver2)
# sleep(3)
#
# print('关闭driver,查看app是否关闭')
# sleep(3)
# driver2.close_app()
# print('关闭driver2,查看是否关闭')
# sleep(3)

# driver.find_element_by_id().click()
# driver.quit()
# print('彻底关闭driver后，driver是否为空：',driver)
# print('彻底关闭driver后，driver2是否为空：',driver2)

# driver2.quit()
# print('彻底关闭driver2后，driver是否为空：',driver)
# print('彻底关闭driver2后，driver2是否为空：',driver2)


# driver.find_element_by_accessibility_id()

# driver2 = GetDriver.get_app_driver2()
# driver3 = GetDriver

os.system(r'.\data\clear_session.bat')