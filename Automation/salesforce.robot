*** Settings ***
Library     SeleniumLibrary
Resource    Login Folder/Login.resource
Resource    Account Folder/Brick Account.resource
Resource    Account Folder/Hospital Account.resource
Resource    Contact Folder/Medical Contact.resource
Resource    Contact Folder/Contact Business Unit.resource
Resource    Contact Folder/TCL.resource
Suite Setup    Open Different Browser
Suite Teardown    Close Browser

*** Keywords ***
Open Different Browser
    Open Browser    https://raptorsconsulting--qasmartcrm.sandbox.lightning.force.com/  Chrome
    Maximize Browser Window

#
#    Open Browser    https://raptorsconsulting--qasmartcrm.sandbox.lightning.force.com/    Edge
#    Maximize Browser Window
#
#    Open Browser    https://raptorsconsulting--qasmartcrm.sandbox.lightning.force.com/    Firefox
#    Maximize Browser Window


*** Test Cases ***

Testcase_1: Verify Login Functionality
    Login

#Testcase_2: Search and Create Brick Account
#    Search and Create Brick Account
#
#Testcase_3: Edit Brick Functionality
#    Edit Brick Account

###Testcase_4: Delete Brick
###    Delete Brick Account
###
#Testcase_5: Search and Create Hospital Account
#    Search and Create Hospital Account
#
#Testcase_6: Edit Hospital Account
#       Edit Hospital Account

##Testcase_7: Delete Hospital Account
##   Delete Hospital Account

Testcase_8: Search and Create Medical Contact
    Search and Create Medical Contact

#Testcase_9: Edit Medical Contact
#    Edit Medical Contact

#Testcase_10: Delete Medical Contact
#    Delete Medical Contact

Testcase_11: Click on Related Tab
    Click on Related Tab

Testcase_12: Create Contact Business Unit
    Create Contact Business Unit

Testcase_13: Edit Contact Business Unit
    Edit Contact Business Unit

Testcase_14: Delete Contact Business Unit
    Delete Contact Business Unit

Testcase_15: Create Contact TCL
    Create Contact TCL

Testcase_15: Edit Contact TCL
    Edit Contact TCL

Testcase_15: Delete Contact TCL
    Delete Contact TCL