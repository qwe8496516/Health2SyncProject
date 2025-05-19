*** Settings ***
Resource         ../../resources/keywords/more_page_keywords.robot

Suite Setup    Run Keywords    Launch Application
...                     AND    On More Page
Suite Teardown    Shutdown Application

*** Test Cases ***
Verify Health Report Can Be Exported
    [Documentation]    Verify Health Report Can Be Exported
    Click "PDF Report/Excel" Option
    Click "Send Report" Button
    Enter Email    noceur58@gmail.com
    Click "Send" Button
    Click "Confirm" Button
    Verify Health Report Is Exported
    [Teardown]    Click "Yes" Button