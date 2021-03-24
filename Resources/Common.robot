*** Settings ***
Resource  Objects/CommonWeb.robot


*** Keywords ***
Start Suite
    [Documentation]  Launches the browser and navigates to the login page
    CommonWeb.Launch Browser


Finish Suite
    [Documentation]  Closes the browser
    CommonWeb.Close Opened Browser


Finish Test
    [Documentation]  Takes a screenshot at the end of the test
    CommonWeb.Take End Of Test Screenshot

