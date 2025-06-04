*** Settings ***
Resource         ../../resources/keywords/dashboard_information_keywords.robot

Suite Setup    Launch Application
Suite Teardown    Shutdown Application

*** Test Cases ***
Verify User Can Modify Glucose Target
    [Documentation]    Glucose Target Can Be Successfully Modified And Displayed
    [Setup]    Create Glucose Diary    121
    Click Dashboard Menu
    Click Dashboard Section    ${GLUCOSE_DASHBOARD}
    # Verify Glucose Diary Is Correct    121
    # [Teardown]    Delete Glucose Diary