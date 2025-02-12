*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${NEW_BRICK_NAME}   Test

*** Keywords ***
Create Brick
    Wait Until Element Is Visible    xpath=//a[@title="New"]    10s
    Click Element    xpath=//a[@title="New"]
    Wait Until Page Contains    New Account    10s
    Click Element   xpath=(//span[contains(@class,'slds-form-element__label')])[2]
    Click Button    xpath=//button[contains(.,'Next')]
    Wait Until Page Contains    New Account: Brick  15s

    # Fill the Brick Account detail
    Input Text    xpath=//input[@name='Name']    ${NEW_BRICK_NAME}
    Click Button    xpath=//button[@aria-label='Status']
    Click Element    xpath=//lightning-base-combobox-item[@role='option' and @data-value='Active']
    Click Button    xpath=//button[@aria-label='Channel']
    Click Element    xpath=//lightning-base-combobox-item[@role='option' and @data-value='Brick']
    Click Button    xpath=//button[@aria-label='Country']
    Click Element    xpath=//lightning-base-combobox-item[@role='option' and @data-value='United States']
    Click Button    xpath=//button[@name='SaveEdit']