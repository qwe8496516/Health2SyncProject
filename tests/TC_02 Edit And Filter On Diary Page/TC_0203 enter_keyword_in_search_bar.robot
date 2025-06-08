*** Settings ***
Resource         ../../resources/keywords/diary_page_keywords.robot
Resource         ../../resources/keywords/add_user_health_data_keywords.robot

Suite Setup    Launch Application
Suite Teardown    Shutdown Application

*** Test Cases ***
Verify Keyword Search Food
    [Documentation]
    ${entry1}=    Create Dictionary    category=Bread    serv=1.2
    ${entries1}=    Create List    ${entry1}
    ${entry2}=    Create Dictionary    category=Pasta    serv=1.2
    ${entries2}=    Create List    ${entry2}
    Create Diet Diary    ${entries1}    now    Wake-up
    Create Diet Diary    ${entries2}    now    After Lunch
    Click Diary Menu
    Click Search Bar
    Enter Keyword At Search Bar  Bread
    Press Enter At Search Bar
    Verify Diet Is Correct    ${entries1}
    Exit Search state on Diary Page
    Delete Diary
    Delete Diary
    [Teardown]

Verify Keyword Search Exercise
    [Documentation]
    ${entry1}=    Create Dictionary    type=Yoga   hour=1   minute=5
    ${entries1}=    Create List    ${entry1}
    ${entry2}=    Create Dictionary    type=Tennis   hour=1   minute=5
    ${entries2}=    Create List    ${entry2}
    Create Exercise Diary    ${entries1}    now    Wake-up
    Create Exercise Diary    ${entries2}    now    After Lunch
    Click Diary Menu
    Click Search Bar
    Enter Keyword At Search Bar  Yoga
    Press Enter At Search Bar
    Verify Exercise Is Correct    ${entries1}
    Exit Search state on Diary Page
    Delete Diary
    Delete Diary
    [Teardown]