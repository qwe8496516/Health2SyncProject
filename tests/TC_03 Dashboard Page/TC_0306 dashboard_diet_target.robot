*** Settings ***
Resource    ../../resources/keywords/dashboard_information_keywords.robot
Resource    ./dashboard_variable.robot

Suite Setup    Launch Application
Suite Teardown    Shutdown Application

*** Test Cases ***
Verify User Can Modify Diet Target Minimum Value
    Click Dashboard Menu
    Click Diet Dashboard
    Change Daily Diet Target    1
    Verify Diet Target Is Modified
    [Teardown]    Reset Daily Diet Target

Verify User Can Modify Diet Target Normal Value
    Click Dashboard Menu
    Click Diet Dashboard
    Change Daily Diet Target    2500
    Verify Diet Target Is Modified
    [Teardown]    Reset Daily Diet Target

Verify User Can Modify Diet Target Max Value
    Click Dashboard Menu
    Click Diet Dashboard
    Change Daily Diet Target    9999
    Verify Diet Target Is Modified
    [Teardown]    Reset Daily Diet Target