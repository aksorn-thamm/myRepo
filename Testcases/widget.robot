***Settings***
Resource            ${CURDIR}/../Keywords/import.robot
Variables           ${CURDIR}/../resources/Testdata/Uat/widget_data.yaml
Variables           ${CURDIR}/../resources/language/home.yaml
Test Setup          home_page.Open Lotuss Website
Test Teardown       Common.Close Website

*** Test Cases ***
TC001 Verify widget display corretly
    [Documentation]    Test
    [Tags]    TC001
    # Debug
    ${catName}    Get widget display corretly
    common.Verify catagory name display correcly    ${catName}    ${TC_001.Verify.category}

TC002 Verify change language corretly
    [Documentation]    Test
    [Tags]    TC002
    # Debug
    common.change language
    common.Verify catagory name should correcly