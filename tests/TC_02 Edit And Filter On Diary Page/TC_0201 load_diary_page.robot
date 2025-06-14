*** Settings ***
Resource         ../../resources/keywords/diary_page_keywords.robot
Resource         ../../resources/keywords/add_user_health_data_keywords.robot

Suite Setup    Launch Application
Suite Teardown    Shutdown Application

*** Test Cases ***
Verify Glucose Show On Diary Page
    [Documentation]
    Create Glucose Diary    80    now    After Lunch
    Click Diary Menu
    Verify Glucose Diary Is Correct    80
    Delete Diary
    [Teardown]

Verify Pressure Show On Diary Page
    [Documentation]
    Create Pressure Diary    60    40    20    now    Wake-up 
    Click Diary Menu
    Verify Pressure Is Correct    60    40    20
    Delete Diary
    [Teardown]

Verify Weight Show On Diary Page
    [Documentation]
    Create Weight Diary    70    20    now    Wake-up 
    Click Diary Menu
    Verify Weight Is Correct    70    20
    Delete Diary
    [Teardown]

Verify Medication Show On Diary Page
    [Documentation]
    Create Insulin/GLP-1 Medication Diary    Admelog    2    2    now    Wake-up 
    Click Diary Menu
    Verify Insulin/GLP-1 Medication Is Correct    Admelog    2    2
    Delete Diary
    [Teardown]

Verify Diet Show On Diary Page
    ${entry}=    Create Dictionary    category=Bread    serv=1.2
    ${entries}=    Create List    ${entry}
    Create Diet Diary    ${entries}    now    Wake-up
    Click Diary Menu
    Verify Diet Is Correct    ${entries}
    Delete Diary
    [Teardown]

Verify Exercise Show On Diary Page
    ${entry}=    Create Dictionary    type=Tennis   hour=1   minute=5
    ${entries}=    Create List    ${entry}
    Create Exercise Diary    ${entries}    now    Wake-up
    Click Diary Menu
    Verify Exercise Is Correct    ${entries}
    Delete Diary
    [Teardown]