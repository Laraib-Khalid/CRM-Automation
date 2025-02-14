*** Settings ***
Library     SeleniumLibrary
Library     Search_Brick_Account.py
Resource    Create Brick Code.resource
Resource    Create Hospital Account Code.resource

*** Variables ***
# Login XPath
${USERNAME_XPATH}    //*[@id="username"]
${USERNAME_VALUE}    admin.qasmartcrm@bssuniversal.com
${PASSWORD_XPATH}    //*[@id="password"]
${PASSWORD_VALUE}    Bss@2025
${LOGIN_BUTTON_XPATH}    //*[@id="Login"]

${CRM_TEXT_VISIBLE}     xpath=/html/body/div[4]/div[1]/section/div[1]/div[1]/one-appnav/div/div/div/h1


# Search and Create Brick Account XPath
${APP_LAUNCHER_BUTTON}      xpath=//button[@title='App Launcher']
${SEARCH_APP}       xpath=//input[@role='combobox' and @placeholder='Search apps and items...']
${ENTER_ACCOUNT_TEXT}     Accounts
${RESULT_ACCOUNT_TEXT}     xpath=//div[@class='slds-size_small'][contains(.,'Accounts')]
${ACCOUNT_PAGE_HEADING}     xpath=//h1[@class='slds-var-p-right_x-small'][contains(.,'Accounts')]
${SEARCH_ACCOUNT_XPATH}    xpath=//input[@placeholder='Search this list...']
${SEARCH_BRICK_NAME}       Test
${SEARCH_BRICK_NAME_XPath}    //a[@title='Test Brick']  # Replace with the actual locator of the "brick name" element


#   Edit Brick Account XPath
${EDIT_BRICK_BUTTON_XPATH}         xpath=//button[@name='Edit']
${EDIT_ACCOUNT_PAGE_HEADING}         Edit
${EDIT_ACCOUNT_NAME_XPATH}    xpath=//input[@name='Name']
${EDIT_BRICK_NAME}    Test Brick
${EDIT_BRICK_DESCRIPTION_XPATH}   xpath=//textarea[@class='slds-textarea']
${EDIT_BRICK_DESCRIPTION}       This is the test Brick description.
${SAVE_BUTTON_XPATH}     xpath=//button[@name='SaveEdit']

#   Delete Brick Account XPath
${DELETE_BRICK_BUTTON_XPATH}  xpath=//button[@class='slds-button slds-button_neutral' and @name='Delete']
${DELETE_CONFIRM_BUTTON_XPATH}  xpath=//button[@class='slds-button slds-button_neutral uiButton--default uiButton--brand uiButton forceActionButton' and @title='Delete']



#   Hospital Account XPath
${ACCOUNT_TAB_XPATH}     xpath=//a[@title='Accounts']
${SEARCH_HOSPITAL_NAME}       Test Hosp
${HOSPITAL_NAME_ID}    xpath=//a[@title='Test Hospital']

${EDIT_HOSPITAL_NAME}    Test Hospital
${EDIT_HOSPITAL_BUTTON_XPATH}         xpath=(//button[@name='Edit'])[2]

${DELETE_HOSPITAL_BUTTON_XPATH}  xpath=(//button[@name='Delete'])[2]

*** Keywords ***
Login
    Input Text    ${USERNAME_XPATH}    ${USERNAME_VALUE}
    Input Password    ${PASSWORD_XPATH}    ${PASSWORD_VALUE}
    Click Button    ${LOGIN_BUTTON_XPATH}
    Wait Until Element Is Visible    ${CRM_TEXT_VISIBLE}     10s

Search and Create Brick Account
    Sleep    10s
    Set Global Variable    ${brick_exists}    False
    Click Button    ${APP_LAUNCHER_BUTTON}
#    Sleep    10s
    Wait Until Element Is Visible    ${SEARCH_APP}    10s
    Input Text   ${SEARCH_APP}    ${ENTER_ACCOUNT_TEXT}
    Sleep    20s
    Wait Until Element Is Visible    ${RESULT_ACCOUNT_TEXT}    10s
    Click Element    ${RESULT_ACCOUNT_TEXT}
    Wait Until Element Is Visible   ${ACCOUNT_PAGE_HEADING}     10s
    Sleep    5s
    Input Text     ${SEARCH_ACCOUNT_XPATH}   ${SEARCH_BRICK_NAME}
    Press Key    ${SEARCH_ACCOUNT_XPATH}    \\13
    Sleep    10s
    ${brick_exists}=    Run Keyword And Return Status    Element Should Be Visible    ${SEARCH_BRICK_NAME_XPath}
#
#
#    Run Keyword If    ${brick_exists}
#    ...    Click Element    ${SEARCH_BRICK_NAME_XPath}
#
#    ...    ELSE
#    ...    Create Brick
     Handle Brick Action    ${brick_exists}    ${SEARCH_BRICK_NAME_XPath}

Edit Brick Account
    Sleep    20s
    Wait Until Element Is Visible    ${EDIT_BRICK_BUTTON_XPATH}   20s
    Click Element    ${EDIT_BRICK_BUTTON_XPATH}
    Wait Until Page Contains    ${EDIT_ACCOUNT_PAGE_HEADING}   10s
    Sleep    10s
    Clear Element Text  ${EDIT_ACCOUNT_NAME_XPATH}   # Clears the existing text
    Input Text      ${EDIT_ACCOUNT_NAME_XPATH}   ${EDIT_BRICK_NAME}
#    Set Global Variable    ${BRICK_NAME}    ${EDIT_BRICK_NAME}
#    Click Element    xpath://textarea[@id='input-764']
    Input Text       ${EDIT_BRICK_DESCRIPTION_XPATH}   ${EDIT_BRICK_DESCRIPTION}
    Click Button    ${SAVE_BUTTON_XPATH}
#    Wait Until Keyword Succeeds  10s  1s  Alert Should Be Present

Delete Brick Account
    Wait Until Element Is Visible    ${DELETE_BRICK_BUTTON_XPATH}     20s
    Sleep    10s
    Click Element    ${DELETE_BRICK_BUTTON_XPATH}
    Sleep    10s
    Wait Until Element Is Visible    ${DELETE_CONFIRM_BUTTON_XPATH}  10s
    Click Element    ${DELETE_CONFIRM_BUTTON_XPATH}
    Sleep    50s


Search and Create Hospital Account
    Sleep    10s
    Wait Until Element Is Visible   ${ACCOUNT_TAB_XPATH}     10s
    Click Element    ${ACCOUNT_TAB_XPATH}
    Sleep    5s
    Clear Element Text  ${SEARCH_ACCOUNT_XPATH}
    Input Text    ${SEARCH_ACCOUNT_XPATH}    ${SEARCH_HOSPITAL_NAME}
    Sleep    10s
    Press Key    ${SEARCH_ACCOUNT_XPATH}    \\13
    Sleep    20s
    ${hospital_exists}=    Run Keyword And Return Status    Element Should Be Visible    ${HOSPITAL_NAME_ID}
    Run Keyword If    ${hospital_exists}
    ...    Click Element    ${HOSPITAL_NAME_ID}

    ...    ELSE
    ...    Create Hospital

Edit Hospital Account
    Sleep    20s
    Wait Until Element Is Visible    ${EDIT_HOSPITAL_BUTTON_XPATH}   20s
#    Page Should Contain Button    xpath=//button[@type="button" and @name='Edit']
    Click Element    ${EDIT_HOSPITAL_BUTTON_XPATH}
    Wait Until Page Contains    ${EDIT_ACCOUNT_PAGE_HEADING}     10s
    Sleep    10s
    Clear Element Text  ${EDIT_ACCOUNT_NAME_XPATH}  # Clears the existing text
    Input Text  ${EDIT_ACCOUNT_NAME_XPATH}  ${EDIT_HOSPITAL_NAME}
    Click Button    ${SAVE_BUTTON_XPATH}
#    Wait Until Keyword Succeeds  10s  1s  Alert Should Be Present

Delete Hospital Account
    Sleep    20s
    Wait Until Element Is Visible     ${DELETE_HOSPITAL_BUTTON_XPATH}    30s
#    Page Should Contain Button    xpath=//button[@type="button" and @name='Delete']
    Click Element    ${DELETE_HOSPITAL_BUTTON_XPATH}
    Wait Until Element Is Visible    ${DELETE_CONFIRM_BUTTON_XPATH}  10s
    Click Element    ${DELETE_CONFIRM_BUTTON_XPATH}
    Sleep    10s
    Wait Until Element Is Visible    xpath=//h1[@class='slds-var-p-right_x-small'][contains(.,'Accounts')]    10s
