*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Resource  ../../Config/Config.robot


*** Keywords ***
Launch Browser
    [Documentation]  Launches the browser, maximizes it and navigates to the login page
    Open Browser  browser=${BROWSER}
    Maximize Browser Window
    Set Selenium Implicit Wait  10


Close Opened Browser
    [Documentation]  Closes the launched browser at the end of the test suite
    Close Browser


Take End Of Test Screenshot
    [Documentation]  Captures a screenshot at the end of the test
    ${timestamp} =  Get Current Date  result_format=%Y%m%d-%H%M%S
    Capture Page Screenshot  end_of_test_${timestamp}.png
