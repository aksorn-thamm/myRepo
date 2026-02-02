*** Keywords ***

Click product and get name
    [Documentation]    อ่านชื่อสินค้าจากหน้า list ตัดช่องว่าง แล้วคลิกสินค้า พร้อมคืนค่าชื่อสินค้าที่อ่านได้
    [Arguments]    ${name_locator}    ${click_locator}
    SeleniumLibrary.Wait Until Element Is Visible    ${name_locator}
    ${product_name}    SeleniumLibrary.Get Text    ${name_locator}
    ${product_name}    String.Strip String    ${product_name}
    SeleniumLibrary.Wait Until Element Is Visible    ${click_locator}
    SeleniumLibrary.Click Element    ${click_locator}
    RETURN    ${product_name}

# Verify product name in detail page 
#     [Documentation]    ตรวจสอบว่าชื่อสินค้าบนหน้า Detail ตรงกับชื่อสินค้าที่ส่งเข้ามา
#     [Arguments]    ${expected_name}    ${detail_locator}
#     ${detail_name}    Common.Get Element Text    ${detail_locator}
#     BuiltIn.Should Be Equal    ${expected_name}    ${detail_name}

Verify product name in detail page
    [Documentation]    ตรวจสอบชื่อสินค้าในหน้า Detail
    [Arguments]    ${expected_name}

    ${detail_name}    SeleniumLibrary.Get Text    ${LBL_PRODUCT_DETAIL_NAME}
    ${detail_name}    Strip String    ${detail_name}
    ${expected_name}  Strip String    ${expected_name}

    Should Be Equal
    ...    ${expected_name}
    ...    ${detail_name}

