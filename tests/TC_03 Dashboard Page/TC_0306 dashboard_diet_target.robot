*** Settings ***
Resource    ../../resources/keywords/dashboard_information_keywords.robot
Resource    ./dashboard_variable.robot

Suite Setup    Launch Application
Suite Teardown    Shutdown Application

*** Test Cases ***
Verify User Can Modify Diet Target
    Click Dashboard Menu
    Click Diet Dashboard
    Change Daily Diet Target    2000
    Verify Diet Target Is Modified
    [Teardown]    Reset Daily Diet Target