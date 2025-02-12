*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${NEW_ACCOUNT_NAME}   Test
${ACCOUNT_BRICK_NAME}      Test Brick

*** Keywords ***
Create Hospital
    Wait Until Element Is Visible    xpath=//a[@title="New"]    10s
    Click Element    xpath=//a[@title="New"]
    Wait Until Page Contains    New Account    10s
    Click Button    xpath=//button[contains(.,'Next')]
    Wait Until Page Contains    New Account: Clinic/Hospital  15s

   # Fill the Brick Account detail
   Input Text    xpath=//input[@name='Name']    ${NEW_ACCOUNT_NAME}
   Click Button    xpath=//button[@aria-label='Status']
   Click Element    xpath=//lightning-base-combobox-item[@role='option' and @data-value='Active']
   Click Button    xpath=//button[@aria-label='Channel']
   Click Element    xpath=//lightning-base-combobox-item[@role='option' and @data-value='Hospital']
   Click Button    xpath=//button[@aria-label='Country']
   Click Element    xpath=//lightning-base-combobox-item[@role='option' and @data-value='United States']
#   Press Key  xpath=//body  DOWN
   Scroll Element Into View    xpath=(//input[contains(@role,'combobox')])[2]
   Input Text    xpath=(//input[contains(@role,'combobox')])[2]   ${ACCOUNT_BRICK_NAME}
   Wait Until Element Is Visible    xpath=//lightning-base-combobox-item[@class='slds-media slds-listbox__option slds-media_center slds-listbox__option_entity' and @role='option']     10s
   Click Element    xpath=(//lightning-base-combobox-item[@class='slds-media slds-listbox__option slds-media_center slds-listbox__option_entity' and @role='option'])[2]
   Click Button    xpath=//button[@name='SaveEdit']