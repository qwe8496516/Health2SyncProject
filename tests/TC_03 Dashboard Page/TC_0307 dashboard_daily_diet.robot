*** Settings ***
Resource         ../../resources/keywords/dashboard_information_keywords.robot
Resource         ../../resources/keywords/diary_page_keywords.robot
Resource         ./dashboard_variable.robot

Test Setup    Launch Application
Test Teardown    Shutdown Application

*** Test Cases ***
Verify User Can Add Daily Diet Entry
    Click Dashboard Menu
    Click Diet Dashboard
    Add Daily Diet Entry    Breakfast    ${foodIndex}[Bread]
    Verify Daily Diet Entry Is Added    Bread
    [Teardown]    Reset Daily Diet Entry