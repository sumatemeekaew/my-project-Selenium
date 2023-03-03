*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/variable.robot





*** Keywords ***
Open Webbrowser
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



Verify error msg
    [Arguments]    ${locator}    ${errormsg}=${EMPTY}
    ${txt}=    Get Text    ${locator}
    Should Be Equal As Strings    ${txt}    ${errormsg}


input data for register (positive)-Test Template
    [Arguments]    ${firstname}    ${lastname}    ${email}    ${password}    ${m.phone}    ${gendor}    ${checkbox}    ${nationality}    ${role}    ${plan}     ${locator}    ${errormsg}   
    Input Text                                     ${locator_firstname}             ${firstname}
    Input Text                                     ${locator_lastname}              ${lastname}
    Input Text                                     ${locator_email}                 ${email}
    Input Text                                     ${locator_password}              ${password}
    Input Text                                     ${locator_m.phone}               ${m.phone}        
    IF  "${gendor}"!=0
    
    Select Radio Button    ${locator_gendor}    ${gendor}

    END
      
    


    IF  ${checkbox} == 1
        Select Checkbox                                ${locator_chkSQL} 
   
   
    ELSE IF    ${checkbox} == 2
        Select Checkbox                                ${locator_chkSQL}
        Select Checkbox                                ${locator_chk_testManual}
     
     
    ELSE IF    ${checkbox} == 3
    Select Checkbox                                ${locator_chkSQL}
    Select Checkbox                                ${locator_chk_testManual}
    Select Checkbox                                ${locator_chk_testAutomate}     

    ELSE IF    ${checkbox} == 4
    Select Checkbox                                ${locator_chkSQL}
    Select Checkbox                                ${locator_chk_testManual}
    Select Checkbox                                ${locator_chk_testAutomate}
    Select Checkbox                                ${locator_chk_testAutomate2}
    
    
    END
    
    IF  ${nationality}==1
    
     Select list Nationality
        
    END
    
    IF    ${role}==1

    Select List Role
    END

    IF    ${plan}==1

    Select list Plan 

    END   

    click sign-up
    
    Verify error msg    ${locator}    ${errormsg} 
    
    
   


    
    
    

        
   



