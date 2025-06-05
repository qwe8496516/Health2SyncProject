*** Settings ***
Resource         ../../resources/keywords/diary_page_keywords.robot
Resource         ../../resources/keywords/add_user_health_data_keywords.robot
Suite Setup    Launch Application
#Suite Teardown    Shutdown Application

*** Test Cases ***
Verify Diary Page Loads Successfully
    [Documentation]
    Create Execise Diary
    Click Diary Menu
    Click Search Bar
    Enter Keyword At Search Bar  jog
    Press Enter At Search Bar
    Verify Entries with Keyword Shows on Diary Page  jog
    Exit Search state on Diary Page
    Delete Exercise Diary
    [Teardown]