*** Settings ***
Resource         ../../resources/keywords/dashboard_information_keywords.robot
Resource         ./dashboard_variable.robot

Test Setup    Launch Application
Test Teardown    Shutdown Application

*** Test Cases ***
Verify User Can Modify Exercise Target With Minimum Value
    [Documentation]    Exercise Target Can Be Successfully Modified And Displayed With Minimum Value
    Click Dashboard Menu
    Click Dashboard Section    ${EXERCISE_DASHBOARD}
    Change Weekly Exercise Time Target    ${EXERCISE_MIN_MIN}
    Verify Exercise Target Is Equal To Expected Value    ${EXERCISE_MIN_MIN_RESULT}

Verify User Can Modify Exercise Target With Normal Value
    [Documentation]    Exercise Target Can Be Successfully Modified And Displayed With Normal Value
    Click Dashboard Menu
    Click Dashboard Section    ${EXERCISE_DASHBOARD}
    Change Weekly Exercise Time Target    ${EXERCISE_MIN_NORMAL}
    Verify Exercise Target Is Equal To Expected Value    ${EXERCISE_MIN_NORMAL}

Verify User Can Modify Exercise Target With Maximum Value
    [Documentation]    Exercise Target Can Be Successfully Modified And Displayed With Maximum Value
    Click Dashboard Menu
    Click Dashboard Section    ${EXERCISE_DASHBOARD}
    Change Weekly Exercise Time Target    ${EXERCISE_MIN_MAX}
    Verify Exercise Target Is Equal To Expected Value    ${EXERCISE_MIN_MAX}

# Verify User Can Modify Exercise Target With Exceed Limit Value
#     [Documentation]    Exercise Target Can Be Successfully Modified And Displayed With Exceed Limit Value
#     Click Dashboard Menu
#     Click Dashboard Section    ${EXERCISE_DASHBOARD}
#     Change Weekly Exercise Time Target    ${EXERCISE_MIN_EXCEED_LIMIT}
#     Verify Exercise Target Is Equal To Expected Value    ${EXERCISE_MIN_EXCEED_LIMIT_RESULT}