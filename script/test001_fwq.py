import os

from selenium.webdriver.common.by import By

import page
from config import cap, cap2
from page.page_fwq import PageFwq
from tool.get_driver import GetDriver
import pytest

from tool.get_log import GetLogger
from tool.read_yaml import read_yaml

log = GetLogger.get_log()
module_name = str(os.path.basename(__file__)).split('.')[0]


class TestFwq:

    @classmethod
    def setup_class(cls):
        cls.driver = GetDriver.get_app_driver()
        cls.fwq = PageFwq(cls.driver)
        cls.fwq.base_if_app_is_install('net.mirrormx.livechat')
        cls.driver.start_activity('net.mirrormx.livechat', '.MainActivity')
        if float(cap2['platformVersion']) >= 8:
            log.info('正在处理高版本系统的弹窗')
            cls.driver.switch_to.alert.accept()

    @classmethod
    def teardown_class(cls):
        GetDriver.quit_app_driver()

    @pytest.mark.parametrize('name,url,expect', read_yaml('fwq_add.yaml'))
    @pytest.mark.run(order=1)
    def test01_fwq_hand_add(self, name, url, expect):
        self.fwq.page_hand_add_fwq(name, url)
        if expect == '':
            log.info('正向用例')
            result = self.fwq.page_if_add_success(name, url)
            try:
                log.info("正在进行断言，判断是否登录成功")
                assert result
                log.info("添加成功")

            except Exception:
                log.error('添加失败')
                self.fwq.base_get_screenshot_as_file(module_name)
                raise
        else:
            log.info('逆向用例')

            if  self.fwq.base_find_element(page.fwq_save_btn, timeout=3):
                try:
                    log.info("正在进行断言，判断错误信息是否正确")
                    loc = By.XPATH, "//*[@content-desc = '{}']".format(expect)
                    assert self.fwq.base_find_element(loc)
                except Exception as e:
                    log.error(f"无错误提示信息，或者提示信息有误，{e}")
                    self.fwq.base_get_screenshot_as_file(module_name)
                    raise
                finally:
                    self.fwq.page_click_back_btn()
            else:
                log.error("错误的用例，能够添加成功，用例不通过")
                self.fwq.base_get_screenshot_as_file(module_name)
                raise Exception("错误的用例，能够添加成功，用例不通过")

    @pytest.mark.parametrize('name,url,modify_value', read_yaml('fwq_modify.yaml'))
    @pytest.mark.run(order=2)
    def test02_fwq_modify(self, name, url, modify_value):
        log.info(f"将服务器{name}修改为{modify_value}")
        re = self.fwq.page_modify_fwq(name, url, modify_value)
        if re:
            try:
                log.info('正在进行断言，判断修改后的服务器是否存在')
                assert self.fwq.page_if_add_success(modify_value, url)
            except:
                log.error('修改失败，找不到修改后的服务器')
                self.fwq.base_get_screenshot_as_file(module_name)
                raise
        else:
            raise Exception('要修改的服务器不存在')

    @pytest.mark.parametrize('name,url', read_yaml('fwq_delete.yaml'))
    @pytest.mark.run(order=3)
    def test03_fwq_delete(self, name, url):
        re = self.fwq.page_delete_fwq(name, url)
        if re:
            log.info('重新检索列表，查看是否删除成功')
            self.fwq.page_back_to_begin()
            try:
                log.info('正在进行是否删除成功的断言')
                assert not self.fwq.page_if_add_success(name, url)
                log.info('删除成功')
            except:
                log.error('删除失败')
                self.fwq.base_get_screenshot_as_file(module_name)
                raise
        else:
            raise Exception('要删除的服务器不存在')
