from time import sleep

import page
from base.base import Base
from tool.get_log import GetLogger

log = GetLogger.get_log()

class PageDhl(Base):

    def page_dhl_click_menu(self):
        log.info('点击导航栏菜单')
        sleep(2)
        self.base_click_element(page.dhl_menu)

    def page_dhl_click_user(self):
        log.info('点击导航栏用户按钮')
        sleep(1)
        self.base_click_element(page.dhl_user)

    def page_dhl_click_talk(self):
        log.info('点击导航栏会话按钮')
        sleep(1)
        self.base_click_element(page.dhl_talk)

    def page_dhl_click_history(self):
        log.info('点击导航栏历史按钮')
        sleep(1)
        self.base_click_element(page.dhl_history)

    def page_dhl_click_view(self):
        log.info('点击导航栏预览按钮')
        sleep(1)
        self.base_click_element(page.dhl_view)

    def page_dhl_click_logout(self):
        log.info('点击导航栏退出按钮')
        sleep(1)
        self.base_click_element(page.dhl_logout)

    def page_dhl_if_user(self):
        log.info(f'判断是否成功跳转到用户界面')
        sleep(1)
        return self.base_if_element_exist(page.dhl_if_user)

    def page_dhl_if_talk(self):
        log.info(f'判断是否成功跳转到会话界面')
        sleep(2)
        if (not self.base_if_element_exist(page.dhl_if_user)) and self.base_if_element_exist(page.dhl_menu):
            return True
        else:
            return False

    def page_dhl_back_from_talk(self):
        log.info(f'从会话页面返回')
        sleep(1)
        self.base_click_element(page.dhl_back_from_talk)

    def page_dhl_if_view(self):
        log.info(f'判断是否成功跳转到预览界面')
        sleep(3)
        if self.driver.current_package == page.dhl_if_view:
            return True
        else:
            return False

    def page_dhl_if_history(self):
        log.info(f'判断是否成功跳转到历史界面')
        sleep(1)
        return self.base_if_element_exist(page.dhl_if_history)

    def page_dhl_if_logout(self):
        log.info(f'判断退出是否成功')
        sleep(1)
        return self.base_if_element_exist(page.dhl_if_logout)

    def page_dhl_back(self):
        log.info(f'输入返回按键')
        sleep(1)
        self.driver.press_keycode(4, metastate=None)
