from time import sleep

from selenium.webdriver.common.by import By

import page
from base.base import Base
from tool.get_log import GetLogger

log = GetLogger.get_log()


class PageLogin(Base):

    def page_login_click_fwq(self, name, url):
        log.info(f'点击要登录的服务器:{name}')
        loc = By.XPATH, '//*[contains(@content-desc,"{}")]'.format(name + ' ' + url)
        self.base_click_element(loc)

    def page_login_input_username(self, username):
        log.info('输入用户名')
        self.base_input_value(page.login_username, username)

    def page_login_input_password(self, password):
        log.info('输入密码')
        self.base_input_value(page.login_password, password)

    def page_login_click_confirm_btn(self):
        log.info('点击确认按钮')
        self.base_click_element(page.login_confirm_btn)

    def page_login_if_success(self):
        try:
            self.base_find_element(page.login_if_success,timeout=3)
            log.info('登录成功')
            return True
        except:
            log.info('登录失败')
            return False

    def page_login_logout(self):
        log.info('点击退出按钮')
        self.base_click_element(page.login_if_success)
        self.base_click_element(page.login_logout)

    def page_login_get_error_info(self):
        log.info('获取登录时的错误信息')
        return self.base_get_element_attribute_value(page.login_error_info,'content-desc')

    def page_login_click_error_btn(self):
        log.info('点击错误信息确认按钮')
        self.base_click_element(page.login_error_confirm)

    def page_login(self, name, url, username, password):
        log.info('调用登录页面组合业务方法')
        self.page_login_click_fwq(name, url)
        self.page_login_input_username(username)
        self.page_login_input_password(password)
        self.page_login_click_confirm_btn()
        sleep(1)

    def page_login_click_cancel(self):
        log.info('取消登录')
        self.base_click_element(page.login_cancel_btn)

    def page_login_if_cancel_success(self):
        log.info('判断是否取消成功')
        try:
            self.base_find_element(page.login_confirm_btn,timeout=5)
            return False
        except:
            return True

    def page_login_cancel(self, name, url):
        log.info('调用登录页面取消登录组合业务方法')
        sleep(2)
        self.page_login_click_fwq(name, url)
        sleep(2)
        self.page_login_click_cancel()

