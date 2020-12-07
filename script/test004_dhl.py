import os
from time import sleep

import pytest

from config import cap2
from page.page_dhl import PageDhl
from page.page_fwq import PageFwq
from page.page_login import PageLogin
from tool.get_driver import GetDriver
from tool.get_log import GetLogger

log = GetLogger.get_log()
module_name = str(os.path.basename(__file__)).split('.')[0]


class TestDhl:

    @classmethod
    def setup_class(cls):
        cls.driver = GetDriver.get_app_driver()
        cls.dhl = PageDhl(cls.driver)
        cls.dhl.base_if_app_is_install('net.mirrormx.livechat')
        cls.driver.start_activity('net.mirrormx.livechat', '.MainActivity')
        if float(cap2['platformVersion']) >= 8:
            log.info('正在处理高版本系统的弹窗')
            cls.driver.switch_to.alert.accept()
        cls.fwq = PageFwq(cls.driver)
        cls.login = PageLogin(cls.driver)
        cls.fwq.page_hand_add_fwq('我的服务器', 'http://192.168.1.10/kefu/php/app.php?mobile-api')
        sleep(2)

    @classmethod
    def teardown_class(cls):
        GetDriver.quit_app_driver()

    def setup(self):
        self.driver.start_activity('net.mirrormx.livechat', '.MainActivity')
        self.login.page_login('我的服务器', 'http://192.168.1.10/kefu/php/app.php?mobile-api',
                              username='test04@test.com', password='123456')

    def teardown(self):
        self.driver.close_app()

    @pytest.mark.flaky(rerun=1, rerun_delay=2)
    def test01_dhl_user(self):
        self.dhl.page_dhl_click_menu()
        self.dhl.page_dhl_click_user()
        try:
            log.info(f'正在进行断言')
            assert self.dhl.page_dhl_if_user()
        except:
            log.info(f'断言失败，正在进行截图')
            self.dhl.base_get_screenshot_as_file(module_name)
            raise

    @pytest.mark.flaky(rerun=1, rerun_delay=2)
    def test02_dhl_history(self):
        self.dhl.page_dhl_click_menu()
        self.dhl.page_dhl_click_history()
        try:
            log.info(f'正在进行断言')
            assert self.dhl.page_dhl_if_history()
            self.dhl.page_dhl_back()
        except:
            log.info(f'断言失败，正在进行截图')
            self.dhl.base_get_screenshot_as_file(module_name)
            raise

    @pytest.mark.flaky(rerun=1, rerun_delay=2)
    def test03_dhl_view(self):
        self.dhl.page_dhl_click_menu()
        self.dhl.page_dhl_click_view()
        try:
            log.info('正在进行断言')
            assert self.dhl.page_dhl_if_view()
            self.dhl.page_dhl_back()
        except:
            log.info(f'断言失败，正在进行截图')
            self.dhl.base_get_screenshot_as_file(module_name)
            raise

    @pytest.mark.flaky(rerun=1, rerun_delay=2)
    def test04_dhl_logout(self):
        self.dhl.page_dhl_click_menu()
        self.dhl.page_dhl_click_logout()
        try:
            log.info('正在进行断言')
            assert self.dhl.page_dhl_if_logout()
        except:
            log.info(f'断言失败，正在进行截图')
            self.dhl.base_get_screenshot_as_file(module_name)
            raise

    @pytest.mark.flaky(rerun=1, rerun_delay=2)
    @pytest.mark.run(order=-1)
    def test05_dhl_talk(self):
        self.dhl.page_dhl_click_menu()
        self.dhl.page_dhl_click_talk()
        try:
            log.info('正在进行断言')
            assert self.dhl.page_dhl_if_talk()
        except:
            log.info(f'断言失败，正在进行截图')
            self.dhl.base_get_screenshot_as_file(module_name)
            raise
