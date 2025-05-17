*** Settings ***
Resource         ../../resources/keywords/common_keywords.robot
Resource         ../../resources/keywords/add_user_health_data_keywords.robot

Suite Setup    Launch Application
Suite Teardown    Shutdown Application

*** Test Cases ***
Verify New Glucose Entry Can Be Successfully Added To The Diary Page
    [Documentation]    Test Common Keywords
    [Setup]    Create Glucose Diary    121
    Verify Glucose Diary Is Corret    121
    [Teardown]    Delete Glucose Diary