*** Keywords ***

Open Website
    [Documentation]    เปิดเบราว์เซอร์และเข้าเว็บไซต์ตาม URL ที่ระบุ
    [Arguments]    ${locator}
    SeleniumLibrary.Open Browser      ${locator}

Close website
    [Documentation]    ปิดเบราว์เซอร์ที่เปิดใช้งานอยู่
    SeleniumLibrary.Close Browser

Is Element Visible
    [Documentation]    ตรวจสอบว่า element แสดงผลหรือไม่ภายใน 60 วินาที และคืนค่าเป็น true/false
    [Arguments]    ${locator}
    ${status}    BuiltIn.Run Keyword And Return Status
    ...    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    60s
    RETURN    ${status}

Verify Element Text
    [Documentation]    ตรวจสอบว่า text ของ element ตรงกับค่าที่คาดหวัง และคืนค่า text ที่อ่านได้
    [Arguments]    ${locator}    ${expected_text}
    ${actual_text}    SeleniumLibrary.Get Text    ${locator}
    BuiltIn.Should Be Equal    ${actual_text}    ${expected_text}
    RETURN    ${actual_text}

Verify And Click Cookie Button
    [Documentation]    ตรวจสอบปุ่ม Cookie ว่าแสดงหรือไม่ หากแสดงให้ตรวจสอบข้อความและคลิกปุ่ม
    [Arguments]    ${locator}    ${expected_text}
    ${is_visible}    Common.Is Element Visible    ${locator}
    IF    ${is_visible}
        ${actual_text}    Common.Verify Element Text    ${locator}    ${expected_text}
        SeleniumLibrary.Click Element    ${locator}
    ELSE
        BuiltIn.Log To Console    Cookie button not found
    END

Verify menu list
    [Documentation]    ตรวจสอบว่าเมนูทั้งหมดที่คาดหวังแสดงอยู่บนหน้าเว็บ
    [Arguments]    @{expected_menus}
    FOR    ${menu}    IN    @{expected_menus}
        SeleniumLibrary.Wait Until page Contains    ${menu}    timeout=5s
    END

Input Text When Ready
    [Documentation]    รอจนกว่า input field จะแสดง จากนั้นกรอกข้อความที่กำหนด
    [Arguments]    ${input_locator}    ${text}
    SeleniumLibrary.Wait Until Element Is Visible    ${input_locator}
    SeleniumLibrary.Input Text    ${input_locator}    ${text}

Input Text And Press Enter
    [Documentation]    กรอกข้อความใน input field และกดปุ่ม Enter
    [Arguments]    ${input_locator}    ${text}
    Common.Input Text When Ready    ${input_locator}    ${text}
    SeleniumLibrary.Press Keys    ${input_locator}    ENTER

Get widget display corretly
    [Documentation]    ดึงชื่อ category จาก widget (swiper) ทั้งหมดและคืนค่าเป็น list
    Wait Until Element Is Visible    ((//div[contains(@class,"swiper-initialized")])[2]//button)    ${timeout.page}
    ${countwidget}    SeleniumLibrary.Get Element Count    (//div[contains(@class,"swiper-initialized")])[2]//button
    ${listwidget}     Create List
    FOR    ${index}    IN RANGE   1    ${countwidget}+1
        ${index}    Convert To String    ${index}
        ${locator}    Replace String    ((//div[contains(@class,"swiper-initialized")])[2]//button)[***replace***]
        ...    ***replace***    ${index}
        ${catName}    Get Text    ${locator}
        Append To List    ${listwidget}    ${catName}
    END
    RETURN        ${listwidget}

Verify catagory name display correcly
    [Documentation]    ตรวจสอบว่า category ทุกตัวจาก test data แสดงอยู่บนหน้าจอ
    [Arguments]    ${cat_onscreen}    ${list_testdata}
    FOR    ${cat_name}    IN    @{list_testdata}
        ${cat_name}    Replace String    ${cat_name}    \\n    \n
        List Should Contain Value    ${cat_onscreen}    ${cat_name}
    END

change language
    [Documentation]    เปลี่ยนภาษาของเว็บไซต์ (รองรับ TH และ EN)
    [Arguments]    ${lang_data}=EN
    Set Global Variable     ${lang}    ${lang_data}
    SeleniumLibrary.Wait Until Element Is Visible    id=language-${lang}
    Click Element    id=language-${lang}

Verify catagory name should correcly
    [Documentation]    อ่านชื่อ category จากตำแหน่งที่กำหนดบนหน้าจอ
    SeleniumLibrary.Wait Until Element Is Visible    ${lbl_CATEGORY_LOCATOR}    30s
    ${getCat}    SeleniumLibrary.Get Text    ${lbl_CATEGORY_LOCATOR}

Get Element Text
    [Documentation]    อ่าน text จาก element ตัดช่องว่างหน้า–หลัง และคืนค่าข้อความที่สะอาดแล้ว
    [Arguments]    ${locator}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}
    ${text}    SeleniumLibrary.Get Text    ${locator}
    ${text}    String.Strip String    ${text}
    RETURN    ${text}
