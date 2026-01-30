*** SETTINGS ***
Library     Collections
Library     String
Library     SeleniumLibrary
Library     DebugLibrary

##Keyword
Resource     ${CURDIR}/common.robot
Resource     ${CURDIR}/pages/home_page.robot
Resource     ${CURDIR}/pages/Product_list_page.robot
Resource     ${CURDIR}/pages/Detail_cart_page.robot
Resource     ${CURDIR}/../resources/Locators/page/Detail_cart_page.robot

##Locator
Resource     ${CURDIR}/../resources/Locators/page/Home_locators.robot
Resource     ${CURDIR}/../resources/Locators/page/List_cart_locator.robot

##Test Data
Variables    ${CURDIR}/../resources/Settings/Uat/Settings.yaml
Variables    ${CURDIR}/../resources/Testdata/Uat/Home_page.yaml
Variables    ${CURDIR}/../resources/Testdata/Uat/widget_data.yaml
Variables    ${CURDIR}/../resources/Testdata/Uat/Detail_page.yaml
Variables    ${CURDIR}/../resources/Testdata/Uat/List_page.yaml
