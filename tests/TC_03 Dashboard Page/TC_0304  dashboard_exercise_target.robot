*** Settings ***
Resource         ../../resources/keywords/dashboard_information_keywords.robot

Suite Setup    Launch Application
Suite Teardown    Shutdown Application

*** Test Cases ***
Verify User Can Modify Exercise Target
    [Documentation]    Exercise Target Can Be Successfully Modified And Displayed
    Click Dashboard Menu
    Click Dashboard Section    exercise
    Change Weekly Exercise Time Target    200
    Verify Exercise Target Is Equal To Expected Value    200