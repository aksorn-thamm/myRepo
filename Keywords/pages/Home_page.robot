*** Keywords ***

Open lotuss website
    [Documentation]    เปิดเว็บไซต์ Lotuss ตาม URL ที่กำหนด
    common.Open Website    ${url.lotuss}
    
Accept cookie if display
    [Documentation]    ตรวจสอบว่า cookie banner แสดงหรือไม่ หากแสดงให้คลิกยอมรับ หากไม่แสดงให้ข้าม
    [Arguments]    ${cookie_locator}
    ${is_visible}    Common.Is Element Visible    ${cookie_locator}
    IF    ${is_visible}
        SeleniumLibrary.Click Element    ${cookie_locator}
    ELSE
        BuiltIn.Log To Console    No cookie banner displayed
    END

Input search to text  
    [Documentation]    ค้นหาสินค้าด้วยการกรอกข้อความและกด Enter ในช่องค้นหา
    [Arguments]     ${text}
    Input Text And Press Enter     ${txt_SERCH_INPUT}    ${text}
