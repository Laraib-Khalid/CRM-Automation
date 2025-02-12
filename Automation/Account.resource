*** Settings ***
Library     SeleniumLibrary
Resource    Create Brick Code.resource
Resource    Create Account Code.resource

*** Variables ***
${SEARCH_BRICK_NAME}       Test
${BRICK_NAME_ID}    xpath=//a[@title='Test Brick']  # Replace with the actual locator of the "brick name" element
${EDIT_BRICK_NAME}    Test Brick

${SEARCH_HOSPITAL_NAME}       Test Hosp
${HOSPITAL_NAME_ID}    xpath=//a[@title='Test Hospital']
${EDIT_HOSPITAL_NAME}    Test Hospital

*** Keywords ***
Login
    Input Text    //*[@id="username"]    admin.qasmartcrm@bssuniversal.com
    Input Password    //*[@id="password"]    Bss@2025
    Click Button    //*[@id="Login"]
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div[1]/section/div[1]/div[1]/one-appnav/div/div/div/h1     10s

Create Brick Account
    Sleep    10s
    Click Button    xpath=//button[@title='App Launcher']
    Sleep    10s
    Wait Until Element Is Visible    xpath=//input[@role='combobox' and @placeholder='Search apps and items...']    10s
    Input Text    xpath=//input[@role='combobox' and @placeholder='Search apps and items...']    Accounts
    Wait Until Element Is Visible    xpath=//div[@class='slds-size_small'][contains(.,'Accounts')]    10s
    Click Element    xpath=//div[@class='slds-size_small'][contains(.,'Accounts')]
    Wait Until Element Is Visible    xpath=//h1[@class='slds-var-p-right_x-small'][contains(.,'Accounts')]    10s
    Sleep    5s
    Input Text    xpath=//input[@placeholder='Search this list...']    ${SEARCH_BRICK_NAME}
    Press Key    xpath=//input[@placeholder='Search this list...']    \\13
    Sleep    10s
    ${brick_exists}=    Run Keyword And Return Status    Element Should Be Visible    ${BRICK_NAME_ID}

    Run Keyword If    ${brick_exists}
    ...    Click Element    ${BRICK_NAME_ID}

    ...    ELSE
    ...    Create Brick


Edit Brick Account
    Wait Until Element Is Visible    xpath=//button[@name='Edit']   20s
    Click Element    xpath=//button[@name='Edit']
    Wait Until Page Contains    Edit Brick  10s
    Sleep    10s
    Clear Element Text  xpath=//input[@name='Name']  # Clears the existing text
    Input Text  xpath=//input[@name='Name']  ${EDIT_BRICK_NAME}
#    Click Element    xpath://textarea[@id='input-764']
    Input Text       xpath=//textarea[@class='slds-textarea']   This is the test Brick description.
    Click Button    xpath=//button[@name='SaveEdit']
#    Wait Until Keyword Succeeds  10s  1s  Alert Should Be Present

Delete Brick Account
    Wait Until Element Is Visible    xpath=//button[@name='Delete']     20s
    Sleep    10s
    Click Element    xpath=//button[@class='slds-button slds-button_neutral' and @name='Delete']
    Wait Until Element Is Visible    xpath=//button[@class='slds-button slds-button_neutral uiButton--default uiButton--brand uiButton forceActionButton' and @title='Delete']  10s
    Click Element    xpath=//button[@class='slds-button slds-button_neutral uiButton--default uiButton--brand uiButton forceActionButton' and @title='Delete']



Create Hospital Account
    Sleep    10s
    Wait Until Element Is Visible    xpath=//a[@title='Accounts']    10s
    Click Element    xpath=//a[@title="Accounts"]
    Sleep    5s
    Clear Element Text  xpath=//input[@placeholder='Search this list...']
    Input Text    xpath=//input[@placeholder='Search this list...']    ${SEARCH_HOSPITAL_NAME}
    Sleep    10s
    Press Key    xpath=//input[@placeholder='Search this list...']    \\13
    Sleep    20s
    ${hospital_exists}=    Run Keyword And Return Status    Element Should Be Visible    ${HOSPITAL_NAME_ID}
    Run Keyword If    ${hospital_exists}
    ...    Click Element    ${HOSPITAL_NAME_ID}

    ...    ELSE
    ...    Create Hospital

Edit Hospital Account
    Sleep    20s
    Wait Until Element Is Visible    xpath=//button[@type="button" and @name='Edit']   20s
#    Page Should Contain Button    xpath=//button[@type="button" and @name='Edit']
    Click Element    xpath=//button[@type="button" and @name='Edit']
    Wait Until Page Contains    Edit
    Sleep    10s
    Clear Element Text  xpath=//input[@name='Name']  # Clears the existing text
    Input Text  xpath=//input[@name='Name']  ${EDIT_HOSPITAL_NAME}
    Click Button    xpath=//button[@name='SaveEdit']
#    Wait Until Keyword Succeeds  10s  1s  Alert Should Be Present

Delete Hospital Account
    Sleep    20s
    Wait Until Element Is Visible     xpath=//button[@class='slds-button slds-button_neutral' and @name='Delete']    30s
#    Page Should Contain Button    xpath=//button[@type="button" and @name='Delete']
    Click Element    xpath=//button[@class='slds-button slds-button_neutral' and @name='Delete']
    Wait Until Element Is Visible    xpath=//button[@class='slds-button slds-button_neutral uiButton--default uiButton--brand uiButton forceActionButton' and @title='Delete']  10s
    Click Element    xpath=//button[@class='slds-button slds-button_neutral uiButton--default uiButton--brand uiButton forceActionButton' and @title='Delete']
    Sleep    10s
    Wait Until Element Is Visible    xpath=//h1[@class='slds-var-p-right_x-small'][contains(.,'Accounts')]    10s
