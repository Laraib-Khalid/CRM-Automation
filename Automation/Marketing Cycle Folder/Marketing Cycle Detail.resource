*** Settings ***
Library     SeleniumLibrary
Resource    Marketing Cycle.resource
Resource    ../Contact Folder/Contact Business Unit.resource

*** Variables ***
# Create Marketing Cycle Detail XPath
${MC_DETAIL_NEW_BUTTON_XPATH}   xpath=//li[@data-target-selection-name='sfdc:StandardButton.MarketingCycleDetail__c.New']//button[contains(.,'New')]
${NEW_MC_DETAIL_PAGE}  New Marketing Cycle Detail
${MC_DETAIL_FREQUENCY_DROPDOWN_XPATH}  xpath=//button[@aria-label='Frequency']
${MC_DETAIL_FREQUENCY_OPTION_XPATH}     xpath=//lightning-base-combobox-item[@data-value='2']
${MC_DETAIL_SPECIALTY_OPTION_XPATH}     xpath=//div[@data-value='ENT']
${MC_DETAIL_MOVE_TO_BUTTON_XPATH}     xpath=//button[@title='Move to Chosen']//lightning-primitive-icon[@variant='bare']

# Edit Marketing Cycle Detail XPath
${MC_DETAIL_EDIT_ACTION_BUTTON_XPATH}  xpath=(//button[@class='slds-button slds-button_icon-border slds-button_icon-x-small'])[1]
${EDIT_ACTION_MC_DETAIL_XPATH}    xpath=//a[@title='Edit']
${MC_DETAIL_GASTRO_SPECIALTY_OPTION_XPATH}     xpath=//div[@data-value='Gastroenterology']

# Delete Marketing Cycle Detail XPath
${MC_DETAIL_DELETE_ACTION_BUTTON_XPATH}  xpath=//a[@title='Show 2 more actions']
${DELETE_ACTION_MC_DETAIL_XPATH}    xpath=//a[@title='Delete']
*** Keywords ***
Create Marketing Cycle Detail
    Sleep    10s
    Execute JavaScript    window.scrollBy(0, 400);
    Wait Until Element Is Visible    ${MC_DETAIL_NEW_BUTTON_XPATH}    10s
    Click Element    ${MC_DETAIL_NEW_BUTTON_XPATH}
    Sleep    10s
#    Wait Until Element Is Visible    ${NEW_MC_DETAIL_PAGE}  10s
    Input Text      ${SEARCH_BUSINESS_UNIT_DROWNDOWN_XPATH}   ${BU_NAME}
    Sleep    5s
    Wait Until Element Is Visible   ${SEARCH_BUSINESS_UNIT_DROWNDOWN_OPTIONS_XPATH}  10s
    Click Element   ${SEARCH_BUSINESS_UNIT_OPTION_XPATH}
    Click Button    ${MC_DETAIL_FREQUENCY_DROPDOWN_XPATH}
    Click Element   ${MC_DETAIL_FREQUENCY_OPTION_XPATH}
    Click Button    ${COUNTRY_DROPDOWN_XPATH}
    Click Element   ${COUNTRY_OPTION_XPATH}
    Click Button    ${CONTACT_PRIORITY_DROPDOWN_XPATH}
    Click Element   ${CONTACT_PRIORITY_OPTION_XPATH}
    Set Focus To Element    ${MC_DETAIL_SPECIALTY_OPTION_XPATH}
    Click Element    ${MC_DETAIL_MOVE_TO_BUTTON_XPATH}
    Click Element    ${SAVE_BUTTON_XPATH}
    
Edit Marketing Cycle Detail
    Sleep    10s
    Wait Until Element Is Visible   ${MC_DETAIL_EDIT_ACTION_BUTTON_XPATH}      10s
    Click Button    ${MC_DETAIL_EDIT_ACTION_BUTTON_XPATH}
    Wait Until Element Is Visible    ${EDIT_ACTION_MC_DETAIL_XPATH}    10s
    Click Element    ${EDIT_ACTION_MC_DETAIL_XPATH}
    Wait Until Page Contains    ${EDIT_PAGE_HEADING}   10s
    Sleep    5s
    Set Focus To Element    ${MC_DETAIL_GASTRO_SPECIALTY_OPTION_XPATH}
    Click Element    ${MC_DETAIL_MOVE_TO_BUTTON_XPATH}
    Click Button    ${SAVE_BUTTON_XPATH}

Delete Marketing Cycle Detail
    Sleep    10s
    Wait Until Element Is Visible     ${MC_DETAIL_DELETE_ACTION_BUTTON_XPATH}   10s
    Click Element     ${MC_DETAIL_DELETE_ACTION_BUTTON_XPATH}
    Wait Until Element Is Visible    ${DELETE_ACTION_MC_DETAIL_XPATH}   10s
    Click Element    ${DELETE_ACTION_MC_DETAIL_XPATH}
    Sleep    5s
    Wait Until Element Is Visible    ${DELETE_CONFIRM_BUTTON_XPATH}  10s
    Click Element    ${DELETE_CONFIRM_BUTTON_XPATH}
    Sleep    10s


