from selenium.webdriver.common.by import By

# 以下是服务器页面配置信息
fwq_new = By.XPATH, '//*[contains(@content-desc,"添加新的服务器")]'
fwq_hand_input = By.XPATH, '//*[contains(@content-desc,"手工输入")]'
fwq_scan_code = By.XPATH, '//*[contains(@content-desc,"扫码二维码")]'
fwq_input_name = By.XPATH, """//android.view.View[@content-desc="{{ 'server.name' | trans }}"]/../../android.widget.EditText"""
fwq_input_URL = By.XPATH, """//android.view.View[@content-desc="{{ 'm.api.url' | trans }}"]/../../android.widget.EditText"""
fwq_save_btn = By.XPATH, '//*[contains(@content-desc,"保存")]'
fwq_confirm = By.XPATH, '//*[contains(@content-desc,"{}")]'
fwq_url_error = By.XPATH, "//*[@content-desc = '无法连接到API']"
fwq_swipe_area = By.XPATH, "//android.view.View[@scrollable = 'true']"
fwq_back_btn = By.XPATH, "//*[@content-desc = '编辑服务器']/../android.widget.Button"
fwq_modify_btn = By.XPATH, '//*[contains(@content-desc,"我的服务器 http://192.168.1.10/kefu/php/app.php?mobile-api")]' \
                           '/../android.view.View[2]/android.view.View[1]/android.widget.Button'
fwq_delete_btn = By.XPATH, '//*[contains(@content-desc,"我的服务器 http://192.168.1.10/kefu/php/app.php?mobile-api")]' \
                           '/../android.view.View[2]/android.view.View[2]/android.widget.Button'
fwq_delete_confirm_btn = By.XPATH, '//*[@content-desc="删除 "]'

# 以下是登录页面配置信息
login_username = By.XPATH, '//android.view.View[@content-desc="登陆"]/../../android.widget.EditText'
login_password = By.XPATH, '//android.view.View[@content-desc="密码"]/../../android.widget.EditText'
login_confirm_btn = By.XPATH, '//android.widget.Button[@content-desc="登陆 "]'
login_cancel_btn = By.XPATH, '//android.widget.Button[@content-desc="取消 "]'
login_if_success = By.XPATH, '//android.view.View[@content-desc="我的服务器"]/../android.widget.Button'
login_logout = By.XPATH, '//android.view.View[contains(@content-desc,"退出")]'
login_error_confirm = By.XPATH, '//android.widget.Button[@content-desc="OK "]'
login_error_info = By.XPATH, '//android.widget.Button[@content-desc="OK "]/../android.view.View[2]'


# 以下是用户列表页面配置信息
def get_user_self_element(username):
    loc = By.XPATH, '//android.view.View[@content-desc="{}"]'.format(username)
    return loc


user_details_page = By.XPATH, '//android.view.View[@content-desc="用户详细信息"]'
user_details_page_back_btn = By.XPATH, '//android.view.View[@content-desc="用户详细信息"]/../android.widget.Button'
user_details_send_btn = By.XPATH, '//android.widget.Button[contains(@content-desc,"发送消息 ")]'
user_conversation_page = By.XPATH, '//android.view.View[@content-desc="会话"]'
user_conversation_page_back_btn = By.XPATH, '//android.view.View[@content-desc="会话"]/../android.widget.Button'
user_bottom_btn_talk_list = By.XPATH, '//android.view.View[contains(@content-desc,"会话 会话")]/android.view.View/android.view.View'
user_bottom_btn_user_list = By.XPATH, '//android.view.View[contains(@content-desc,"在线用户 在线用户")]/android.view.View/android.view.View'
user_talk_input = By.CLASS_NAME, 'android.widget.EditText'
user_talk_input_btn = By.XPATH, '//android.widget.EditText/../../android.widget.Button[3]'

# 以下是导航栏配置信息
dhl_menu = By.XPATH, '//android.view.View[@content-desc="我的服务器"]/../android.widget.Button'
dhl_logout = By.XPATH, '//android.view.View[contains(@content-desc,"退出")]'
dhl_user = By.XPATH, '//android.view.View[contains(@content-desc,"退出")]/../android.view.View[1]'
dhl_talk = By.XPATH, '//android.view.View[contains(@content-desc,"退出")]/../android.view.View[2]'
dhl_history = By.XPATH, '//android.view.View[contains(@content-desc,"退出")]/../android.view.View[3]'
dhl_view = By.XPATH, '//android.view.View[contains(@content-desc,"退出")]/../android.view.View[4]'
dhl_if_user = By.XPATH, '//android.view.View[@content-desc=" 匿名用户"]'
dhl_if_history = By.XPATH, '//android.widget.Button[contains(@content-desc,"搜索 ")]'
dhl_if_view = 'org.chromium.webview_shell'
dhl_if_logout = By.XPATH, '//*[contains(@content-desc,"添加新的服务器")]'
dhl_back_from_talk = By.XPATH, '//android.view.View[contains(@content-desc,"在线用户 在线用户")]/android.view.View/android.view.View'


# 以下是会话页面配置信息
def get_talk_list_element(username):
    loc = By.XPATH, '//android.view.View[@content-desc="{}"]'.format(username)
    return loc


def search_history_msg(msg):
    loc = By.XPATH, '//android.view.View[@content-desc="{}"]'.format(msg)
    return loc


talk_bottom_btn = By.XPATH, '//android.view.View[contains(@content-desc,"会话 会话")]/android.view.View/android.view.View'
talk_back_to_list = By.XPATH, '//android.view.View[@content-desc="会话"]/../android.widget.Button'
talk_input = By.CLASS_NAME, 'android.widget.EditText'
talk_input_btn = By.XPATH, '//android.widget.EditText/../../android.widget.Button[3]'
talk_emoji_btn = By.XPATH, '//android.widget.EditText/../../android.widget.Button[2]'
talk_menu_btn = By.XPATH, '//android.widget.EditText/../../android.widget.Button[1]'
talk_attachment_btn = By.XPATH, '//android.widget.EditText/../../android.view.View[2]/android.view.View[1]'
talk_attachment_enter = By.XPATH, '//android.widget.TextView[contains(@text,"文")]'
talk_attachment_file_menu = By.XPATH, '//android.widget.ImageButton[@content-desc="显示根目录"]'
talk_attachment_download = By.XPATH, "//android.widget.TextView[@text = '下载']"
talk_attachment = By.XPATH, "//android.widget.TextView[@text = 'timg.png']"
talk_attachment_if = By.XPATH, '//android.view.View[@content-desc="timg.png"]'
talk_emoji_select = By.XPATH, '//android.view.View[@content-desc="emot-3"]'
talk_emoji_if = By.XPATH, '//android.widget.Image[@content-desc="emot-3"]'
talk_menu_invite_user = By.XPATH, '//android.view.View[contains(@content-desc,"邀请会话")]'
talk_invite_user = By.XPATH, '//android.view.View[@content-desc="test05"]'
talk_invite_user2 = By.XPATH, '//android.view.View[@content-desc="test04"]'
talk_invite_if = By.XPATH, '//android.view.View[@content-desc=") 已被邀请参加会谈"]'
talk_menu_exit = By.XPATH, '//android.view.View[contains(@content-desc,"离开会话")]'
talk_menu_cancel = By.XPATH, '//android.widget.Button[@content-desc="取消 "]'

# 以下是历史记录页面配置信息
history_enter = By.XPATH, '//android.view.View[contains(@content-desc,"退出")]/../android.view.View[3]'
history_username_input = By.XPATH, '''//android.view.View[@content-desc="{{ 'user.name' | trans }}"]/../../android.widget.EditText'''
history_email_input = By.XPATH, '''//android.view.View[@content-desc="{{ 'user.email' | trans }}"]/../../android.widget.EditText'''
history_search_btn = By.XPATH, '//android.widget.Button[contains(@content-desc,"搜索 ")]'
history_username_if_success = By.XPATH, '//android.view.View[@content-desc="test04, test05"]'
history_email_if_success = By.XPATH, '//android.view.View[@content-desc="test04, test03"]'
history_date_start_btn = By.XPATH, '''//android.widget.Spinner[@content-desc="{{ 'from.date' | trans }} "]'''
history_date_end_btn = By.XPATH, '''//android.widget.Spinner[@content-desc="{{ 'to.date' | trans }} "]'''
history_data_start = By.XPATH, '//android.view.View[@content-desc="06 十二月 2020"]'
history_data_end = By.XPATH, '//android.view.View[@content-desc="07 十二月 2020"]'
history_date_set_btn = By.ID, 'android:id/button1'
history_check_if1 = By.XPATH, '//android.view.View[@content-desc="历史会话"]'
history_check_if2 = By.XPATH, '//android.view.View[@content-desc="这是test03发给test04的历史信息"]'