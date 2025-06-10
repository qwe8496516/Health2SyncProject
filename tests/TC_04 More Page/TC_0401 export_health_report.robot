*** Settings ***
Resource         ../../resources/keywords/more_page_keywords.robot
Resource         ./more_page_variable.robot

Suite Setup    Run Keywords    Launch Application
...                     AND    On More Page
Suite Teardown    Shutdown Application

Documentation    These test cases can only run if: (1) It hasn't exceeded the 3 time limit to export the data for free user (2) There is data on the selected period

*** Test Cases ***
Verify Health Report Can Not Be Sent Without Email
    [Documentation]    Verify Health Report Can Be Sent With Email
    Click "PDF Report/Excel" Option
    Click "Send Report" Button
    Click "Send" Button
    Verify Health Report Is Not Sent
    Click Dialog Close Button
    [Teardown]    Run Keywords    Click Arrow Back Button
    ...                    AND    Click Arrow Back Button

Verify Health Report Can Be Sent With Email
    [Documentation]    Verify Health Report Can Not Be Sent Without Email
    Click "PDF Report/Excel" Option
    Click "Send Report" Button
    Enter Email    ${RANDOM_EMAIL}
    Click "Send" Button
    Click "Confirm" Button
    Verify Health Report Is Sent
    Click "Yes" Button
    [Teardown]    Run Keywords    Click Arrow Back Button
    ...                    AND    Click Arrow Back Button