*** Settings ***
Library    SeleniumLibrary   
Resource    ../resources/login_keywords.resource   
Test Setup    Open Browser    browser=chrome

*** Variables ***
${URL}    https://www.saucedemo.com/
${BROWSER}    chrome
${USERNAME}    standard_user
${PASSWORD}    secret_sauce         

*** Test Cases ***

Successful - Login
    I navigate to the login page    ${URL}
    Wait Until Element Is Visible    id=user-name
    Input Text    id=user-name    ${USERNAME} 
    Input Password    id=password    ${PASSWORD}
    Click Button    id=login-button
    ${location}    Get Location
    Should Be Equal    ${location}    https://www.saucedemo.com/inventory.html

Insuccessful - No Credentials
    Open Browser    url=${URL}
    Wait Until Element Is Visible    id=user-name
    Click Button    id=login-button
    Wait Until Element Contains    class=error-message-container    Username is required

Insuccessful - No Username
    Open Browser    url=${URL}    browser=${BROWSER}
    Wait Until Element Is Visible    id=user-name
    Input Password    id=password    ${PASSWORD}
    Click Button    id=login-button
    Wait Until Element Contains    class=error-message-container    Username is required

Insuccessful - No Password
    Open Browser    url=${URL}    browser=${BROWSER}
    Wait Until Element Is Visible    id=user-name
    Input Text    id=user-name    ${USERNAME} 
    Click Button    id=login-button
    Wait Until Element Contains    class=error-message-container    Password is required

Insuccessful - Wrong Credentials 
    Open Browser    url=${URL}    browser=${BROWSER}
    Wait Until Element Is Visible    id=user-name
    Input Text    id=user-name    testing_user
    Input Password    id=password    testqa
    Click Button    id=login-button
    Wait Until Element Contains    class=error-message-container    Username and password do not match any user in this service


    