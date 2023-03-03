*** Settings ***
Library     SeleniumLibrary
*** Variables ***
${url}                            https://automate-test.stpb-digital.com/
${browser}                        gc
${locator_email}                  id=email
${locator_password}               name=password
${locator_btnlogin}               id=btn-login 
${locator_msg_email}              css=#__next > div.layout-wrapper.MuiBox-root.css-33gw4 > div > div > div.MuiBox-root.css-15tnlg1 > div > div > form > div.MuiFormControl-root.MuiFormControl-fullWidth.css-m5bgtg > p
${locator_msg_email not correct}  css=#__next > div.layout-wrapper.MuiBox-root.css-33gw4 > div > div > div.MuiBox-root.css-15tnlg1 > div > div > form > div.MuiFormControl-root.MuiFormControl-fullWidth.css-m5bgtg > p
${locator_msg_password fail}      css=#__next > div.layout-wrapper.MuiBox-root.css-33gw4 > div > div > div.MuiBox-root.css-15tnlg1 > div > div > form > div.MuiFormControl-root.MuiFormControl-fullWidth.css-tzsjye > p
${locator_msg_require field}      css=#__next > div.layout-wrapper.MuiBox-root.css-33gw4 > div > div > div.MuiBox-root.css-15tnlg1 > div > div > form > div.MuiFormControl-root.MuiFormControl-fullWidth.css-m5bgtg > p
${locator_Hyperlink}              css=#__next > div.layout-wrapper.MuiBox-root.css-33gw4 > div > div > div.MuiBox-root.css-15tnlg1 > div > div > form > div.MuiBox-root.css-z0xj7h > p.MuiTypography-root.MuiTypography-body1.css-azsy9a > a

*** Keywords ***    

Open Web browser
    Open Browser                              ${url}                ${browser}
    Maximize Browser Window
    Set Selenium Speed                                               2.2s
Input data for check field email
    Input Text                                ${locator_email}       Beam1234@gmail.com
    Input Text                                ${locator_password}    ${EMPTY} 
    Click Element                             ${locator_btnlogin}   
Input data for check field email fail 1 
    Input Text                                ${locator_email}       ไทย
    Input Text                                ${locator_password}    ${EMPTY}
    Click Element                             ${locator_btnlogin} 
Input data for check field email fail 2
    Input Text                               ${locator_email}       09912345678
    Input Text                               ${locator_password}    ${EMPTY}
    Click Element                            ${locator_btnlogin} 
Input data for check password  
    Input Text                                ${locator_email}       ${EMPTY}
    Input Password                            ${locator_password}    1234567890
    Click Element                             ${locator_btnlogin}  
Input data for check password fail 1
    Input Text                                ${locator_email}       ${EMPTY}
    Input Password                            ${locator_password}    123
    Click Element                             ${locator_btnlogin}
Input data for check password fail 2
    Input Text                                ${locator_email}       ${EMPTY}
    Input Password                            ${locator_password}    beam
    Click Element                             ${locator_btnlogin}

Input data for login page
    Input Text                                ${locator_email}       user.test@krupbeam.com
    Input Text                                ${locator_password}    123456789
    Click Element                             ${locator_btnlogin}
      
Input data for login page fail
    Input Text                                ${locator_email}       admin@krupbeam.com 
    Input Text                                ${locator_password}    123456789
    Click Element                             ${locator_btnlogin}
click button login
    Input Text                               ${locator_email}        ${EMPTY}
    Input Text                               ${locator_password}     ${EMPTY}
    Click Element                            ${locator_btnlogin}
click hyperlink Create an account
    Click Element                            ${locator_Hyperlink}    




*** Test Cases ***
TC001-Check Screen
    Open Web browser
    Wait Until Page Contains                                                                 Kru P' Beam 
    Close Browser


TC002-Field email pass
    Open Web browser
    Wait Until Element Is Visible                       ${locator_email}                     2s
    Input data for check field email
    Close Browser

TC003-Field email fail
    Open Web browser
    Input data for check field email fail 1
    Wait Until Element Is Visible                       ${locator_msg_email not correct}     2s   
    ${txt}    Get Text                                  ${locator_msg_email not correct}
    Should Be Equal As Strings                          ${txt}                               email must be a valid email
    Close Browser
    Open Web browser
    Input data for check field email fail 2
    Wait Until Element Is Visible                       ${locator_msg_email not correct}     2s 
    ${txt}    Get Text                                  ${locator_msg_email not correct}
    Should Be Equal As Strings                          ${txt}                               email must be a valid email
    Close Browser
TC004-Field password
    Open Web browser
    Wait Until Element Is Visible                        ${locator_password}                  2s
    Input data for check password
    Close Browser
TC005-Field password fail 
    Open Web browser
    Wait Until Element Is Visible                       ${locator_password}                   2s
    Input data for check password fail 1
    ${txt}    Get Text                                  ${locator_msg_password fail}
    Should Be Equal As Strings                          ${txt}                                password must be at least 5 characters  
    Close Browser
    Open Web browser
    Wait Until Element Is Visible                       ${locator_password}                   2s
    Input data for check password fail 2
    ${txt}    Get Text                                  ${locator_msg_password fail}
    Should Be Equal As Strings                          ${txt}                                password must be at least 5 characters  
     Close Browser

TC006-login pass
    Open Web browser
    Input data for login page
    Close Browser

TC007-login fail
    Open Web browser
    Input data for login page fail
    ${txt}    Get Text                                 ${locator_msg_email}
    Should Be Equal As Strings                         ${txt}                                Email or Password is invalid
    Close Browser   
TC008- check require field
    Open Web browser
    click button login
    Wait Until Element Is Visible                      ${locator_msg_require field}          2S
    ${txt}    Get Text                                 ${locator_msg_require field}
    Should Be Equal As Strings                         ${txt}                                email is a required field
    Close Browser
TC009- check hyperlink
    Open Web browser
    Wait Until Element Is Visible                      ${locator_Hyperlink}                  2S
    click hyperlink Create an account      
    Close Browser
    


     
    



