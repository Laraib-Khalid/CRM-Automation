*** Settings ***
Library     SeleniumLibrary

*** Variables ***
# Account details
${ACCOUNT_BRICK_NAME}       Test Brick

# XPath values
${NEW_BUTTON_XPATH}         xpath=//a[@title="New"]
${NEXT_BUTTON_XPATH}    xpath=//button[contains(.,'Next')]
${NEW_HOSPITAL_ACCOUNT_NAME_XPATH}    xpath=//input[@name='Name']
${NEW_HOSPITAL_ACCOUNT_NAME}   Test
${NEW_HOSPITAL_ACCOUNT_STATUS_DROPDOWN_XPATH}      xpath=//button[@aria-label='Status']
${NEW_HOSPITAL_ACCOUNT_STATUS_OPTION_XPATH}      xpath=//lightning-base-combobox-item[@role='option' and @data-value='Active']
${NEW_HOSPITAL_ACCOUNT_CHANNEL_DROPDOWN_XPATH}  xpath=//button[@aria-label='Channel']
${NEW_HOSPITAL_ACCOUNT_CHANNEL_OPTION_XPATH}  xpath=//lightning-base-combobox-item[@role='option' and @data-value='Hospital']
${NEW_HOSPITAL_ACCOUNT_COUNTRY_DROPDOWN_XPATH}     xpath=//button[@aria-label='Country']
${NEW_HOSPITAL_ACCOUNT_COUNTRY_OPTION_XPATH}     xpath=//lightning-base-combobox-item[@role='option' and @data-value='United States']
${ACCOUNT_BRICK_DROPDOWN_XPATH}  xpath=(//input[contains(@role,'combobox')])[2]
${ACCOUNT_BRICK_DROPDOWN_OPTIONS_XPATH}     xpath=//lightning-base-combobox-item[@class='slds-media slds-listbox__option slds-media_center slds-listbox__option_entity' and @role='option']
${ACCOUNT_BRICK_OPTION_XPATH}    xpath=(//lightning-base-combobox-item[@class='slds-media slds-listbox__option slds-media_center slds-listbox__option_entity' and @role='option'])[2]
${SAVE_BUTTON_XPATH}        xpath=//button[@name='SaveEdit']

*** Keywords ***
Create Hospital
    # Navigate and create a new hospital account
    Wait Until Element Is Visible    ${NEW_BUTTON_XPATH}    10s
    Click Element    ${NEW_BUTTON_XPATH}
    Wait Until Page Contains    New Account    10s
    Click Button    ${NEXT_BUTTON_XPATH}
    Wait Until Page Contains    New Account: Clinic/Hospital  15s

    # Fill the Brick Account details
    Input Text        ${NEW_HOSPITAL_ACCOUNT_NAME_XPATH}    ${NEW_HOSPITAL_ACCOUNT_NAME}
    Click Button    ${NEW_HOSPITAL_ACCOUNT_STATUS_DROPDOWN_XPATH}
    Click Element    ${NEW_HOSPITAL_ACCOUNT_STATUS_OPTION_XPATH}
    Click Button    ${NEW_HOSPITAL_ACCOUNT_CHANNEL_DROPDOWN_XPATH}
    Click Element    ${NEW_HOSPITAL_ACCOUNT_CHANNEL_OPTION_XPATH}
    Click Button    ${NEW_HOSPITAL_ACCOUNT_COUNTRY_DROPDOWN_XPATH}
    Click Element    ${NEW_HOSPITAL_ACCOUNT_COUNTRY_OPTION_XPATH}
    Scroll Element Into View    ${ACCOUNT_BRICK_DROPDOWN_XPATH}
    Input Text    ${ACCOUNT_BRICK_DROPDOWN_XPATH}   ${ACCOUNT_BRICK_NAME}
    Wait Until Element Is Visible    ${ACCOUNT_BRICK_DROPDOWN_OPTIONS_XPATH}    10s
    Click Element    ${ACCOUNT_BRICK_OPTION_XPATH}
    Click Button    ${SAVE_BUTTON_XPATH}
