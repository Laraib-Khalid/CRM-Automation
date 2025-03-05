*** Settings ***
Library     SeleniumLibrary
Resource    Marketing Cycle Detail.resource

*** Variables ***
# Create Marketing Cycle Detail XPath
${MC_RELATED_TAB}  xpath=//a[@data-label="Related"]
${TARGET_KPI_NEW_BUTTON_XPATH}   xpath=//li[@data-target-selection-name='sfdc:StandardButton.Target_KPI__c.New']//button[contains(.,'New')]
${TARGET_KPI_NEW_PAGE_XPATH}   New Target KPI
${TARGET_KPI_BU_XPATH}  xpath=//input[@placeholder='Search Business Unit...']
${TARGET_COVERAGE_XPATH}   xpath=//input[@name='Target_Coverage__c']
${TARGET_CALL_RATE_XPATH}   xpath=//input[@name='Target_Call_Rate__c']
${LIMIT_PER_CALL_XPATH}   xpath=//input[@name='Limit_per_Call__c']
${LIMIT_PER_YEAR_XPATH}   xpath=//input[@name='Limit_Per_Year__c']
${TARGET_FREQUENCY_XPATH}   xpath=//input[@name='Target_Frequency__c']
${MONTH_DROPDOWN_XPATH}     xpath=//button[@aria-label='Month']
${MONTH_OPTION_XPATH}     xpath=//lightning-base-combobox-item[@role='option' and @data-value='March']
${YEAR_DROPDOWN_XPATH}     xpath=//button[@aria-label='Year']
${YEAR_OPTION_XPATH}     xpath=//lightning-base-combobox-item[@role='option' and @data-value='2025']
${SCROLL_CREATED_BY_XPATH}    xpath=(//div[@class='slds-form-element slds-hint-parent test-id__output-root slds-form-element_stacked']//span[@class="test-id__field-label"])[1]
${TARGET_KPI_DELETE_ACTION_BUTTON_XPATH}    xpath=//table[@aria-label="Target KPI"]//a[@title='Show 2 more actions']

*** Keywords ***
Click on Marketing Cycle Related Tab
    Sleep    10s
    Execute Javascript  window.scrollBy(0, -400);
    Wait Until Element Is Visible    ${MC_RELATED_TAB}    10s
    Click Element    ${MC_RELATED_TAB}

Create Target KPI
    Sleep    10s
    Wait Until Element Is Visible    ${TARGET_KPI_NEW_BUTTON_XPATH}    10s
    Click Element    ${TARGET_KPI_NEW_BUTTON_XPATH}
    Wait Until Page Contains    ${TARGET_KPI_NEW_PAGE_XPATH}    10s
    Input Text    ${TARGET_KPI_BU_XPATH}    ${BU_NAME}
#    Sleep    5s
    Wait Until Element Is Visible   ${SEARCH_BUSINESS_UNIT_DROWNDOWN_OPTIONS_XPATH}  10s
    Click Element   ${SEARCH_BUSINESS_UNIT_OPTION_XPATH}
    Input Text    ${TARGET_COVERAGE_XPATH}    80
    Input Text    ${TARGET_CALL_RATE_XPATH}    80
    Input Text    ${LIMIT_PER_CALL_XPATH}     4
    Input Text    ${LIMIT_PER_YEAR_XPATH}   200
    Input Text    ${TARGET_FREQUENCY_XPATH}   80
    Scroll Element Into View    ${COUNTRY_DROPDOWN_XPATH}
    Click Button    ${MONTH_DROPDOWN_XPATH}
    Click Element   ${MONTH_OPTION_XPATH}
    Scroll Element Into View    ${SCROLL_CREATED_BY_XPATH}
    Wait Until Element Is Visible    ${COUNTRY_DROPDOWN_XPATH}  10s
    Click Button    ${COUNTRY_DROPDOWN_XPATH}
    Click Element   ${COUNTRY_OPTION_XPATH}
    Click Button    ${YEAR_DROPDOWN_XPATH}
    Click Element   ${YEAR_OPTION_XPATH}
    Click Element    ${SAVE_BUTTON_XPATH}

Edit Target KPI
    Sleep    10s
    Wait Until Element Is Visible   ${MC_DETAIL_EDIT_ACTION_BUTTON_XPATH}      10s
    Click Button    ${MC_DETAIL_EDIT_ACTION_BUTTON_XPATH}
    Wait Until Element Is Visible    ${EDIT_ACTION_MC_DETAIL_XPATH}    10s
    Click Element    ${EDIT_ACTION_MC_DETAIL_XPATH}
    Wait Until Page Contains    ${EDIT_PAGE_HEADING}   10s
    Sleep    5s
    Input Text    ${TARGET_COVERAGE_XPATH}    90
    Click Button    ${SAVE_BUTTON_XPATH}

Delete Target KPI
    Sleep    10s
    Wait Until Element Is Visible     ${TARGET_KPI_DELETE_ACTION_BUTTON_XPATH}   10s
    Click Element     ${TARGET_KPI_DELETE_ACTION_BUTTON_XPATH}
    Wait Until Element Is Visible    ${DELETE_ACTION_MC_DETAIL_XPATH}   10s
    Click Element    ${DELETE_ACTION_MC_DETAIL_XPATH}
    Sleep    5s
    Wait Until Element Is Visible    ${DELETE_CONFIRM_BUTTON_XPATH}  10s
    Click Element    ${DELETE_CONFIRM_BUTTON_XPATH}
    Sleep    20s