*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Add Procucts to Cart - Success
    Open Browser    url=https://www.saucedemo.com/   browser=chrome
    Input Text    id=user-name    standard_user
    Input Password    id=password    secret_sauce
    Click Button    login-button
    ${location}    Get Location
    Should Be Equal    ${location}    https://www.saucedemo.com/inventory.html
    Click Element    class=inventory_item_name
    Click Element    add-to-cart
    Click Element    class=shopping_cart_link
    Wait Until Element Contains    class=title    Your Cart 
    Click Element    continue-shopping  
    Click Element    name=add-to-cart-sauce-labs-fleece-jacket
    Sleep    3s  
    Click Element    class=shopping_cart_link
    Click Button    checkout
    Input Text    first-name    Adryano    
    Input Text    last-name    Junior
    Input Text    postal-code    01521020
    Click Button    continue  
    Wait Until Element Contains    class=title    Checkout: Overview
    Wait Until Element Contains    class=cart_desc_label    Description
    Click Button    finish
    Wait Until Element Contains    class=title    Checkout: Complete!
    Wait Until Element Contains    class=complete-header    Thank you for your order!
    Wait Until Element Contains    class=complete-text    Your order has been dispatched, and will arrive just as fast as the pony can get there!
    Click Button    back-to-products
    