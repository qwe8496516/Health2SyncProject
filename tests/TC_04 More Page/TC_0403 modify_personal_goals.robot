*** Settings ***
Resource         ../../resources/keywords/more_page_keywords.robot

Suite Setup    Run Keywords    Launch Application
...                     AND    On More Page
Suite Teardown    Shutdown Application

*** Test Cases ***
Verify Personal Goals Can Be Modified
    [Documentation]    Verify Personal Goals Can Be Modified
    ...                Because there are many goals, we will only modiify 2 fields to verify this test case
    Click "Goals" Option
    Scroll To Bottom Of Page
    Modify Daily Steps    50
    Modify Weekly Exercise Time    25
    Click "Confirm" Button
    Verify Daily Steps Goal Is Changed    50
    Verify Weekly Exercise Time Goal Is Changed    25
    [Teardown]    Change Daily Steps And Weekly Exercise Time To Original Value