*** Settings ***
Library    SeleniumLibrary
Variables    ../variables/variables.py

*** Keywords ***

I navigate to the login page
    Go To    ${URL_DATA["baseUrl"]}

I log in successfully
    Input Text    id=user-name    ${LOGIN_DATA["correctData"]["username"]}    
    Input Password    id=password    ${LOGIN_DATA["correctData"]["password"]}

I click the login button
     Click Button    login-button

I am able view the home page
    ${location}    Get Location
    ${full_url}    Catenate    SEPARATOR=    ${URL_DATA["baseUrl"]}    ${URL_DATA["inventoryUrl"]}
    Should Be Equal    ${location}    ${full_url}

I add product one to cart
    Click Element    class=inventory_item_name
    Click Element    add-to-cart
    Click Element    class=shopping_cart_link
    Wait Until Element Contains    class=title    Your Cart 
    ${location}    Get Location
    ${full_url}    Catenate    SEPARATOR=    ${URL_DATA["baseUrl"]}    ${URL_DATA["cartUrl"]}
    Should Be Equal    ${location}    ${full_url}

continue shopping
    Click Element    continue-shopping  

I add product two to cart
    Click Element    name=add-to-cart-sauce-labs-fleece-jacket 
    Click Element    class=shopping_cart_link

I am redirected to checkout page
    Click Button    checkout

I fill in the personal data
    Wait Until Element Contains    class=header_secondary_container    Checkout: Your Information
    Input Text    first-name    Adryano    
    Input Text    last-name    Junior
    Input Text    postal-code    01521020
    Click Button    continue  
    Wait Until Element Contains    class=title    Checkout: Overview
    Wait Until Element Contains    class=cart_desc_label    Description

click on the finish button
    Click Button    finish
    Wait Until Element Contains    class=title    Checkout: Complete!
    Wait Until Element Contains    class=complete-header    Thank you for your order!
    Wait Until Element Contains    class=complete-text    Your order has been dispatched, and will arrive just as fast as the pony can get there!
