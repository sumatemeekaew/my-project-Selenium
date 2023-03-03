*** Settings ***
Library    SeleniumLibrary
Resource       ${CURDIR}/variable.robot
Resource       ${CURDIR}/Keyword.robot
Suite Setup    Set Selenium Speed    0.5s
Suite Teardown    Close All Browsers
Test Setup       Open Webbrowser
Test Teardown    Close Browser




*** Test Cases ***
TC001-input data
    [Documentation]    ใช้สำหรับทดสอบในกรณีกรอกข้อมูลครบถ้วนสมบูรณ์
    [Tags]    test pass
    input data for register (positive)
    click sign-up
    
    

TC002-Reset Data
    [Documentation]    ใช้สำหรับทดสอบในกรณีเคลียข้อมูล
    [Tags]    test reset
    
    input data for register (positive)   
    Click Element                                 ${locator_reset}
    

TC003-Require field

    [Documentation]    ใช้สำหรับทดสอบในกรณีกรอกข้อมูลไม่ครบถ้วน
    [Tags]    test fail
    [Template]    input data for register (positive)-Test Template
    ${EMPTY}    อินขาน    Beam1234@gmail.com    1234567890    08222222222    female     1    1    1    1     ${locator_msg_require_first_name}    This field is required
    กนกนวล     ${EMPTY}  Beam1234@gmail.com    1234567890    08222222222    female     1    1    1    1     ${locator_msg_require_Last_name}     This field is required
    กนกนวล      อินขาน    ${EMPTY}              1234567890    08222222222    female     1    1    1    1     ${locator_msg_require_email}         This field is required
    กนกนวล      อินขาน    Beam1234@gmail.com    ${EMPTY}      08222222222    female     1    1    1    1     ${locator_msg_require_password}      This field is required
    กนกนวล      อินขาน    Beam1234@gmail.com    1234567890    ${EMPTY}       female     1    1    1    1     ${locator_msg_require_MP}            This field is required
    กนกนวล      อินขาน    Beam1234@gmail.com    1234567890    08222222222    0          1    1    1    1     ${locator_msg_require_Gendor}        This field is required
    กนกนวล      อินขาน    Beam1234@gmail.com    1234567890    08222222222    female     0    1    1    1     ${locator_msg_require_Check Box}     This field is required
    กนกนวล      อินขาน    Beam1234@gmail.com    1234567890    08222222222    female     1    0    1    1     ${locator_msg_national}              This field is required
    กนกนวล      อินขาน    Beam1234@gmail.com    1234567890    08222222222    female     1    1    0    1     ${locator_drop_down_Role}            This field is required
    กนกนวล      อินขาน    Beam1234@gmail.com    1234567890    08222222222    female     1    1    1    0     ${locator_drop_down_plan}            This field is required
       
    

    









