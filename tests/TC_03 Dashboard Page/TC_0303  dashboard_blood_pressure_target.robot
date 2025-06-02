*** Settings ***
Resource         ../../resources/keywords/dashboard_information_keywords.robot

Suite Setup    Launch Application
Suite Teardown    Shutdown Application

*** Test Cases ***
Verify User Can Modify Blood Pressure Target
    [Documentation]    Blood Pressure Target Can Be Successfully Modified And Displayed