*** SETTINGS ***
Documentation    
...    ทดสอบฟังก์ชันการค้นหาสินค้าบนเว็บไซต์ Lotus
...    ครอบคลุมการเปิดหน้าเว็บ, การยอมรับคุกกี้,
...    การตรวจสอบเมนูหมวดหมู่ และการค้นหาสินค้า
...    เพื่อยืนยันว่าระบบแสดงผลถูกต้อง
Variables           ${CURDIR}/../resources/Testdata/Uat/Detail_page.yaml
Resource            ${CURDIR}/../Keywords/import.robot
Test Setup          home_page.Open Lotuss Website
Test Teardown       Common.Close Website

*** Test Cases ***
TC001 Lotus Web Search Product
    [Documentation]    ตรวจสอบการค้นหาสินค้าบนหน้าเว็บไซต์ Lotus
    [Tags]      TC_001
    Home_page.Accept cookie if display                      ${btn_ACCEPT_COOKIE}
    Common.Verify Menu List                                 @{category}
    Home_page.Search Xiaomi                                 ${txt_SERCH_INPUT}              ${product.product1}
    Product_list_page.Click close delivery popup            ${btn_CLOSE}
    Detail_cart_page.Click Product And Get Name             ${lbl_XIAOUMI_LIST}             ${lbl_XIAOUMI_LIST}
    Detail_cart_page.Verify Product Name In Detail page     ${TC_001.Verify.productName}    ${lbl_XIAOUMI_DETAIL}    