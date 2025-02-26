*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/cart_keywords.robot
Suite Setup    Open Browser    browser=chrome


*** Test Cases 
Add Procucts to Cart - Success
    I navigate to the login page    
    I log in successfully    
    I click the login button
    I am able view the home page
    I add product one to cart

    continue shopping
    I add product two to cart
    I am redirected to checkout page
    I fill in the personal data
    click on the finish button
    
 
    