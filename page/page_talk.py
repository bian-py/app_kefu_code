from time import sleep

import page
from base.base import Base
from page.page_fwq import PageFwq
from page.page_login import PageLogin
from page.page_user_list import PageUserList
from tool.get_log import GetLogger

log = GetLogger.get_log()


class PageTalk(Base):

    def page_talk_go_talk_list(self):
        log.info('点击会话按钮，进入到会话列表')
        self.base_click_element(page.talk_bottom_btn)
        sleep(2)

    def page_talk_go_to_talk(self):
        log.info('进入到与test03的对话')
        loc = page.get_talk_list_element('test03')
        self.base_click_element(loc)

    def page_talk_input(self, msg):
        log.info(f'输入对话信息{msg}')
        self.base_input_value(page.talk_input, msg)

    def page_talk_click_input_btn(self):
        log.info('点击发送按钮')
        sleep(1)
        self.base_click_element(page.talk_input_btn)

    def page_talk_if_send_btn_is_enable(self):
        log.info('判断发送按钮是否可用')
        re = self.base_get_element_attribute_value(page.talk_input_btn, 'enabled')
        if re == 'true':
            return True
        else:
            return False

    def page_talk_if_display_history_msg(self):
        log.info('判断是否显示历史消息')
        loc = page.search_history_msg('我是03，发给04,这是一条新的测试信息')
        if self.base_if_element_exist(loc):
            return True
        else:
            return False

    def page_talk_if_display_right_msg(self, msg):
        log.info('判断输入消息是否正确显示')
        # print(msg, type(msg))
        self.page_talk_refresh()
        loc = page.search_history_msg(msg)
        # print(loc, type(loc))
        if self.base_if_element_exist(loc):
            return True
        else:
            return False

    def page_talk_send_attachment(self):
        log.info('发送附件')
        self.base_click_element(page.talk_attachment_btn)
        self.base_click_element(page.talk_attachment_enter)
        self.base_click_element(page.talk_attachment_file_menu)
        self.base_click_element(page.talk_attachment_download)
        sleep(5)
        while True:
            self.base_click_element(page.talk_attachment)
            sleep(2)
            if self.base_if_element_exist(page.talk_input_btn):
                break



    def page_talk_send_attachment_if_success(self):
        log.info('判断附件是否发送成功')
        sleep(3)
        self.page_talk_refresh()
        if self.base_if_element_exist(page.talk_attachment_if):
            return True
        else:
            return False

    def page_talk_send_emotion(self):
        log.info('发送表情')
        self.base_click_element(page.talk_emoji_btn)
        self.base_click_element(page.talk_emoji_select)
        self.base_click_element(page.talk_input_btn)

    def page_talk_send_emotion_if_success(self):
        log.info('判断表情是否发送成功')
        self.page_talk_refresh()
        if self.base_if_element_exist(page.talk_emoji_if):
            return True
        else:
            return False

    def page_talk_click_talk_menu(self):
        log.info('点击会话控制菜单按钮')
        self.base_click_element(page.talk_menu_btn)

    def page_talk_click_cancel(self):
        log.info('点击取消按钮')
        self.base_click_element(page.talk_menu_cancel)

    def page_talk_menu_if_cancel(self):
        log.info('判断会话菜单是否取消')
        sleep(2)
        if self.base_if_element_exist(page.talk_menu_cancel):
            return False
        else:
            return True

    def page_talk_menu_if_display(self):
        log.info('判断会话菜单是否正确显示')
        sleep(2)
        if self.base_if_element_exist(page.talk_menu_cancel):
            return True
        else:
            return False

    def page_talk_click_exit_talk(self):
        log.info('点击离开会话按钮')
        self.base_click_element(page.talk_menu_exit)

    def page_talk_data_back(self):
        self.page_talk_go_talk_list()
        self.page_talk_go_to_talk()
        self.page_talk_click_talk_menu()
        self.base_click_element(page.talk_menu_exit)

    def page_talk_if_exit_success(self):
        log.info('判断是否成功离开')
        sleep(3)
        loc = page.get_talk_list_element('test03')
        if self.base_if_element_exist(loc):
            return False
        else:
            return True

    def page_talk_invite_user(self):
        log.info('正在邀请其他用户加入会话')
        self.base_click_element(page.talk_menu_invite_user)
        self.base_click_element(page.talk_invite_user)

    def page_talk_invite_user2(self):
        self.base_click_element(page.talk_menu_btn)
        self.base_click_element(page.talk_menu_invite_user)
        sleep(3)
        self.base_click_element(page.talk_invite_user2)

    def page_talk_if_invite(self):
        log.info('判断邀请是否成功')
        if self.base_if_element_exist(page.talk_invite_if):
            return True
        else:
            return False

    def page_talk_refresh(self):
        log.info('正在进行刷新页面结构操作')
        self.base_click_element(page.talk_back_to_list)
        sleep(1)
        self.page_talk_go_to_talk()

    @staticmethod
    def page_talk_other_help(driver2, driver3):
        log.info('初始化另外两个手机')
        other_user_list_obj = []
        other_page_login_obj = []
        for i in [driver2, driver3]:
            # for i in [driver2]:
            PageUserList(i).base_if_app_is_install('net.mirrormx.livechat')
            i.start_activity('net.mirrormx.livechat', '.MainActivity')
            PageFwq(i).page_hand_add_fwq('我的服务器', 'http://192.168.1.10/kefu/php/app.php?mobile-api')
            other_user_list_obj.append(PageUserList(i))
            other_page_login_obj.append(PageLogin(i))

        log.info('辅助测试机登录')
        n = 0
        for m in ['test03@test.com', 'test05@test.com']:
            # for m in ['test03@test.com']:
            other_page_login_obj[n].page_login('我的服务器', 'http://192.168.1.10/kefu/php/app.php?mobile-api',
                                               username=m, password='123456')
            n += 1

        log.info('辅助测试机向主测试发送消息')
        other_user_list_obj[0].page_user_click_user('test04@test.com')
        other_user_list_obj[0].page_user_click_details_send_btn()
        sleep(1)
        other_user_list_obj[0].page_input_message('我是03，发给04,这是一条新的测试信息')
        sleep(1)
        other_user_list_obj[0].page_click_send_btn()
        # --------------------------------------------------------------
        # 调试用代码
        # driver2.start_activity('net.mirrormx.livechat', '.MainActivity')
        # driver3.start_activity('net.mirrormx.livechat', '.MainActivity')
        # PageLogin(driver2).page_login('我的服务器', 'http://192.168.1.10/kefu/php/app.php?mobile-api',
        #                                                   username='test03@test.com', password='123456')
        # PageLogin(driver3).page_login('我的服务器', 'http://192.168.1.10/kefu/php/app.php?mobile-api',
        #                               username='test05@test.com', password='123456')
        # d2 = PageUserList(driver2)
        # d2.page_user_click_user('test04@test.com')
        # d2.page_user_click_details_send_btn()
        # d2.page_input_message('我是03，发给04,这是一条新的测试信息')
        # d2.page_click_send_btn()
