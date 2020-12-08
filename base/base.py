import os
import time
from time import sleep

import allure
from selenium.common.exceptions import NoSuchElementException
from selenium.webdriver.support.wait import WebDriverWait

import page
from config import BASE_PATH, cap2
from tool.get_log import GetLogger

log = GetLogger.get_log()


class Base:

    def __init__(self, driver):
        log.info(f'正在初始化驱动对象{driver}')
        self.driver = driver

    def base_find_element(self, loc, timeout=10, poll=0.5):
        log.info(f'正在查找元素{loc}')
        return WebDriverWait(self.driver, timeout=timeout, poll_frequency=poll) \
            .until(lambda x: x.find_element(*loc))

    def base_click_element(self, loc):
        log.info(f"正在点击元素{loc}")
        self.base_find_element(loc).click()

    def base_input_value(self, loc, value):
        el = self.base_find_element(loc)
        log.info(f'正在清空元素{loc}')
        el.clear()
        log.info(f'向元素{loc}输入{value}')
        el.send_keys(value)

    def base_clear_value(self, loc):
        log.info(f'正在清空元素{loc}')
        self.base_find_element(loc).clear()

    def base_get_current_package_name(self):
        name = self.driver.current_package
        log.info(f'获取元素当前应用的包名为{name}')
        return name

    def base_get_current_activity(self):
        activity = self.driver.current_activity
        log.info(f'获取元素当前应用的包名为{activity}')
        return activity

    def base_get_element_text(self, loc):
        log.info(f'正在获取元素{loc}的text值')
        return self.base_find_element(loc).text

    def base_get_element_attribute_value(self, loc, att):
        log.info(f'获取元素{loc}的属性{att}的值')
        return self.base_find_element(loc).get_attribute(att)

    def base_if_app_is_install(self, package):
        log.info(f"判断app{package}是否已经安装")
        path = BASE_PATH + os.sep + 'data' + os.sep + 'chat.jbest.vip.apk'
        if self.driver.is_app_installed(package):
            log.info(f"app{package}已经安装,正在卸载")
            self.driver.remove_app(package)
            log.info(f"重新安装app{package}")
            self.driver.install_app(path)
        else:
            log.info(f"app{package}没有安装，正在进行安装")
            self.driver.install_app(path)

    def base_get_screenshot_as_file(self, module_name):
        path = BASE_PATH + os.sep + 'img' + os.sep + module_name + '-{}.png' \
            .format(time.strftime("%Y_%m_%d %H_%M_%S"))
        log.info(f'正在进行截图，路径为{path}')
        list1 = path.split('\\')
        list1.reverse()
        filename = list1[0]
        self.driver.get_screenshot_as_file(path)
        self.__base_write_img(path, filename)


    # 私有方法，将截图添加到报告中
    @staticmethod
    def __base_write_img(path, filename):
        log.info(f'正在将截图{filename}写入报告中')
        with open(path, 'rb') as f:
            log.info('打开文件')
            allure.attach(f.read(), f'这里是错误原因，截图名字:{filename}', allure.attachment_type.PNG)


    def base_down_swipe_up_find_element(self, loc_area, loc):
        log.info("正在调用从下向上滑动方法")
        try:
            # 查找区域元素
            el = self.base_find_element(loc_area, timeout=3)
            # 获取区域元素的位置,是区域的起始点（左上角），（y坐标）,返回值是一个字典
            y = el.location.get("y")
            x = el.location.get("x")
            print(el.location)
            # 获取区域元素宽高
            width = el.size.get("width")
            height = el.size.get("height")
            # 计算起始位置和终止位置的坐标点
            start_x = x + width * 0.5
            start_y = y + height * 0.8
            end_x = x + width * 0.5
            end_y = y + height * 0.2
        except:
            log.info('页面不需要滑动')
            return '页面不需要滑动'

        while True:
            source = self.driver.page_source
            try:
                self.base_find_element(loc, timeout=3)
                log.info(f"找到目标元素{loc}")
                return True
            except:
                log.info(f"未找到元素{loc},进行滑动，重新寻找")
                self.driver.swipe(start_x, start_y, end_x, end_y, duration=2000)
                log.info('正在进行刷新页面结构')
                self.base_click_element(page.fwq_new)
                self.base_click_element(page.fwq_hand_input)
                while True:
                    self.base_click_element(page.fwq_back_btn)
                    sleep(1)
                    try:
                        self.base_find_element(page.fwq_new)
                        break
                    except:
                        pass
            if source == self.driver.page_source:
                log.info("滑到最后一个屏幕，未找到元素")
                return False
                # raise NoSuchElementException

    def base_to_back_to_up(self, loc_area):
        log.info("正在调用返回顶部滑动方法")
        try:
            # 查找区域元素
            el = self.base_find_element(loc_area, timeout=3)
            # 获取区域元素的位置,是区域的起始点（左上角），（y坐标）,返回值是一个字典
            y = el.location.get("y")
            x = el.location.get("x")
            print(el.location)
            # 获取区域元素宽高
            width = el.size.get("width")
            height = el.size.get("height")
            # 计算起始位置和终止位置的坐标点
            start_x = x + width * 0.5
            start_y = y + height * 0.2
            end_x = x + width * 0.5
            end_y = y + height * 0.8
        except:
            log.info('页面不需要滑动')
            return '页面不需要滑动'
        while True:
            source = self.driver.page_source
            log.info('正在进行滑动')
            self.driver.swipe(start_x, start_y, end_x, end_y, duration=500)
            log.info('正在进行刷新页面结构')
            self.base_click_element(page.fwq_new)
            self.base_click_element(page.fwq_hand_input)
            while True:
                self.base_click_element(page.fwq_back_btn)
                sleep(1)
                try:
                    self.base_find_element(page.fwq_new)
                    break
                except:
                    pass
            if source == self.driver.page_source:
                log.info("回到列表最上端")
                return 'OK'

    def base_if_element_exist(self, loc):
        try:
            self.base_find_element(loc, 10)
            log.info(f'已经找到元素{loc}')
            return True
        except:
            log.info(f'没有找到元素{loc}')
            return False
