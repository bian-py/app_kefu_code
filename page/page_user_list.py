import page
from base.base import Base
from page.page_fwq import PageFwq
from page.page_login import PageLogin
from tool.get_log import GetLogger

log = GetLogger.get_log()


class PageUserList(Base):

    def page_user_click_user(self, username):
        log.info(f'点击用户列表中的用户{username}')
        self.base_click_element(page.get_user_self_element(username))

    def page_user_find_user_if_online(self, username):
        log.info(f'搜索用户列表中的用户{username}')
        try:
            self.base_find_element(page.get_user_self_element(username), timeout=2)
            return True
        except:
            return False

    def page_user_if_go_details(self):
        log.info('检查是否跳转到用户详情页面')
        try:
            self.base_find_element(page.user_details_page)
            return True
        except:
            return False

    def page_user_go_back_from_details(self):
        log.info('点击返回按钮，从详情页面返回')
        self.base_click_element(page.user_details_page_back_btn)

    def page_user_click_details_send_btn(self):
        log.info('点击发送信息按钮，向对应用户发送信息')
        self.base_click_element(page.user_details_send_btn)

    def page_user_if_go_conversation(self):
        log.info('检查是否跳转到会话页面')
        try:
            self.base_find_element(page.user_conversation_page)
            return True
        except:
            return False

    def page_user_go_back_from_conversation(self):
        log.info('点击返回按钮，从会话页面返回')
        self.base_click_element(page.user_conversation_page_back_btn)

    def page_user_click_talk_list_btn(self):
        log.info('点击会话列表按钮')
        self.base_click_element(page.user_bottom_btn_talk_list)

    def page_input_message(self, msg):
        log.info(f'发送信息{msg}')
        self.base_input_value(page.user_talk_input, msg)

    def page_click_send_btn(self):
        log.info('点击发送按钮')
        self.base_click_element(page.user_talk_input_btn)

    def page_click_user_list_btn(self):
        log.info('点击用户列表按钮')
        self.base_click_element(page.user_bottom_btn_user_list)

    def page_other_help(self, driver2, driver3):
        log.info('初始化另外两个手机')
        other_user_list_obj = []
        other_page_login_obj = []
        for i in [driver2, driver3]:
            # for i in [driver2]:
            PageUserList(i).base_if_app_is_install('net.mirrormx.livechat')
            i.start_activity('net.mirrormx.livechat', '.MainActivity')
            try:
                log.info('正在处理高版本系统的弹窗')
                i.switch_to.alert.accept()
            except:
                pass
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

        log.info('辅助测试机分别向主测试发送消息')
        other_user_list_obj[0].page_user_click_user('test05@test.com')
        other_user_list_obj[0].page_user_click_details_send_btn()
        other_user_list_obj[0].page_input_message('我是03，发给05,这是一条测试信息')
        other_user_list_obj[0].page_click_send_btn()
        other_user_list_obj[0].page_user_go_back_from_conversation()
        other_user_list_obj[0].page_user_go_back_from_details()
        other_user_list_obj[0].page_user_click_user('test04@test.com')
        other_user_list_obj[0].page_user_click_details_send_btn()
        other_user_list_obj[0].page_input_message('我是03，发给04,这是一条测试信息')
        other_user_list_obj[0].page_click_send_btn()
        other_user_list_obj[0].page_user_go_back_from_conversation()
        other_user_list_obj[0].page_user_go_back_from_details()
