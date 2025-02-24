*** Settings ***
Library     SeleniumLibrary
Resource    Contact Business Unit.resource

*** Variables ***
${CONTACT_TCL_NEW_BUTTON}  xpath=(//button[contains(.,'New')])[4]
${NEW_CONTACT_TCL_PAGE}  New Target Customer List
${SEARCH_CONTACT_TCL_DROWNDOWN_XPATH}  xpath=(//input[contains(@id,'combobox-input-')])[2]
${SEARCH_CONTACT_TCL_TEXT}  US-ENT & Surgery
${SEARCH_CONTACT_TCL_DROWNDOWN_OPTIONS_XPATH}     xpath=//lightning-base-combobox-item[@class='slds-media slds-listbox__option slds-media_center slds-listbox__option_entity' and @role='option']
${SEARCH_CONTACT_TCL_OPTION_XPATH}      xpath=(//lightning-base-combobox-item[@class='slds-media slds-listbox__option slds-media_center slds-listbox__option_entity' and @role='option'])[2]
${TCL_SEARCH_USER_DROPDOWN_XPATH}    xpath=//input[@placeholder='Search People...']
${TCL_SEARCH_USER_TEXT}     Asad
${TCL_SEARCH_USER_DROPDOWN_OPTIONS_XPATH}   xpath=//lightning-base-combobox-item[@class='slds-media slds-listbox__option slds-media_center slds-listbox__option_entity' and @role='option']
${TCL_SEARCH_USER_OPTION_XPATH}     xpath=(//lightning-base-combobox-item[@class='slds-media slds-listbox__option slds-media_center slds-listbox__option_entity' and @role='option'])[2]
${ACTIVE_CHECKBOX_XPATH}    xpath=//input[@name='Active__c']
${TCL_APPROVAL_STATUS_DROPDOWN_XPATH}   xpath=//button[@aria-label='Approval Status']
${TCL_APPROVAL_STATUS_OPTION_XPATH}   xpath=//lightning-base-combobox-item[@role='option' and @data-value='Activated']
${TCL_CALCULATE_FREQUENCY_CHECKBOX_XPATH}   xpath=//input[@name='Calculate_Frequency_From_Cycle__c']
${TCL_MARKETING_CYCLE_DROPDOWN_XPATH}   xpath=//input[contains(@placeholder,'Search Marketing Cycle...')]
${TCL_MARKETING_CYCLE_TEXT}     US-M
${TCL_MARKETING_CYCLE_OPTION_XPATH}      xpath=//lightning-base-combobox-item[contains(.,'US-M01-2025')]


*** Keywords ***
Create Contact TCL
    Sleep    10s
    Execute JavaScript    window.scrollBy(0, 600);
    Sleep    10s
    Click Element    ${CONTACT_TCL_NEW_BUTTON}
    Wait Until Page Contains    ${NEW_CONTACT_TCL_PAGE}     10s
    Click Button    ${NEXT_BUTTON_XPATH}
    Sleep    10s
    Input Text     ${TCL_SEARCH_USER_DROPDOWN_XPATH}   ${TCL_SEARCH_USER_TEXT}
    Wait Until Element Is Visible    ${TCL_SEARCH_USER_DROPDOWN_OPTIONS_XPATH}  10s
    Click Element    ${TCL_SEARCH_USER_OPTION_XPATH}
    Click Button    ${CONTACT_PRIORITY_DROPDOWN_XPATH}
    Click Element   ${CONTACT_PRIORITY_OPTION_XPATH}
    Select Checkbox    ${ACTIVE_CHECKBOX_XPATH} 
    Click Button    ${TCL_APPROVAL_STATUS_DROPDOWN_XPATH}
    Click Element    ${TCL_APPROVAL_STATUS_OPTION_XPATH}
    Select Checkbox    ${TCL_CALCULATE_FREQUENCY_CHECKBOX_XPATH}
    Input Text     ${TCL_MARKETING_CYCLE_DROPDOWN_XPATH}   ${TCL_MARKETING_CYCLE_TEXT}
    Wait Until Element Is Visible    ${TCL_MARKETING_CYCLE_OPTION_XPATH}   10s
    Click Element    ${TCL_MARKETING_CYCLE_OPTION_XPATH}
    Scroll Element Into View    ${COUNTRY_DROPDOWN_XPATH}
    Sleep    10s
    Execute Javascript  arguments[0].scrollby(0, 500);
    Sleep    20s
    Click Button    ${COUNTRY_DROPDOWN_XPATH}
    Click Element   ${COUNTRY_OPTION_XPATH}
    Click Button    ${SAVE_BUTTON_XPATH}
    Sleep    20s