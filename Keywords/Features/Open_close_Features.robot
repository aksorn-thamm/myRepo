*** Keywords ***

Open lotuss website
    [Documentation]    เปิดเว็บไซต์ Lotuss ตาม URL ที่กำหนด
    common.Open Website    ${url.lotuss}

Close website
    [Documentation]    ปิดเบราว์เซอร์ที่เปิดใช้งานอยู่
    SeleniumLibrary.Close Browser
