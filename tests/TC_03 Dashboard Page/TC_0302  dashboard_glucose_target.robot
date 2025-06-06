*** Settings ***
Resource         ../../resources/keywords/dashboard_information_keywords.robot
Resource         ../../resources/keywords/add_user_health_data_keywords.robot
Resource         ../../resources/keywords/diary_page_keywords.robot
Resource         ./dashboard_variable.robot

Suite Setup    Launch Application
Suite Teardown    Shutdown Application

*** Test Cases ***
Verify User Can Modify Glucose Target
    [Documentation]    Glucose Target Can Be Successfully Modified And Displayed
    [Setup]    Create Glucose Diary    100    past    After Snack
    Click Dashboard Menu
    Click Glucose Dashboard Section
    Click Dashboard Menu Setting Button
    Click Blood Glucose Set Goals Option
    Enter After Meal Values    20    110
    Click Back Image Button
    Verify Glucose Values Is Correct    -    -    -
    Verify Distribution Is Correct    -    -    -    -
    [Teardown]    Run Keywords    Click Back Image Button
    ...                    AND    Click Diary Menu
    ...                    AND    Delete Diary