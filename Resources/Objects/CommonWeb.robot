*** Settings ***
Library  SeleniumLibrary
Resource  ../../Config/config.robot


*** Keywords ***
Launch Browser
    [Documentation]  Launches the browser, maximizes it and navigates to the login page
    Open Browser  ${URL}  ${BROWSER}
    Maximize Browser Window
    Set Selenium Implicit Wait  10

