*** Settings ***
Library    SeleniumLibrary


*** Keywords ***
I navigate to the Login Page
    [Arguments]    ${URL}
    Go To    ${URL}

I input correct credentials
    [Arguments]    ${USERNAME}    ${PASSWORD}
    Wait Until Element Is Visible    id=user-name
    Input Text    id=user-name    ${USERNAME}    
    Input Password    id=password    ${PASSWORD}   

I click on the login button
    Click Button    id=login-button 

I am able view the home page
    ${location}    Get Location
    Should Be Equal    ${location}    https://www.saucedemo.com/inventory.html

I input no credentials
    Wait Until Element Is Visible    id=user-name

I am able to see expected error message
    [Arguments]    ${WRONG_MESSAGE}
     Wait Until Element Contains    class=error-message-container   ${WRONG_MESSAGE}

I input no username
    [Arguments]    ${PASSWORD}
    Wait Until Element Is Visible    id=user-name
    Input Password    id=password    ${PASSWORD}

I input no password
    [Arguments]    ${USERNAME}
    Wait Until Element Is Visible    id=user-name  
    Input Text    id=user-name    ${USERNAME}

I input wrong credentials
    [Arguments]    ${WRONG_USERNAME}    ${WRONG_PASSWORD}
    Wait Until Element Is Visible    id=user-name
    Input Text    id=user-name   ${WRONG_USERNAME}
    Input Password    id=password    ${WRONG_PASSWORD}
    
