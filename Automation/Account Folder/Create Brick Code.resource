*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${NEW_BUTTON_XPATH}     xpath=//a[@title="New"]
${BRICK_RADIO_OPTION_XAPTH}     xpath=(//span[contains(@class,'slds-form-element__label')])[2]
${NEXT_BUTTON_XPATH}    xpath=//button[contains(.,'Next')]
${NEW_BRICK_NAME_XPATH}     xpath=//input[@name='Name']
${NEW_BRICK_NAME}   Test
${BRICK_STATUS_DROPDOWN_XPATH}    xpath=//button[@aria-label='Status']
${BRICK_STATUS_OPTION_XPATH}    xpath=//lightning-base-combobox-item[@role='option' and @data-value='Active']
${BRICK_CHANNEL_DROPDOWN_XPATH}     xpath=//button[@aria-label='Channel']
${BRICK_CHANNEL_OPTION_XPATH}     xpath=//lightning-base-combobox-item[@role='option' and @data-value='Brick']
${BRICK_COUNTRY_DROPDOWN_XPATH}     xpath=//button[@aria-label='Country']
${BRICK_COUNTRY_OPTION_XPATH}     xpath=//lightning-base-combobox-item[@role='option' and @data-value='United States']
${SAVE_BUTTON_XPATH}    xpath=//button[@name='SaveEdit']

*** Keywords ***
Create Brick
    Wait Until Element Is Visible   ${NEW_BUTTON_XPATH}     10s
    Click Element    ${NEW_BUTTON_XPATH}
    Wait Until Page Contains    New Account    10s
    Click Element   ${BRICK_RADIO_OPTION_XAPTH}
    Click Button    ${NEXT_BUTTON_XPATH}
    Wait Until Page Contains    New Account: Brick  15s

    # Fill the Brick Account detail
    Input Text    ${NEW_BRICK_NAME_XPATH}    ${NEW_BRICK_NAME}
    Click Button    ${BRICK_STATUS_DROPDOWN_XPATH}
    Click Element    ${BRICK_STATUS_OPTION_XPATH}
    Click Button    ${BRICK_CHANNEL_DROPDOWN_XPATH}
    Click Element    ${BRICK_CHANNEL_OPTION_XPATH}
    Click Button    ${BRICK_COUNTRY_DROPDOWN_XPATH}
    Click Element   ${BRICK_COUNTRY_OPTION_XPATH}
    Click Button    ${SAVE_BUTTON_XPATH}