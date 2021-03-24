*** Settings ***
Library  SeleniumLibrary
Resource  ../../Config/Sensitive.robot


*** Variables ***
${login_overlay}  xpath=//div[@data-testid="login_and_register"]
${switch_to_login_button}  xpath=//button[@data-testid="login_reg_switch_btn"]
${email_field}  xpath=//input[@data-testid="long-register-email-field"]
${password_field}  xpath=//input[@data-testid="long-register-password-field"]
${login_button}  xpath=//button[@data-testid="login_reg_submit_btn"]

*** Keywords ***

Verify Login Overlay Is Present
    Element Should Be Visible  ${login_overlay}


Switch To Login Form
    Click Element  ${switch_to_login_button}


Login As
    [Documentation]  Logs in with the credentials corresponding to the type of account we specify by entering the email, password, and clicking the login button
    [Arguments]  ${account}

    # We only have 1 account for the moment, but this gives us the flexibility to re-use the keyword with other accounts
    # later down the line, where maybe we have scenarios where we want to check two different views of the same page.
    Enter Username  ${account}
    Enter Password  ${account}
    Click Element  ${login_button}


Enter Username
    [Documentation]  Enters the username (email) corresponding to the spcified account in the login overlay form
    [Arguments]  ${account}
    Log  Enter Username
    Input Text  ${email_field}  @{TEST}[0]


Enter Password
    [Documentation]  Enters the password corresponding to the specified account in the login overlay form
    [Arguments]  ${account}
    Log  Enter Password
    Input Text  ${password_field}  @{TEST}[1]