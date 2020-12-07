import os
from time import sleep

import pytest

from config import cap2
from page.page_fwq import PageFwq
from page.page_login import PageLogin
from tool.get_driver import GetDriver
from tool.get_log import GetLogger
from tool.read_yaml import read_yaml

log = GetLogger.get_log()
module_name = str(os.path.basename(__file__)).split('.')[0]


class TestLogin:

    @classmethod
    def setup_class(cls):
        cls.driver = GetDriver.get_app_driver()
        cls.login = PageLogin(cls.driver)
        cls.fwq = PageFwq(cls.driver)
        cls.login.base_if_app_is_install('net.mirrormx.livechat')
        cls.driver.start_activity('net.mirrormx.livechat', '.MainActivity')
        if float(cap2['platformVersion']) >= 8:
            log.info('正在处理高版本系统的弹窗')
            cls.driver.switch_to.alert.accept()
        cls.fwq.page_hand_add_fwq('我的服务器', 'http://192.168.1.10/kefu/php/app.php?mobile-api')

    @classmethod
    def teardown_class(cls):
        GetDriver.quit_app_driver()

    @pytest.mark.parametrize('name, url, username, password, expect', read_yaml('login.yaml'))
    def test01_login(self, name, url, username, password, expect):
        sleep(2)
        self.login.page_login(name, url, username, password)
        if expect == '':
            try:
                log.info('正在进行断言判断是否登录成功')
                assert self.login.page_login_if_success()
            except:
                log.error('正向用例，登录失败')
                self.login.base_get_screenshot_as_file(module_name)
                raise
            finally:
                self.login.page_login_logout()
        else:
            try:
                log.info('正在进行断言判断是否登录成功')
                assert not self.login.page_login_if_success()
                try:
                    assert expect == self.login.page_login_get_error_info()
                except:
                    log.error('错误信息提示有误')
                    self.login.base_get_screenshot_as_file(module_name)
                    raise
                finally:
                    self.login.page_login_click_error_btn()
            except:
                log.error('逆向用例，登录成功')
                self.login.page_login_logout()
                self.login.base_get_screenshot_as_file(module_name)
                raise

    def test02_login_cancel(self, name='我的服务器', url='http://192.168.1.10/kefu/php/app.php?mobile-api'):
        self.login.page_login_cancel(name, url)
        sleep(2)
        try:
            log.info('正在进行取消操作的断言')
            assert self.login.page_login_if_cancel_success()
        except:
            log.error('取消失败')
            self.login.base_get_screenshot_as_file(module_name)
            raise
