from time import sleep

from selenium.webdriver.common.by import By

import page
from base.base import Base
from tool.get_log import GetLogger

log = GetLogger.get_log()


class PageFwq(Base):

    def page_click_add_fwq_btn(self):
        log.info('点击添加服务器按钮')
        self.base_click_element(page.fwq_new)

    def page_select_hand_input(self):
        log.info('选择手工输入模式')
        self.base_click_element(page.fwq_hand_input)

    def page_input_fwq_name(self, name):
        log.info(f'输入服务器名字为{name}')
        self.base_input_value(page.fwq_input_name, name)

    def page_input_fuq_URL(self, URL):
        log.info(f"输入服务器地址为{URL}")
        self.base_input_value(page.fwq_input_URL, URL)

    def page_click_save_btn(self):
        log.info("点击保存按钮")
        self.base_click_element(page.fwq_save_btn)

    def page_click_back_btn(self):
        log.info('点击返回按钮')
        self.base_click_element(page.fwq_back_btn)

    def page_if_add_success(self, name, url):
        log.info(f'正在确认服务器{name},url{url},是否添加成功')
        loc = By.XPATH, '//*[contains(@content-desc,"{}")]'.format(name + ' ' + url)
        # 滑动判断结果
        re = self.base_down_swipe_up_find_element(page.fwq_swipe_area, loc)
        if re == '页面不需要滑动':
            try:
                self.base_find_element(loc)
                return True

            except:
                return False
        else:
            return re

    def page_hand_add_fwq(self, name, url):
        log.info('正在调用手工添加服务器组合业务逻辑方法')
        self.page_click_add_fwq_btn()
        self.page_select_hand_input()
        self.page_input_fwq_name(name)
        self.page_input_fuq_URL(url)
        sleep(1)
        self.page_click_save_btn()
        # sleep(3)

    def page_click_modify_btn(self, name, url):
        log.info(f'正在点击服务器{name},url{url}的修改按钮')
        loc = By.XPATH, '//*[contains(@content-desc,"{}")]' \
                        '/../android.view.View[2]/android.view.View[1]/android.widget.Button'.format(name + ' ' + url)
        self.base_click_element(loc)

    def page_back_to_begin(self):
        log.info('正在回到顶部')
        self.base_to_back_to_up(page.fwq_swipe_area)

    def page_call_modify_menu(self, name, url):
        log.info(f'向左滑动{name}元素，调出对应服务器控制菜单')
        loc = By.XPATH, '//*[contains(@content-desc,"{}")]'.format(name + ' ' + url)
        el = self.base_find_element(loc)
        y = el.location.get("y")
        x = el.location.get("x")
        print(el.location)
        # 获取区域元素宽高
        width = el.size.get("width")
        height = el.size.get("height")
        # 计算起始位置和终止位置的坐标点
        start_x = x + width * 0.8
        start_y = y + height * 0.5
        end_x = x + width * 0.2
        end_y = y + height * 0.5
        self.driver.swipe(start_x, start_y, end_x, end_y, duration=2000)

    def page_modify_fwq(self, name, url, new):
        log.info('调用修改服务器名称业务组合方法')
        self.base_to_back_to_up(page.fwq_swipe_area)
        if self.page_if_add_success(name, url):
            self.page_call_modify_menu(name, url)
            try:
                self.page_click_modify_btn(name, url)
            except:
                self.driver.swipe(500, 1600, 500, 1200)
                log.info('正在进行刷新页面结构')
                self.base_click_element(page.fwq_new)
                self.base_click_element(page.fwq_hand_input)
                self.base_click_element(page.fwq_back_btn)
                sleep(1)
                self.page_call_modify_menu(name, url)
                self.page_click_modify_btn(name, url)
            self.base_input_value(page.fwq_input_name, new)
            log.info('修改成功')
            # self.page_input_fuq_URL(url)
            self.page_click_save_btn()
            return True
        else:
            return  False

    def page_click_delete_btn(self, name, url):
        log.info(f'正在删除服务器{name},url{url}')
        loc = By.XPATH, '//*[contains(@content-desc,"{}")]' \
                        '/../android.view.View[2]/android.view.View[2]/android.widget.Button'.format(name + ' ' + url)
        self.base_click_element(loc)
        self.base_click_element(page.fwq_delete_confirm_btn)

    def page_delete_fwq(self, name, url):
        log.info(f'正在调用删除服务器操作，要删除的服务器是{name}')
        self.base_to_back_to_up(page.fwq_swipe_area)
        if self.page_if_add_success(name, url):
            self.page_call_modify_menu(name, url)
            try:
                self.page_click_delete_btn(name, url)
                log.info('删除操作完毕')
            except:
                self.driver.swipe(500, 1600, 500, 1200)
                log.info('正在进行刷新页面结构')
                self.base_click_element(page.fwq_new)
                self.base_click_element(page.fwq_hand_input)
                self.base_click_element(page.fwq_back_btn)
                sleep(1)
                self.page_call_modify_menu(name, url)
                self.page_click_delete_btn(name, url)
                log.info('删除操作完毕')
            return True
        else:
            return False


