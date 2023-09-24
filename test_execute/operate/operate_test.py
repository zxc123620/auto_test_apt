#!/usr/bin/env python
# -*- coding:utf-8 -*-
# @FileName  :operate.py
# @Time      :2023/8/28 20:23
# @Author    :zhouxiaochuan
# @Description:
import time

import allure
from selenium.webdriver.support import expected_conditions
from selenium.webdriver.support.wait import WebDriverWait

from auto_test_hd.operate import registry_method


class BaseOperate:
    @staticmethod
    def locate_element(driver, element):
        element = driver.find_element(*element)
        wait = WebDriverWait(driver=driver, timeout=30)
        wait.until(expected_conditions.visibility_of(element))
        driver.execute_script("arguments[0].setAttribute('style','border:2px solid red;')", element)
        time.sleep(0.5)
        return element


class DriverOperate:
    @staticmethod
    @registry_method(desc="打开浏览器")
    @allure.step("打开浏览器")
    def open_url(driver, url, **kwargs):
        print(f"打开浏览器操作,url:{url}")
        driver.get(url)

    @staticmethod
    @registry_method(desc="获取标题")
    @allure.step("获取标题")
    def get_title(driver, **kwargs):
        print(f"获取当前标题")
        return driver.title

    @staticmethod
    @registry_method(desc="获取当前URL")
    @allure.step("获取当前URL")
    def get_url(driver, **kwargs):
        print(f"获取当前标题")
        return driver.current_url

    @staticmethod
    @registry_method(desc="刷新当前页面")
    @allure.step("刷新当前页面")
    def refresh(driver, **kwargs):
        print(f"刷新当前页面")
        driver.refresh()

    @staticmethod
    @registry_method(desc="确认弹窗")
    @allure.step("确认弹窗")
    def confirm_alert(driver, **kwargs):
        print(f"确认弹窗")
        driver.switch_to.alert.accept()

    @staticmethod
    @registry_method(desc="取消弹窗确认")
    @allure.step("取消弹窗确认")
    def cancel_alert(driver, **kwargs):
        print(f"取消弹窗确认")
        driver.switch_to.alert.dismiss()

    @staticmethod
    @registry_method(desc="在弹窗中输入内容并确认")
    @allure.step("在弹窗中输入内容并确认")
    def send_keys_to_alert(driver, text, **kwargs):
        print(f"在弹窗中输入内容并确认")
        driver.switch_to.alert.send_keys(text)
        driver.switch_to.alert.accept()

    @staticmethod
    @registry_method(desc="切换回当前页面最顶层")
    @allure.step("切换回当前页面最顶层")
    def switch_to_default_content(driver, **kwargs):
        print(f"切换回当前页面最顶层")
        driver.switch_to.default_content()

    @staticmethod
    @registry_method(desc="切换页面")
    @allure.step("切换页面")
    def switch_to_frame(driver, title, **kwargs):
        print(f"切换页面")
        for window_handle in driver.window_handles:
            driver.switch_to.window(window_handle)
            if title in DriverOperate.get_title(driver):
                break


class ElementOperate:
    @staticmethod
    @registry_method(desc="点击操作")
    @allure.step("点击操作")
    def click(driver, element, **kwargs):
        print(f"进行点击操作,element:{element}")
        BaseOperate.locate_element(driver, element).click()

    @staticmethod
    @registry_method(desc="输入操作")
    @allure.step("输入操作")
    def send_key(driver, element, text, **kwargs):
        print(f"进行输入操作,element:{element}, text: {text}")
        BaseOperate.locate_element(driver, element).send_keys(text)

    @staticmethod
    @registry_method(desc="获取元素文本值")
    @allure.step("获取元素文本值")
    def get_element_text(driver, element, **kwargs):
        print(f"获取元素文本值")
        return BaseOperate.locate_element(driver, element).text

    @staticmethod
    @registry_method(desc="清空内容")
    @allure.step("清空内容")
    def clear_content(driver, element, **kwargs):
        print(f"清空内容")
        BaseOperate.locate_element(driver, element).clear()

    @staticmethod
    @registry_method(desc="获取元素值")
    @allure.step("获取元素值")
    def get_element_attribute(driver, element, attribute, **kwargs):
        print(f"获取元素值")
        return BaseOperate.locate_element(driver, element).get_attribute(attribute)

    @staticmethod
    @registry_method(desc="元素是否启用")
    @allure.step("元素是否启用")
    def is_enabled(driver, element, **kwargs):
        print(f"元素是否启用")
        return BaseOperate.locate_element(driver, element).is_enabled()
