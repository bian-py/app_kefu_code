import os

from config import cap2
from page.page_fwq import PageFwq
from page.page_history import PageHistory
from page.page_login import PageLogin
from tool.get_driver import GetDriver
from tool.get_log import GetLogger
from tool.read_sql import read_sql

log = GetLogger.get_log()
module_name = str(os.path.basename(__file__)).split('.')[0]


class TestHistory:
    @classmethod
    def setup_class(cls):
        log.info('导入数据库测试数据')
        read_sql('mirrormx_customer_chat_talk_history.sql')
        read_sql('mirrormx_customer_chat_message_history.sql')
        read_sql('mirrormx_customer_chat_data.sql')
        read_sql('mirrormx_customer_chat_shared_file.sql')
        read_sql('mirrormx_customer_chat_upload.sql')
        cls.driver = GetDriver.get_app_driver()
        cls.history = PageHistory(cls.driver)
        cls.fwq = PageFwq(cls.driver)
        cls.login = PageLogin(cls.driver)
        cls.history.base_if_app_is_install('net.mirrormx.livechat')
        cls.driver.start_activity('net.mirrormx.livechat', '.MainActivity')
        if float(cap2['platformVersion']) >= 8:
            log.info('正在处理高版本系统的弹窗')
            cls.driver.switch_to.alert.accept()
        cls.fwq.page_hand_add_fwq('我的服务器', 'http://192.168.1.10/kefu/php/app.php?mobile-api')
        cls.login.page_login('我的服务器', 'http://192.168.1.10/kefu/php/app.php?mobile-api',
                             username='test04@test.com', password='123456')
        cls.history.page_history_enter()

    @classmethod
    def teardown_class(cls):
        GetDriver.quit_app_driver()

    def test01_history_username(self):
        self.history.page_history_input_username()
        try:
            log.info('正在进行断言')
            assert self.history.page_history_if_username()
        except:
            log.info(f'断言失败，正在进行截图')
            self.history.base_get_screenshot_as_file(module_name)
            raise

    def test02_history_email(self):
        self.history.page_history_input_email()
        try:
            log.info('正在进行断言')
            assert self.history.page_history_if_email()
        except:
            log.info(f'断言失败，正在进行截图')
            self.history.base_get_screenshot_as_file(module_name)
            raise

    def test03_history_data(self):
        self.history.page_choose_time()
        try:
            log.info('正在进行断言')
            assert self.history.page_history_if_data()
        except:
            log.info(f'断言失败，正在进行截图')
            self.history.base_get_screenshot_as_file(module_name)
            raise

    def test04_history_check(self):
        self.history.page_history_check_history()
        try:
            log.info('正在进行断言')
            assert self.history.page_history_check_if()
        except:
            log.info(f'断言失败，正在进行截图')
            self.history.base_get_screenshot_as_file(module_name)
            raise