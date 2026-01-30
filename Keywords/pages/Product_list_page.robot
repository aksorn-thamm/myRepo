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

Click Product
    [Documentation]    ระบบจะตรวจสอบการแสดง Product และ Click
    [Arguments]    ${locator}
    ${is_visible}    Common.Is Element Visible    ${locator}
    IF    ${is_visible}
        SeleniumLibrary.Click Element    ${locator}
    ELSE
        BuiltIn.Log To Console    No product displayed
    END