*** Settings ***
Library  SeleniumLibrary
Resource  ../../Config/Config.robot


*** Variables ***
${homepage_title}  Ihr Möbel & Interior Online-Shop | WestwingNow
${accept_cookies_button}  id=onetrust-accept-btn-handler

*** Keywords ***
Load
    [Documentation]  Loads the home page of the website
    Go To  ${URL}

Verify Page Loaded
    [Documentation]  Verifies the home page was loaded successfully
    Log  Verifying home page loaded
    Wait Until Keyword Succeeds  15s  10s  Title Should Be  ${homepage_title}

Accept Cookies
    [Documentation]  Clears the cookie disclaimer by accepting the cookies
    Log  Accepting cookies
    ${should_accept_cookies}=  Run Keyword And Return Status  Page Should Contain Button  ${accept_cookies_button}
    Run Keyword If  ${should_accept_cookies}  Click Element  ${accept_cookies_button}


#Potentially we can have another keyword to reject the cookies and see what the effects of this action are