*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/logintest_keywords.resource
Test Setup    Open Browser    browser=chrome

*** Variables ***
${URL}    https://www.saucedemo.com/
${BROWSER}    chrome
${USERNAME}    standard_user
${PASSWORD}    secret_sauce                

*** Test Cases ***
Successful - Login
    I navigate to the Login Page    ${URL}
    I input correct credentials    ${USERNAME}    ${PASSWORD} 
    I click on the login button
    I am able view the home page

Insuccessful - No Credentials
    I navigate to the Login Page    ${URL}
    I input no credentials
    I click on the login button
    I am able to see expected error message    Username is required
Insuccessful - No Username
    I navigate to the Login Page    ${URL}
    I input no username    ${PASSWORD}
    I click on the login button
    I am able to see expected error message   Username is required

Insuccessful - No Password
    I navigate to the Login Page    ${URL}
    I input no password    ${USERNAME}
    I click on the login button
    I am able to see expected error message   Password is required   

Insuccessful - Wrong credentials
    I navigate to the Login Page    ${URL} 
    I input wrong credentials    testing_user    testqa
    I click on the login button
    I am able to see expected error message   Username and password do not match any user in this service    