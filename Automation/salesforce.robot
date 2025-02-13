*** Settings ***
Library     SeleniumLibrary
Resource    Account Folder/Account.resource
Suite Setup    Open Different Browser
Suite Teardown    Close Browser

*** Keywords ***
Open Different Browser
    Open Browser    https://raptorsconsulting--qasmartcrm.sandbox.lightning.force.com/
    Maximize Browser Window

#
#    Open Browser    https://raptorsconsulting--qasmartcrm.sandbox.lightning.force.com/    Edge
#    Maximize Browser Window
#
#    Open Browser    https://raptorsconsulting--qasmartcrm.sandbox.lightning.force.com/    Firefox
#    Maximize Browser Window


*** Test Cases ***

Testcase_1:
    Login

Testcase_2:
    Search and Create Brick Account

Testcase_3:
    Edit Brick Account


Testcase_4:
    Delete Brick Account

Testcase_5:
    Search and Create Hospital Account

Testcase_6:
    Edit Hospital Account

Testcase_7:
    Delete Hospital Account