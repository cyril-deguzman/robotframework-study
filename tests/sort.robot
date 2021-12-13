*** Settings ***
Documentation    A test suite testing if the products sort in specified orders.
...
...              This test follows the example using keywords from
...              the SeleniumLibrary
Resource         resources.robot

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Input Username    ${VALID USER}
    Input Pass    ${VALID PASSWORD}
    Submit Credentials
    Product Page Should Be Open
    [Teardown]    Close Browser

Locked Out Login
    Open Browser To Login Page
    Input Username    ${LOCKED OUT USER}
    Input Pass    ${VALID PASSWORD}
    Submit Credentials
    Element Text Should Be    xpath://*[@id="login_button_container"]/div/form/div[3]/h3    Epic sadface: Sorry, this user has been locked out.
    [Teardown]    Close Browser

Wrong Password
    Open Browser To Login Page
    Input Username    ${LOCKED OUT USER}
    Input Pass    ${INVALID PASSWORD}
    Submit Credentials
    Element Text Should Be    xpath://*[@id="login_button_container"]/div/form/div[3]/h3    Epic sadface: Username and password do not match any user in this service
    [Teardown]    Close Browser

Problem User Login
    Open Browser To Login Page
    Input Username    ${PROBLEM USER}
    Input Pass    ${VALID PASSWORD}
    Submit Credentials
    Product Page Should Be Open
    [Teardown]    Close Browser