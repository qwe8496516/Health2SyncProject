*** Settings ***
Resource         ../../resources/keywords/dashboard_information_keywords.robot
Resource         ./dashboard_variable.robot

Test Setup    Launch Application
Test Teardown    Shutdown Application

*** Test Cases ***
Verify User Can Modify Steps Target With Minimum Value
    [Documentation]    Steps Target Can Be Successfully Modified And Displayed With Minimum Value
    Click Dashboard Menu
    Click Dashboard Section    ${STEPS_DASHBOARD}
    Change Daily Steps Target    ${EXERCISE_STEPS_MIN}
    Verify Steps Target Is Equal To Expected Value    ${EXERCISE_STEPS_MIN_RESULT}

Verify User Can Modify Steps Target With Normal Value
    [Documentation]    Steps Target Can Be Successfully Modified And Displayed With Normal Value
    Click Dashboard Menu
    Click Dashboard Section    ${STEPS_DASHBOARD}
    Change Daily Steps Target    ${EXERCISE_STEPS_NORMAL}
    Verify Steps Target Is Equal To Expected Value    ${EXERCISE_STEPS_NORMAL}

Verify User Can Modify Steps Target With Maximum Value
    [Documentation]    Steps Target Can Be Successfully Modified And Displayed With Maximum Value
    Click Dashboard Menu
    Click Dashboard Section    ${STEPS_DASHBOARD}
    Change Daily Steps Target    ${EXERCISE_STEPS_MAX}
    Verify Steps Target Is Equal To Expected Value    ${EXERCISE_STEPS_MAX}

# Verify User Can Modify Steps Target With Exceed Limit Value
#     [Documentation]    Steps Target Can Be Successfully Modified And Displayed With Exceed Limit Value
#     Click Dashboard Menu
#     Click Dashboard Section    ${STEPS_DASHBOARD}
#     Change Daily Steps Target    ${EXERCISE_STEPS_EXCEED_LIMIT}
#     Verify Steps Target Is Equal To Expected Value    ${EXERCISE_STEPS_EXCEED_LIMIT_RESULT}