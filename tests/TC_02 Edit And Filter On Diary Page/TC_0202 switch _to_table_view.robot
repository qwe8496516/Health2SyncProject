*** Settings ***
Resource         ../../resources/keywords/diary_page_keywords.robot

Suite Setup    Launch Application
Suite Teardown    Shutdown Application

*** Test Cases ***
Verify Diary Page Loads Successfully
    [Documentation]
    Click Diary Menu
    Click Table View
    Verify List View on Rage
    [Teardown]