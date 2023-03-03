*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/loginvariable.robot

*** Keywords ***
Open Website
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Wait Until Element Is Visible    ${locator_user}

Input User and Password
    Wait Until Element Is Visible    ${locator_user}
    Wait Until Element Is Visible    ${locator_pass}
    Input Text    ${locator_user}    standard_user
    Input Text    ${locator_pass}    secret_sauce
    Click Element    ${locator_btnlogib}
    Wait Until Element Is Visible    ${locator_pageproduct}