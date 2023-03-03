*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/loginKeyword.robot

*** Test Cases ***
Verify login pass

    Open Website
    Input User and Password
    Close Browser