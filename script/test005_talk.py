import os
from time import sleep

import pytest

from config import cap2
from page.page_fwq import PageFwq
from page.page_login import PageLogin
from page.page_talk import PageTalk
from page.page_user_list import PageUserList
from tool.get_driver import GetDriver
from tool.get_log import GetLogger
from tool.read_sql import read_sql
from tool.read_yaml import read_yaml
from tool.read_yaml_sigle import read_yaml_sigle
from tool.run_bat import run_bat

log = GetLogger.get_log()
module_name = str(os.path.basename(__file__)).split('.')[0]


class TestTalk:

    @classmethod
    def setup_class(cls):
        log.info('清除服务器缓存文件')
        run_bat('clear_session.bat')
        log.info('导入数据库测试数据')
        read_sql('mirrormx_customer_chat_talk2.sql')
        read_sql('mirrormx_customer_chat_message2.sql')
        read_sql('mirrormx_customer_chat_data.sql')
        read_sql('mirrormx_customer_chat_shared_file.sql')
        read_sql('mirrormx_customer_chat_upload.sql')
        cls.driver = GetDriver.get_app_driver()
        cls.talk = PageTalk(cls.driver)
        cls.fwq = PageFwq(cls.driver)
        cls.login = PageLogin(cls.driver)
        cls.talk.base_if_app_is_install('net.mirrormx.livechat')
        cls.driver.start_activity('net.mirrormx.livechat', '.MainActivity')
        if float(cap2['platformVersion']) >= 8:
            log.info('正在处理高版本系统的弹窗')
            cls.driver.switch_to.alert.accept()
        cls.fwq.page_hand_add_fwq('我的服务器', 'http://192.168.1.10/kefu/php/app.php?mobile-api')
        cls.login.page_login('我的服务器', 'http://192.168.1.10/kefu/php/app.php?mobile-api',
                             username='test04@test.com', password='123456')

        # 辅助测试机初始化设置
        log.info('辅助测试机初始化')
        cls.driver2 = GetDriver.get_app_driver2()
        cls.driver3 = GetDriver.get_app_driver3()
        cls.talk2 = PageTalk(cls.driver2)
        cls.talk3 = PageTalk(cls.driver3)
        cls.talk.page_talk_other_help(cls.driver2, cls.driver3)

    @classmethod
    def teardown_class(cls):
        GetDriver.quit_app_driver()
        GetDriver.quit_app_driver2()
        GetDriver.quit_app_driver3()

    def test01_talk_history_msg(self):
        self.talk.page_talk_go_talk_list()
        self.talk.page_talk_go_to_talk()
        try:
            log.info('正在进行断言')
            assert self.talk.page_talk_if_display_history_msg()
        except:
            log.info(f'断言失败，正在进行截图')
            self.talk.base_get_screenshot_as_file(module_name)
            raise

    @pytest.mark.parametrize('msg', read_yaml_sigle('talk_msg.yaml'))
    def test02_talk_input_msg(self, msg):
        if msg != '':
            log.info('输入信息不为空')
            self.talk.page_talk_input(msg)
            self.talk.page_talk_click_input_btn()
            try:
                # print(msg,type(msg))
                log.info('正在进行断言')
                assert self.talk.page_talk_if_display_right_msg(msg)
            except:
                log.info(f'断言失败，正在进行截图')
                self.talk.base_get_screenshot_as_file(module_name)
                raise
        else:
            log.info('输入信息为空')
            self.talk2.page_talk_input(msg)
            try:
                log.info('正在进行断言')
                assert not self.talk2.page_talk_if_send_btn_is_enable()
            except:
                log.info(f'断言失败，正在进行截图')
                self.talk.base_get_screenshot_as_file(module_name)
                raise

    def test03_talk_attachment(self):
        self.talk.page_talk_send_attachment()
        try:
            log.info('正在进行断言')
            assert self.talk.page_talk_send_attachment_if_success()
        except:
            log.info(f'断言失败，正在进行截图')
            self.talk.base_get_screenshot_as_file(module_name)
            raise

    def test04_talk_emotion(self):
        self.talk.page_talk_send_emotion()
        try:
            log.info('正在进行断言')
            assert self.talk.page_talk_send_emotion_if_success()
        except:
            log.info(f'断言失败，正在进行截图')
            self.talk.base_get_screenshot_as_file(module_name)
            raise

    def test05_talk_control_menu(self):
        self.talk.page_talk_click_talk_menu()
        try:
            log.info('正在进行断言')
            assert self.talk.page_talk_menu_if_display()
        except:
            log.info(f'断言失败，正在进行截图')
            self.talk.base_get_screenshot_as_file(module_name)
            raise

    def test06_talk_control_menu_cancel(self):
        self.talk.page_talk_click_cancel()
        try:
            log.info('正在进行断言')
            assert self.talk.page_talk_menu_if_cancel()
        except:
            log.info(f'断言失败，正在进行截图')
            self.talk.base_get_screenshot_as_file(module_name)
            raise

    def test07_talk_invite_other_user(self):
        self.talk.page_talk_click_talk_menu()
        self.talk.page_talk_invite_user()
        try:
            log.info('正在进行断言')
            assert self.talk.page_talk_if_invite()
        except:
            log.info(f'断言失败，正在进行截图')
            self.talk.base_get_screenshot_as_file(module_name)
            raise

    def test08_talk_exit(self):
        self.talk.page_talk_click_talk_menu()
        self.talk.page_talk_click_exit_talk()
        try:
            log.info('正在进行断言')
            assert self.talk.page_talk_if_exit_success()
        except:
            log.info(f'断言失败，正在进行截图')
            self.talk.base_get_screenshot_as_file(module_name)
            raise
