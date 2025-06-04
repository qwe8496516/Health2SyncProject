*** Settings ***
Resource         ../../resources/keywords/add_user_health_data_keywords.robot

Suite Setup    Launch Application
Suite Teardown    Shutdown Application

*** Test Cases ***
Verify New Weight Entry Can Be Successfully Added To The Diary Page
    [Documentation]    Weight Entry Can Be Successfully Added To The Diary Page
    [Setup]    Create Weight Diary    60      20      past    After Snack
    Verify Weight Is Correct    60      20 
    [Teardown]    Delete Diary 