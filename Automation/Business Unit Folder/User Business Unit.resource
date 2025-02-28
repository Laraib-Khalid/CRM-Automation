*** Settings ***
Library     SeleniumLibrary
Resource    Business Unit.resource
Resource    ../Contact Folder/TCL.resource

*** Variables ***
# Create Business Unit XPath
${USER_BU_NEW_BUTTON_XPATH}  xpath=//li[@data-target-selection-name='sfdc:StandardButton.User_Business_Unit__c.New']//button[contains(.,'New')]
${USER_BU_ACTIVE_CHECKBOX_XPATH}    xpath=//input[@name='Active__c']
${USER_BU_XPATH_OPTION}    xpath=//lightning-base-combobox-formatted-text[@title='US Test Business Unit']
${USER_BU_START_DATE_OPTION}    Mar 1, 2025
${USER_BU_END_DATE_OPTION}    Mar 31, 2025
${CREATE_BUTTON_XPATH}    xpath=//button[contains(.,'Create')]

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
    Sleep    20s