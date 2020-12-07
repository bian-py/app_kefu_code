from time import sleep

import page
from base.base import Base
from tool.get_log import GetLogger

log = GetLogger.get_log()


class PageHistory(Base):

    def page_history_enter(self):
        log.info('进入历史会话页面')
        self.base_click_element(page.dhl_menu)
        self.base_click_element(page.history_enter)

    def page_history_input_username(self, username='test05'):
        log.info(f'输入搜索历史会话的用户名为{username}')
        self.base_clear_value(page.history_email_input)
        self.base_input_value(page.history_username_input, username)
        self.page_history_click_search()

    def page_history_input_email(self, email='test03@test.com'):
        log.info(f'输入搜索历史会话的邮箱为{email}')
        self.base_clear_value(page.history_username_input)
        self.base_input_value(page.history_email_input, email)
        self.page_history_click_search()

    def page_history_click_search(self):
        log.info(f'点击搜索按钮')
        self.base_click_element(page.history_search_btn)

    def page_choose_time(self):
        log.info(f'清空用户名和邮箱的信息，选择搜索的日期范围是2020.12.6-2020.12.7')
        self.base_clear_value(page.history_email_input)
        self.base_clear_value(page.history_username_input)
        sleep(1)
        self.base_click_element(page.history_date_start_btn)
        self.base_click_element(page.history_data_start)
        self.base_click_element(page.history_date_set_btn)
        sleep(1)
        self.base_click_element(page.history_date_end_btn)
        self.base_click_element(page.history_data_end)
        self.base_click_element(page.history_date_set_btn)
        sleep(1)
        self.page_history_click_search()

    def page_history_if_username(self):
        log.info(f'判断根据用户名搜索是否成功')
        if self.base_if_element_exist(page.history_username_if_success):
            return True
        else:
            return False

    def page_history_if_email(self):
        log.info(f'判断根据邮箱搜索是否成功')
        if self.base_if_element_exist(page.history_email_if_success):
            return True
        else:
            return False

    def page_history_if_data(self):
        log.info(f'判断根据日期范围搜索是否成功')
        if self.base_if_element_exist(page.history_username_if_success) \
                and self.base_if_element_exist(page.history_email_if_success):
            return True
        else:
            return False

    def page_history_check_history(self):
        log.info('进入到历史会话中')
        self.base_click_element(page.history_email_if_success)

    def page_history_check_if(self):
        log.info('判断是否成功跳转到历史会话中，并且显示正确的历史信息')
        if self.base_if_element_exist(page.history_check_if1) \
                and self.base_if_element_exist(page.history_check_if2):
            return True
        else:
            return False
