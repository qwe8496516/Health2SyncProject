*** Settings ***
Resource         ../../resources/keywords/add_user_health_data_keywords.robot

Suite Setup    Launch Application
Suite Teardown    Shutdown Application

*** Test Cases ***
Verify New Diary Entry Guide Can Be Added
    [Documentation]
    Create Diary Entry Guide
    [Teardown]    Reset Diary Entry Guide