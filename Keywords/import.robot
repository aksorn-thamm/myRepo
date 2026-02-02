*** SETTINGS ***
Library     Collections
Library     String
Library     SeleniumLibrary
Library     DebugLibrary

##Keyword
Resource     ${CURDIR}/common.robot
Resource     ${CURDIR}/pages/home_page.robot
Resource     ${CURDIR}/pages/product_list_page.robot
Resource     ${CURDIR}/pages/detail_cart_page.robot
Resource     ${CURDIR}/features/open_close_Features.robot
Resource     ${CURDIR}/features/search_product.robot

##Locator
Resource     ${CURDIR}/../resources/locators/page/home_locators.robot
Resource     ${CURDIR}/../resources/locators/page/list_cart_locator.robot
Resource     ${CURDIR}/../resources/locators/page/detail_cart_page.robot

##Test Data
Variables    ${CURDIR}/../resources/Settings/uat/settings.yaml
Variables    ${CURDIR}/../resources/testdata/uat/home_page.yaml
Variables    ${CURDIR}/../resources/testdata/uat/widget_data.yaml
Variables    ${CURDIR}/../resources/testdata/uat/detail_page.yaml
Variables    ${CURDIR}/../resources/testdata/uat/list_page.yaml
