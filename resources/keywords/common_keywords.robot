*** Settings ***
Library    AppiumLibrary
Resource   ../variables/app_config.robot

*** Keywords ***
Launch Application
    Open Application    ${REMOTE_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}
    ...    noReset=true

Shutdown Application
    Close Application

Click Element Until Element Is Visible
    [Arguments]    ${locator}    ${timeout}=5
    Wait Until Element Is Visible    ${locator}    ${timeout}
    Click Element    ${locator}

Input Text Until Element Is Visible
    [Arguments]    ${locator}    ${text}    ${timeout}=5
    Wait Until Element Is Visible    ${locator}    ${timeout} 
    Input Text    ${locator}    ${text}

Scroll Until Element Is Visible
    [Arguments]    ${locator}    ${timeout}=5
    Scroll Element Into View    ${locator}
    Wait Until Element Is Visible    ${locator}    timeout=${timeout}s
    Element Should Be Visible    ${locator}

Verify Text Element Is Equal To Expected Value  
    [Arguments]    ${locator}    ${expectedValue}    ${timeout}=5
    Wait Until Element Is Visible    ${locator}    ${timeout} 
    ${value}=    Get Text    ${locator}
    Should Be Equal    ${value}    ${expectedValue}

Verify Element Is Visible On Page
    [Arguments]    ${locator}    ${timeout}=5
    Wait Until Element Is Visible    ${locator}    ${timeout}
    Element Should Be Visible    ${locator}