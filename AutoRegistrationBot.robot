*** Settings ***
Library           Selenium2Library
Library           OperatingSystem 
*** Keywords ***
Set Environment Variable   webdriver.gecko.driver  geckodriver.exe
*** Variables ***
${Browser}        Firefox
${SiteUrl}        https://twitter.com/signup
${FullName}       Dyno Bot  
${Email}          test_developer13@yahoo.com
${Password}       !q@w3e4r5t 
${Delay}          5s  
*** Keywords *** 
Open page
    open browser    ${SiteUrl}      ${browser}     
    Maximize Browser Window
fill registration form  
    Input Text       id=full-name   ${FullName}
    Input Text       id=email       ${Email}
    Input Text       id=password    ${Password}
Check tailor twitter checkbox and submit registration
    Sleep   ${Delay}
    ${input_value}      Get Value      xpath=//input[@name='user[use_cookie_personalization]']
    Run Keyword If      '${input_value}' == '1'     submit register  
    [Teardown]    Close Browser
submit register
    Click Element  xpath=//input[@id='submit_button']
*** Test Cases ***
Twitter Registration Flow 
    Open Page   
    fill registration form
    Check tailor twitter checkbox and submit registration
