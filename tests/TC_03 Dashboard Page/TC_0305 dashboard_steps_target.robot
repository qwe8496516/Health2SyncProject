*** Settings ***
Resource         ../../resources/keywords/dashboard_information_keywords.robot

Suite Setup    Launch Application
Suite Teardown    Shutdown Application

*** Test Cases ***
Verify User Can Modify Steps Target
    [Documentation]    Steps Target Can Be Successfully Modified And Displayed
    Click Dashboard Menu
    Click Dashboard Section    steps
    Change Daily Steps Target    10000
    Verify Steps Target Is Equal To Expected Value    10000