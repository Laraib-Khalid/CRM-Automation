*** Settings ***
Library     SeleniumLibrary
Resource    Medical Contact.resource

*** Variables ***
${CONTACT_RELATED_TAB}  xpath= //a[contains(@data-label,'Related')]
${CONTACT_BUSINESS_UNIT_NEW_BUTTON}  xpath=(//button[contains(.,'New')])[1]
${NEW_CONTACT_BUSINESS_UNIT_PAGE}  New Contact Business Unit
${SEARCH_CONTACT_BUSINESS_UNIT_DROWNDOWN_XPATH}  xpath=(//input[contains(@id,'combobox-input-')])[2]
${SEARCH_CONTACT_BUSINESS_UNIT_TEXT}  US-ENT & Surgery
${SEARCH_CONTACT_BUSINESS_UNIT_DROWNDOWN_OPTIONS_XPATH}     xpath=//lightning-base-combobox-item[@class='slds-media slds-listbox__option slds-media_center slds-listbox__option_entity' and @role='option']
${SEARCH_CONTACT_BUSINESS_UNIT_OPTION_XPATH}      xpath=(//lightning-base-combobox-item[@class='slds-media slds-listbox__option slds-media_center slds-listbox__option_entity' and @role='option'])[2]
*** Keywords ***
Create Contact Business Unit
    Sleep    10s
    Wait Until Element Is Visible    ${CONTACT_RELATED_TAB}    10s
    Click Element    ${CONTACT_RELATED_TAB}
    Sleep    10s

#    Mouse Down    xpath=//span[@title='Contact Business Unit']/ancestor::div[1]/ancestor::div[1]/ancestor::div[1]//following-sibling::div[2]
#    Execute Javascript    Window.scrollTo(0, document.body.scrollHeight);
#    Execute Javascript    arguments[0].scrollIntoView();
    Execute JavaScript    window.scrollBy(0, 150);
    Sleep    10s
    Click Element    ${CONTACT_BUSINESS_UNIT_NEW_BUTTON}
    Wait Until Page Contains    ${NEW_CONTACT_BUSINESS_UNIT_PAGE}
    Click Button    ${COUNTRY_DROPDOWN_XPATH}
    Click Element   ${COUNTRY_OPTION_XPATH}
    Click Button    ${NEW_MEDICAL_SPECIALTY_DROPDOWN_XPATH}
    Click Element   ${NEW_MEDICAL_SPECIALTY_OPTION_XPATH}
    Click Button    ${NEW_MEDICAL_PRIORITY_DROPDOWN_XPATH}
    Click Element   ${NEW_MEDICAL_PRIORITY_OPTION_XPATH}
    Input Text      ${SEARCH_CONTACT_BUSINESS_UNIT_DROWNDOWN_XPATH}   ${SEARCH_CONTACT_BUSINESS_UNIT_TEXT}
    Sleep    10s
    Wait Until Element Is Visible   ${SEARCH_CONTACT_BUSINESS_UNIT_DROWNDOWN_OPTIONS_XPATH}  10s
    Click Element   ${SEARCH_CONTACT_BUSINESS_UNIT_OPTION_XPATH}
    Click Button    ${SAVE_BUTTON_XPATH}
