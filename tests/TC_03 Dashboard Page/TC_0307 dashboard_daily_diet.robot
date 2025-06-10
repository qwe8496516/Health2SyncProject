*** Settings ***
Resource         ../../resources/keywords/dashboard_information_keywords.robot
Resource         ../../resources/keywords/diary_page_keywords.robot
Resource         ./dashboard_variable.robot

Test Setup    Launch Application
Test Teardown    Shutdown Application

*** Test Cases ***
Verify User Can Add Breakfast Daily Diet Entry
    Click Dashboard Menu
    Click Diet Dashboard
    Add Daily Diet Entry    Breakfast    ${foodIndex}[Bread]
    Verify Daily Diet Entry Is Added    Bread
    [Teardown]    Reset Daily Diet Entry

Verify User Can Add Lunch Daily Diet Entry
    Click Dashboard Menu
    Click Diet Dashboard
    Add Daily Diet Entry    Lunch    ${foodIndex}[Bread]
    Verify Daily Diet Entry Is Added    Bread
    [Teardown]    Reset Daily Diet Entry

Verify User Can Add Dinner Daily Diet Entry
    Click Dashboard Menu
    Click Diet Dashboard
    Add Daily Diet Entry    Dinner    ${foodIndex}[Bread]
    Verify Daily Diet Entry Is Added    Bread
    [Teardown]    Reset Daily Diet Entry

Verify User Can Add Snacks Daily Diet Entry
    Click Dashboard Menu
    Click Diet Dashboard
    Add Daily Diet Entry    Snacks    ${foodIndex}[Bread]
    Verify Daily Diet Entry Is Added    Bread
    [Teardown]    Reset Daily Diet Entry