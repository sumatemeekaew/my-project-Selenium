*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://automate-test.stpb-digital.com/
${browser}    gc
${locator_email}    id=email
${locator_password}    name=password
${locator_msg_email}    xpath=//*[@id="__next"]/div[1]/div/div/div[2]/div/div/form/div[1]/p
${locator_msg_password}    xpath=//*[@id="__next"]/div[1]/div/div/div[2]/div/div/form/div[2]/p
${locator_btnlogin}    id=btn-login

*** Keywords ***
Open Website
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Wait Until Page Contains    Welcome

Input Email
    Set Selenium Speed    0.5S
    [Arguments]    ${input}
     Wait Until Element Is Visible    ${locator_email}
     Input Text    ${locator_email}    ${input}
     Press Keys    ${locator_email}    ENTER

Input data
    [Arguments]    ${inputemail}    ${inputpassword}
    Wait Until Element Is Visible   ${locator_email}
    Wait Until Element Is Visible   ${locator_password}     
    Input Text    ${locator_email}    ${inputemail}
    Input Text    ${locator_password}    ${inputpassword}
    Click Element    ${locator_btnlogin}

Verify error msg email
    Wait Until Element Is Visible    ${locator_msg_email}
    ${txt}    Get Text    ${locator_msg_email}
    Should Be Equal As Strings    ${txt}    email must be a valid email

Verify error msg password
    Wait Until Element Is Visible    ${locator_msg_password}
    ${txt}    Get Text    ${locator_msg_password}
    Should Be Equal As Strings    ${txt}    password must be at least 5 characters        

*** Test Cases ***
Verify input email field
    @{list}    Create List    kkkkkkkkkk    0000000000    เทส
    FOR  ${i}    IN    @{list}   
     Open Website
     Input Email    ${i}
     Verify error msg email
     Close Browser
    END

Verify input data
    @{list}    Create List    000000000    123    lllllllll    สสส    กกกก    www
    FOR  ${email}    ${pass}  IN    @{list}
       Open Website
       Input data     ${email}    ${pass}
       Verify error msg email
       Verify error msg password
       Close Browser
    
    END
    
