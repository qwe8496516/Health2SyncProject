*** Settings ***
Resource         ../../resources/keywords/add_user_health_data_keywords.robot

Suite Setup    Launch Application
Suite Teardown    Shutdown Application

*** Test Cases ***
Verify New Exercise Entry Can Be Successfully Added To The Diary Page
    [Documentation]    Exercise Entry Can Be Successfully Added To The Diary Page
    Create Execise Diary
    Delete Exercise Diary
    [Teardown]