*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://www.saucedemo.com/    
${browser}    gc
${locator_user}    id=user-name
${locator_pass}    id=password
${locator_errormsg}    xpath=//*[@id="login_button_container"]/div/form/div[3]/h3
${locator_btnlogin}    id=login-button

*** Keywords ***
open Web browser
    [Arguments]    ${link}    ${browsername}
    Open Browser    ${link}    ${browsername}
    Maximize Browser Window

input data
    [Arguments]    ${user}    ${txt1}    ${pass}    ${txt2}
    Wait Until Element Is Visible    ${user}
    Input Text    ${user}    ${txt1}
    Wait Until Element Is Visible    ${pass}
    Input Text    ${pass}    ${txt2}
    Click Element    ${locator_btnlogin}

Verify check error msg
    [Arguments]    ${error}    ${txt}
    Wait Until Element Is Visible    ${error}
    ${text}    Get Text    ${error}
    Should Be Equal As Strings    ${text}    ${txt}



*** Test Cases ***
Verify input data
    open Web browser    ${url}    ${browser}
    input data    ${locator_user}    ${EMPTY}    ${locator_pass}    ${EMPTY}
    Verify check error msg    ${locator_errormsg}     Epic sadface: Username is required
    Close Browser

Verify input data fail 
    open Web browser    ${url}    ${browser}
    input data    ${locator_user}    KKKK    ${locator_pass}    123
    Verify check error msg    ${locator_errormsg}      Epic sadface: Username and password do not match any user in this service  
    Close Browser