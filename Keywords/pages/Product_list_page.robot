*** Keywords ***

Click close delivery popup
    [Documentation]    ระบบจะตรวจสอบการแสดง popup เลือกรูปแบบการจัดส่ง 
...                หาก popup และปุ่มปิด (X) ปรากฏ ให้กดปิด 
...                หากไม่ปรากฏ ให้ดำเนินการทดสอบขั้นตอนถัดไป
    [Arguments]    ${locator}
    ${is_visible}    Common.Is Element Visible    ${locator}
    IF    ${is_visible}
        SeleniumLibrary.Click Element    ${locator}
    ELSE
        BuiltIn.Log To Console    No popup displayed
    END

# Click Product
#     [Documentation]    ระบบจะตรวจสอบการแสดง Product และ Click
#     [Arguments]    ${locator}
#     ${is_visible}    Common.Is Element Visible    ${locator}
#     IF    ${is_visible}
#         SeleniumLibrary.Click Element    ${locator}
#     ELSE
#         BuiltIn.Log To Console    No product displayed
#     END

Click product
    [Documentation]    คลิกสินค้าจากหน้า list
    SeleniumLibrary.Wait Until Element Is Visible  ${lbl_XIAOUMI_DETAIL}  
    SeleniumLibrary.Click Element    ${lbl_XIAOUMI_DETAIL}


Get product name from list
    [Documentation]    ดึงชื่อสินค้าจากหน้า list
    [Arguments]    ${product}
    SeleniumLibrary.Wait Until Element Is Visible  ${lbl_XIAOUMI_DETAIL}    20s
    ${product_name}    SeleniumLibrary.Get Text    ${lbl_XIAOUMI_DETAIL}
    ${product_name}    Strip String    ${product_name}
    RETURN    ${product_name}


