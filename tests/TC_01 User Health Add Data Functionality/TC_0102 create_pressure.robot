*** Settings ***
Resource         ../../resources/keywords/add_user_health_data_keywords.robot

Suite Setup    Launch Application
Suite Teardown    Shutdown Application

*** Test Cases ***
Verify New Pressure Entry Can Be Successfully Added To The Diary Page
    [Documentation]    Pressure Entry Can Be Successfully Added To The Diary Page
    [Setup]    Create Pressure Diary    120     80      100      past    After Snack
    Verify Pressure Is Correct    120     80      100
    [Teardown]    Delete Diary 