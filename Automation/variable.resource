*** Settings ***
Library     SeleniumLibrary

*** Variables ***
#${CHROME_OPTIONS}    --disable-notifications
#${CHROME_PREFERENCES}    {"profile.default_content_setting_values.notifications": 1}

*** Keywords ***
Login
#    # Set Chrome preferences to allow notifications automatically
#    ${options}=    Create Dictionary    prefs=${CHROME_PREFERENCES}
#     ${options}=    Create List    ${CHROME_OPTIONS}
    Open Browser        https://raptorsconsulting--qasmartcrm.sandbox.lightning.force.com/
    Maximize Browser Window
    Input Text    //*[@id="username"]    admin.qasmartcrm@bssuniversal.com
    Input Password    //*[@id="password"]    Bss@2025
    Click Button    //*[@id="Login"]
    
Create Brick Account
    Wait Until Element Is Visible    xpath=//a[@title='Accounts']    10s
    Click Element    xpath=//a[@title="Accounts"]
    Wait Until Element Is Visible    xpath=//a[@title="New"]    10s
    Click Element    xpath=//a[@title="New"]
    Wait Until Page Contains    New Account  10s
    Click Element   xpath=(//span[contains(@class,'slds-form-element__label')])[2]
    Click Button    xpath=//button[contains(.,'Next')]
    Wait Until Page Contains    New Account: Brick  15s

   # Fill the Brick Account detail
   Input Text    xpath=//input[@name='Name']    Test
   Click Button    xpath=//button[@aria-label='Status']
   Click Element    xpath=//lightning-base-combobox-item[@role='option' and @data-value='Active']
   Click Button    xpath=//button[@aria-label='Channel']
   Click Element    xpath=//lightning-base-combobox-item[@role='option' and @data-value='Brick']
   Click Button    xpath=//button[@aria-label='Country']
   Click Element    xpath=//lightning-base-combobox-item[@role='option' and @data-value='United States']
   Click Button    xpath=//button[@name='SaveEdit']
#   Wait Until Keyword Succeeds  10s  1s  Alert Should Be Present

Edit Brick Account
    Wait Until Element Is Visible    xpath=//button[@name='Edit']   10s
    Click Element    xpath=//button[@name='Edit']
    Wait Until Page Contains    Edit Brick
    Sleep    10s
    Clear Element Text  xpath=//input[@name='Name']  # Clears the existing text
    Input Text  xpath=//input[@name='Name']  Test Brick
#    Click Element    xpath://textarea[@id='input-764']
    Input Text       xpath=//textarea[@class='slds-textarea']   This is the test Brick description.
    Click Button    xpath=//button[@name='SaveEdit']
#    Wait Until Keyword Succeeds  10s  1s  Alert Should Be Present

Delete Brick Account
    Wait Until Element Is Visible    xpath=//button[@name='Delete']     20s
    Sleep    10s
    Click Element    xpath=//button[@class='slds-button slds-button_neutral' and @name='Delete']
    Wait Until Element Is Visible    xpath=//button[@class='slds-button slds-button_neutral uiButton--default uiButton--brand uiButton forceActionButton' and @title='Delete']  10s
    Click Element    xpath=//button[@class='slds-button slds-button_neutral uiButton--default uiButton--brand uiButton forceActionButton' and @title='Delete']



Create Hospital Account
    Sleep    10s
    Wait Until Element Is Visible    xpath=//a[@title='Accounts']    10s
    Click Element    xpath=//a[@title="Accounts"]
     Sleep    10s
    Wait Until Element Is Visible    xpath=//a[@title="New"]    10s
    Click Element    xpath=//a[@title="New"]
     Sleep    10s
    Wait Until Page Contains    New Account  10s
     Sleep    10s
#    Click Element   xpath:(//span[contains(@class,'slds-form-element__label')])[2]
    Click Button    xpath=//button[contains(.,'Next')]
     Sleep    10s
    Wait Until Page Contains    New Account: Clinic/Hospital  15s

   # Fill the Brick Account detail
   Input Text    xpath=//input[@name='Name']    Test
   Click Button    xpath=//button[@aria-label='Status']
   Click Element    xpath=//lightning-base-combobox-item[@role='option' and @data-value='Active']
   Click Button    xpath=//button[@aria-label='Channel']
   Click Element    xpath=//lightning-base-combobox-item[@role='option' and @data-value='Hospital']
   Click Button    xpath=//button[@aria-label='Country']
   Click Element    xpath=//lightning-base-combobox-item[@role='option' and @data-value='United States']
#   Press Key  xpath=//body  DOWN
   Scroll Element Into View    xpath=(//input[contains(@role,'combobox')])[2]
   Input Text    xpath=(//input[contains(@role,'combobox')])[2]   Test
   Wait Until Element Is Visible    xpath=//lightning-base-combobox-item[@class='slds-media slds-listbox__option slds-media_center slds-listbox__option_entity' and @role='option']     10s
   Click Element    xpath=(//lightning-base-combobox-item[@class='slds-media slds-listbox__option slds-media_center slds-listbox__option_entity' and @role='option'])[2]
   Click Button    xpath=//button[@name='SaveEdit']

Edit Hospital Account
    Wait Until Element Is Visible    xpath=//button[@name='Edit']   10s
    Click Element    xpath=//button[@name='Edit']
    Wait Until Page Contains    Edit
    Sleep    10s
    Clear Element Text  xpath=//input[@name='Name']  # Clears the existing text
    Input Text  xpath=//input[@name='Name']  Test Account
    Click Button    xpath=//button[@name='SaveEdit']
#    Wait Until Keyword Succeeds  10s  1s  Alert Should Be Present

