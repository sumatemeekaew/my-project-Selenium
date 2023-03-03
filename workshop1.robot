*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${url}                             https://automate-test.stpb-digital.com/register/
${Browser}                         gc
${locator_firstname}               id=firstname    
${locator_lastname}                id=lastname
${locator_gendor}                  validation-basic-radio
${locator_chkSQL}                  name=courses.SQL
${locator_btn-sign-up}             id=btn-sign-up 
${locator_reset}                   id=reset  
${locator_email}                   id=email
${locator_password}                id=password   
${locator_m.phone}                 id=mobile-phone
${locator_chk_testManual}          name=courses.Test Manual
${locator_chk_testAutomate}        name=courses.Automate Test
${locator_chk_testAutomate2}       name=courses.Automate Test2  
${locator_drop_down_nationality}   id=nationality
${locator_drop_down_thai}          xpath=//*[@id="menu-"]/div[3]/ul/li[221] 
${locator_drop_down_Role}          id=select-role
${locator_drop_down_Admin}         xpath=//*[@id="menu-"]/div[3]/ul/li[1]   
${locator_drop_down_plan}          id=select-plan
${locator_drop_down_Basic}         xpath=//*[@id="menu-"]/div[3]/ul/li[1]   
${locator_msg_require_first_name}  id=error-firstname
${locator_msg_require_Last_name}   id=error-lastname
${locator_msg_require_email}       css=#error-email    
${locator_msg_require_password}    id=error-password    
${locator_msg_require_MP}          id=error-mobile-phone    
${locator_msg_require_Gendor}      id=validation-basic-gender    
${locator_msg_require_Check Box}   id=validation-basic-courses
${locator_Sign_in_instead}         css=#__next > div.layout-wrapper.MuiBox-root.css-33gw4 > div > div > div > div > div > div > form > div.MuiBox-root.css-z0xj7h > p.MuiTypography-root.MuiTypography-body1.css-azsy9a > a        
${locator_msg_national}            xpath=//*[@id="validation-basic-nationality"]
${locator_msg_Role}                xpath=//*[@id="validation-role"]
${locator_msg_plan}                xpath=//*[@id="validation-plan"]      





*** Keywords ***
Open Webbrowser
    Set Selenium Speed                             0.5s 
    Open Browser                                   ${url}                          ${Browser}
    Wait Until Page Contains                       Kru P' Beam                     2s
    Maximize Browser Window

input data for register (positive)
    Input Text                                     ${locator_firstname}            กนกนวล
    Input Text                                     ${locator_lastname}             อินขาน
    Input Text                                     ${locator_email}                Beam1234@gmail.com
    Input Text                                     ${locator_password}             1234567890 
    Input Text                                     ${locator_m.phone}              08222222222         
    Select Radio Button                            ${locator_gendor}               female
    Select Radio Button                            ${locator_gendor}               male
    Select Checkbox                                ${locator_chkSQL}
    Select Checkbox                                ${locator_chk_testManual}
    Select Checkbox                                ${locator_chk_testAutomate}
    Select Checkbox                                ${locator_chk_testAutomate2}
    Select list Nationality
    Select List Role
    Select list Plan    

input data for Check E-mail (negative)  
    Input Text                                     ${locator_email}                ไทย
    click sign-up
    Close Browser
    Open Webbrowser
    Input Text                                     ${locator_email}                09912345678
    click sign-up
    


click sign-up            
    Click Element                                  ${locator_btn-sign-up}
click sign-up-instead
    Click Element                                  ${locator_Sign_in_instead}    



Select list Nationality
    Click Element                                  ${locator_drop_down_nationality}
    Wait Until Element Is Visible                  ${locator_drop_down_thai}                 2s
    Click Element                                  ${locator_drop_down_thai}
Select List Role    
    Click Element                                  ${locator_drop_down_Role}
    Wait Until Element Is Visible                  ${locator_drop_down_Admin}                2s 
    Click Element                                  ${locator_drop_down_Admin} 
 Select list Plan   
    Click Element                                  ${locator_drop_down_plan}
    Wait Until Element Is Visible                  ${locator_drop_down_Basic}                2s
    Click Element                                  ${locator_drop_down_Basic}

check require field
    Wait Until Element Is Visible                  ${locator_msg_require_first_name}         2S
    ${txt}    Get Text                             ${locator_msg_require_first_name} 
    Should Be Equal As Strings                     ${txt}                                    This field is required
    Wait Until Element Is Visible                  ${locator_msg_require_Last_name}          2S
    ${txt}    Get Text                             ${locator_msg_require_Last_name}
    Should Be Equal As Strings                     ${txt}                                    This field is required
     Wait Until Element Is Visible                 ${locator_msg_require_email}              5s
    ${txt}    Get Text                             ${locator_msg_require_email}
    Should Be Equal As Strings                     ${txt}                                    This field is required
     Wait Until Element Is Visible                 ${locator_msg_require_password}           2S
    ${txt}    Get Text                             ${locator_msg_require_password}
    Should Be Equal As Strings                     ${txt}                                    This field is required
     Wait Until Element Is Visible                 ${locator_msg_require_MP}                 2S
    ${txt}    Get Text                             ${locator_msg_require_MP}
    Should Be Equal As Strings                     ${txt}                                    This field is required                                
     Wait Until Element Is Visible                 ${locator_msg_require_Gendor}             2S
    ${txt}    Get Text                             ${locator_msg_require_Gendor}
    Should Be Equal As Strings                     ${txt}                                    This field is required
     Wait Until Element Is Visible                 ${locator_msg_require_Check Box}          2S
    ${txt}    Get Text                             ${locator_msg_require_Check Box}
    Should Be Equal As Strings                     ${txt}                                    This field is required                                  
     Wait Until Element Is Visible                 ${locator_msg_national}                   2S
    ${txt}    Get Text                             ${locator_msg_national}
    Should Be Equal As Strings                     ${txt}                                    This field is required                                  
     Wait Until Element Is Visible                 ${locator_msg_plan}                       2S
    ${txt}    Get Text                             ${locator_msg_plan}
    Should Be Equal As Strings                     ${txt}                                    This field is required                                  
     Wait Until Element Is Visible                 ${locator_msg_Role}                       2S
    ${txt}    Get Text                             ${locator_msg_Role}
    Should Be Equal As Strings                     ${txt}                                    This field is required                                  







*** Test Cases ***
TC001-input data
    Open Webbrowser
    input data for register (positive)
    click sign-up
    Close Browser
    

TC002-Reset Data
    Open Webbrowser
    input data for register (positive)
    Click Element                                 ${locator_reset}
    Close Browser

TC003-Require field
    Open Webbrowser
    click sign-up
    check require field
    Close Browser
TC004-Sign-in-instead
    Open Webbrowser
    click sign-up-instead
    Close Browser
TC-005-Check email(negative)
    Open Webbrowser
    input data for Check E-mail (negative)
    Close Browser


    









