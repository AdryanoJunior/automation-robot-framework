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
    I input correct credentials    ${USERNAME}    ${PASSWORD}
    I click on the login button
    I am able view the home page
    

Unsuccessful - No Credentials
    I navigate to the login page    ${URL}
    I input no credentials
    I click on the login button
    I am able to see the expected error message       Username is required 
    
Unsuccessful - No Username
    I navigate to the login page    ${URL}
    I input only the password    ${PASSWORD}
    I click on the login button
    I am able to see the expected error message       Username is required 

Unsuccessful - No Password
    I navigate to the login page    ${URL}
    I input only the username    ${USERNAME}
    I click on the login button
    I am able to see the expected error message      Password is required

Unsuccessful - Wrong Credentials
    I navigate to the login page    ${URL}
    I input wrong credentials    testing_user    testqa    
    I click on the login button
    I am able to see the expected error message     Username and password do not match any user in this service  




