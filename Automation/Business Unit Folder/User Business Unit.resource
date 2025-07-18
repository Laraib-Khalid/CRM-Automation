*** Settings ***
Library     SeleniumLibrary
Resource    Business Unit.resource
Resource    ../Contact Folder/TCL.resource

*** Variables ***
# Create Business Unit XPath
${USER_BU_NEW_BUTTON_XPATH}  xpath=//li[@data-target-selection-name='sfdc:StandardButton.User_Business_Unit__c.New']//button[contains(.,'New')]
${SEARCH_USER_DROPDOWN_OPTIONS_XPATH}   xpath=//lightning-base-combobox-item[@class='slds-media slds-listbox__option slds-media_center slds-listbox__option_entity' and @role='option']
${SEARCH_USER_OPTION_XPATH}     xpath=(//lightning-base-combobox-item[@class='slds-media slds-listbox__option slds-media_center slds-listbox__option_entity' and @role='option'])[2]
${USER_BU_ACTIVE_CHECKBOX_XPATH}    xpath=//input[@name='Active__c']
${USER_BU_XPATH_OPTION}    xpath=//lightning-base-combobox-formatted-text[@title='US Test Business Unit']
${USER_BU_START_DATE_OPTION}    Mar 1, 2025
${USER_BU_END_DATE_OPTION}    May 31, 2025
${SEARCH_BUSINESS_UNIT_DROWNDOWN_XPATH}  xpath=(//input[contains(@id,'combobox-input-')])[2]
${SEARCH_BUSINESS_UNIT_DROWNDOWN_OPTIONS_XPATH}     xpath=//lightning-base-combobox-item[@class='slds-media slds-listbox__option slds-media_center slds-listbox__option_entity' and @role='option']
${SEARCH_BUSINESS_UNIT_OPTION_XPATH}      xpath=(//lightning-base-combobox-item[@class='slds-media slds-listbox__option slds-media_center slds-listbox__option_entity' and @role='option'])[2]
${CREATE_BUTTON_XPATH}    xpath=//button[contains(.,'Create')]
${USER_BU_EDIT_ACTION_BUTTON_XPATH}  xpath=//button[@class='slds-button slds-button_icon-border slds-button_icon-x-small']
${EDIT_ACTION_USER_BU_XPATH}    xpath=//a[@title='Edit']
${EDIT_USER_BU_ACTIVE_CHECKBOX_XPATH}    xpath=(//span[@class='slds-checkbox slds-checkbox_standalone']//input[@name='Active__c'])[2]
${USER_BU_END_DATE_XPATH}     xpath=(//input[@name='End_Date__c'])[2]
${USER_BU_DELETE_ACTION_BUTTON_XPATH}  xpath=//a[@title='Show 2 more actions']
${DELETE_ACTION_USER_BU_XPATH}    xpath=//a[@title='Delete']

*** Keywords ***
Create User Business Unit
    Sleep    10s
    Execute JavaScript    window.scrollBy(0, 400);
    Wait Until Element Is Visible    ${USER_BU_NEW_BUTTON_XPATH}    10s
    Click Element    ${USER_BU_NEW_BUTTON_XPATH}
    Sleep    5s
    Input Text     ${SEARCH_USER_DROPDOWN_XPATH}   ${SEARCH_USER_TEXT}
    Wait Until Element Is Visible    ${SEARCH_USER_DROPDOWN_OPTIONS_XPATH}  10s
    Click Element    ${SEARCH_USER_OPTION_XPATH}
    Click Button    ${COUNTRY_DROPDOWN_XPATH}
    Click Element   ${COUNTRY_OPTION_XPATH}
    Select Checkbox    ${USER_BU_ACTIVE_CHECKBOX_XPATH}
    Input Text      ${SEARCH_BUSINESS_UNIT_DROWNDOWN_XPATH}   ${BU_NAME}
    Wait Until Element Is Visible  ${USER_BU_XPATH_OPTION}    10s
    Click Element   ${USER_BU_XPATH_OPTION}
    Input Text    ${START_DATE_XPATH}    ${USER_BU_START_DATE_OPTION}
#    Input Text    ${END_DATE_XPATH}      ${USER_BU_END_DATE_OPTION}
    Click Button    ${CREATE_BUTTON_XPATH}


Edit User Business Unit
    Sleep    10s
    Search and Create Business Unit
    Sleep    10s
    Execute JavaScript    window.scrollBy(0, 400);
    Wait Until Element Is Visible   ${USER_BU_EDIT_ACTION_BUTTON_XPATH}      10s
    Click Button    ${USER_BU_EDIT_ACTION_BUTTON_XPATH}
    Wait Until Element Is Visible    ${EDIT_ACTION_USER_BU_XPATH}    10s
    Click Element    ${EDIT_ACTION_USER_BU_XPATH}
    Wait Until Page Contains    ${EDIT_PAGE_HEADING}   10s
    Sleep    5s
    Unselect Checkbox    ${EDIT_USER_BU_ACTIVE_CHECKBOX_XPATH}
    Input Text    ${USER_BU_END_DATE_XPATH}      ${USER_BU_END_DATE_OPTION}
    Click Button    ${SAVE_BUTTON_XPATH}

Delete User Business Unit
    Sleep    10s
    Wait Until Element Is Visible     ${USER_BU_DELETE_ACTION_BUTTON_XPATH}   10s
    Click Element     ${USER_BU_DELETE_ACTION_BUTTON_XPATH}
    Wait Until Element Is Visible    ${DELETE_ACTION_USER_BU_XPATH}   10s
    Click Element    ${DELETE_ACTION_USER_BU_XPATH}
    Sleep    5s
    Wait Until Element Is Visible    ${DELETE_CONFIRM_BUTTON_XPATH}  10s
    Click Element    ${DELETE_CONFIRM_BUTTON_XPATH}
