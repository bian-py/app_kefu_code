import os
from time import sleep

import pytest

from config import cap2, cap3
from page.page_fwq import PageFwq
from page.page_login import PageLogin
from page.page_user_list import PageUserList
from tool.get_driver import GetDriver
from tool.get_log import GetLogger
from tool.read_sql import read_sql
from tool.read_yaml import read_yaml
from tool.run_bat import run_bat

log = GetLogger.get_log()
module_name = str(os.path.basename(__file__)).split('.')[0]


class TestUser:

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
        # 主测试机的初始化设置
        cls.driver = GetDriver.get_app_driver()
        cls.user = PageUserList(cls.driver)
        cls.fwq = PageFwq(cls.driver)
        cls.login = PageLogin(cls.driver)
        cls.user.base_if_app_is_install('net.mirrormx.livechat')
        cls.driver.start_activity('net.mirrormx.livechat', '.MainActivity')
        if float(cap2['platformVersion']) >= 8:
            log.info('正在处理高版本系统的弹窗')
            cls.driver.switch_to.alert.accept()
        cls.fwq.page_hand_add_fwq('我的服务器', 'http://192.168.1.10/kefu/php/app.php?mobile-api')
        cls.login.page_login('我的服务器', 'http://192.168.1.10/kefu/php/app.php?mobile-api',
                             username='test04@test.com', password='123456')
        # 辅助测试机初始化设置
        cls.driver2 = GetDriver.get_app_driver2()
        cls.driver3 = GetDriver.get_app_driver3()
        cls.user.page_other_help(cls.driver2, cls.driver3)

    @classmethod
    def teardown_class(cls):
        GetDriver.quit_app_driver()
        GetDriver.quit_app_driver2()
        GetDriver.quit_app_driver3()

    def test01_user_click_myself(self, username='test04@test.com', password='123456'):
        log.info('点击自己')
        # self.login.page_login('我的服务器', 'http://192.168.1.10/kefu/php/app.php?mobile-api', username, password)
        self.user.page_user_click_user(username)
        try:
            log.info('断言是否跳转到详情页')
            assert self.user.page_user_if_go_details()
            self.user.page_user_go_back_from_details()
        except:
            log.error('没有跳转到详情页，正在截图')
            self.login.base_get_screenshot_as_file(module_name)
            raise

    def test02_user_click_other(self, username='test03@test.com'):
        log.info(f'点击其他用户{username}')
        self.user.page_user_click_user(username)
        if self.user.page_user_if_go_details():
            self.user.page_user_click_details_send_btn()
            try:
                log.info('正在进行断言能否跳转到会话页面')
                assert self.user.page_user_if_go_conversation()
                self.user.page_user_go_back_from_conversation()
                self.user.page_user_go_back_from_details()
            except:
                log.error('点击其他用户没有正确跳转，正在截图')
                self.login.base_get_screenshot_as_file(module_name)
                raise

    @pytest.mark.parametrize('username,expect', read_yaml('user_list.yaml'))
    def test03_user_list_display(self, username, expect):
        try:
            log.info(f'正在用户列表搜索其他用户{username},该用户状态为{expect}')
            log.info('正在对用户状态进行断言')
            assert self.user.page_user_find_user_if_online(username) == expect
        except:
            log.error('断言失败，正在截图')
            self.login.base_get_screenshot_as_file(module_name)
            raise

    def test04_user_conversation(self):
        log.info('主机查询收到的消息')
        self.user.page_user_click_talk_list_btn()
        try:
            log.info('正在进行断言，判断主机是否收到消息')
            sleep(10)
            assert self.user.page_user_find_user_if_online('test03')
            self.user.page_user_click_user('test03')
            self.user.page_input_message('我是04，收到03的一条测试信息')
            self.user.page_click_send_btn()
            self.user.page_user_go_back_from_conversation()
        except:
            log.error('没有收到消息')
            self.login.base_get_screenshot_as_file(module_name)
            raise

        try:
            log.info('正在进行断言是否能够查看其他用户消息对话')
            assert not self.user.page_user_find_user_if_online('test05')
            log.info('没有收到，断言成功')
            # self.user.page_user_go_back_from_conversation()
            self.user.page_click_user_list_btn()
        except:
            log.error('能够查看你其他用户消息')
            self.login.base_get_screenshot_as_file(module_name)
            raise
