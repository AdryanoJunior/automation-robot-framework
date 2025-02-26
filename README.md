# My Robot Framework Automation

This project uses the Robot Framework to automate the testing of a successful login feature in the application, where the user must be redirected to the system's product page, and an invalid login feature, where error messages are guaranteed to appear informing the customer of the reason for the failure. In addition to a complete E2E scenario, in which the user can add and remove products from the cart, after ensuring that everything is correct with their product, the user clicks the button, in which they are redirected to the checkout, and fills in their personal information on the platform, finally, the user receives a confirmation stating the total value of the order, quantity of each product, and the chosen payment method, after clicking the final button, the user receives a message informing that the order was placed successfully.
Robot Framework is a Python-based end-to-end testing framework that allows developers to write tests and run them in a real browser, simulating the entire flow of a real user.

## Installation
```bash
pip install robotframework
pip install --upgrade robotframework-seleniumlibrary
pip install webdriver-manager
```
> **NOTE:**
>
> it is necessary to have **node** installed
>
> ## Running
```powershell
# You open the Robot Framework 
robot login_steps.robot

```
