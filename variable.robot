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
      