*** SETTINGS ***
Documentation    
...    ทดสอบฟังก์ชันการค้นหาสินค้าบนเว็บไซต์ Lotus
...    ครอบคลุมการเปิดหน้าเว็บ, การยอมรับคุกกี้,
...    การตรวจสอบเมนูหมวดหมู่ และการค้นหาสินค้า
...    เพื่อยืนยันว่าระบบแสดงผลถูกต้อง
#${env รอแก้
Variables           ${CURDIR}/../resources/testdata/uat/detail_page.yaml
Resource            ${CURDIR}/../keywords/import.robot
Test Setup          open_close_Features.Open lotuss website
Test Teardown       open_close_Features.Close website

*** Test Cases ***
TC001 Lotus web search product and Verify product name in detail page 
    [Documentation]    ตรวจสอบการค้นหาสินค้าบนหน้าเว็บไซต์ Lotus
    [Tags]      TC_001
    home_page.Accept cookie if display                      ${btn_ACCEPT_COOKIE}
    common.Verify menu list                                 @{category}
    home_page.Input search to text                          ${product.product1}
    product_list_page.Click close delivery popup            ${btn_CLOSE}
    # detail_cart_page.Click product and get name             ${lbl_XIAOUMI_LIST}             ${lbl_XIAOUMI_LIST}
    # detail_cart_page.Verify product name in detail page     ${TC_001.Verify.productName}    ${lbl_XIAOUMI_DETAIL}
    ${product_name}    product_list_page.Get product name from list    ${TC_001.Search.productName}
    product_list_page.Click product
    detail_cart_page.Verify product name in detail page              ${product_name}