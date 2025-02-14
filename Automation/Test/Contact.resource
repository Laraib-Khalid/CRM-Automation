*** Settings ***
Library     SeleniumLibrary

*** Variables ***
# Login XPath


*** Keywords ***
    Sleep    10s
    Click Button    ${APP_LAUNCHER_BUTTON}
#    Sleep    10s
    Wait Until Element Is Visible    ${SEARCH_APP}    10s
    Input Text   ${SEARCH_APP}    ${ENTER_ACCOUNT_TEXT}
    Sleep    20s
    Wait Until Element Is Visible    ${RESULT_ACCOUNT_TEXT}    10s
    Click Element    ${RESULT_ACCOUNT_TEXT}
    Wait Until Element Is Visible   ${ACCOUNT_PAGE_HEADING}     10s