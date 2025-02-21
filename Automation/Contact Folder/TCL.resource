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

*** Keywords ***
Create Contact TCL
    Sleep    20s
    Execute JavaScript    window.scrollBy(0, 300);
    Sleep    20s
    Click Element    ${CONTACT_TCL_NEW_BUTTON}
    Wait Until Page Contains    ${NEW_CONTACT_TCL_PAGE}     10s
    Click Button    ${NEXT_BUTTON_XPATH}
    Click Button    ${NEW_MEDICAL_PRIORITY_DROPDOWN_XPATH}
    Click Element   ${NEW_MEDICAL_PRIORITY_OPTION_XPATH}
    Sleep    20s
#    Click Element   ${COUNTRY_OPTION_XPATH}
#    Click Button    ${NEW_MEDICAL_SPECIALTY_DROPDOWN_XPATH}
#    Click Element   ${NEW_MEDICAL_SPECIALTY_OPTION_XPATH}
#    Click Button    ${NEW_MEDICAL_PRIORITY_DROPDOWN_XPATH}
#    Click Element   ${NEW_MEDICAL_PRIORITY_OPTION_XPATH}
#    Input Text      ${SEARCH_CONTACT_BUSINESS_UNIT_DROWNDOWN_XPATH}   ${SEARCH_CONTACT_BUSINESS_UNIT_TEXT}
#    Sleep    10s
#    Wait Until Element Is Visible   ${SEARCH_CONTACT_BUSINESS_UNIT_DROWNDOWN_OPTIONS_XPATH}  10s
#    Click Element   ${SEARCH_CONTACT_BUSINESS_UNIT_OPTION_XPATH}
#    Click Button    ${SAVE_BUTTON_XPATH}
