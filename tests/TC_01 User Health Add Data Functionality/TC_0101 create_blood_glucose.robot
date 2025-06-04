*** Settings ***
Resource         ../../resources/keywords/add_user_health_data_keywords.robot

Suite Setup    Launch Application
Suite Teardown    Shutdown Application

*** Test Cases ***
Verify New Glucose Entry Can Be Successfully Added To The Diary Page
    [Documentation]    Glucose Entry Can Be Successfully Added To The Diary Page
    [Setup]    Create Glucose Diary    121      past    After Snack
    Verify Glucose Diary Is Correct    121
    [Teardown]    Delete Glucose Diary 