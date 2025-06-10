*** Settings ***
Resource         ../../resources/keywords/more_page_keywords.robot
Resource         ./more_page_variable.robot

Suite Setup    Run Keywords    Launch Application
...                     AND    On More Page

Suite Teardown    Shutdown Application

*** Test Cases ***
Verify Daily Routines Can Be Modified With Minimum Values
    [Documentation]    Daily Routines Can Be Successfully Modified And Displayed (Partition 1)
    Click "Daily Routine" Option
    Enter Wake Up Values    ${TIME_ROUTINE_MIN}[hour]    ${TIME_ROUTINE_MIN}[minute]
    Enter Breakfast Values    ${TIME_ROUTINE_MIN}[hour]    ${TIME_ROUTINE_MIN}[minute]
    Enter Lunch Values    ${TIME_ROUTINE_MIN}[hour]    ${TIME_ROUTINE_MIN}[minute]
    Enter Dinner Values    ${TIME_ROUTINE_MIN}[hour]    ${TIME_ROUTINE_MIN}[minute]
    Enter Bed Time Values In Routine    ${TIME_ROUTINE_MIN}[hour]    ${TIME_ROUTINE_MIN}[minute]
    Click "Done" Button
    Click "Daily Routine" Option
    Verify Wake Up Daily Routine Is Changed    ${DISPLAY_MINIMUM_TIME}
    Verify Breakfast Daily Routine Is Changed    ${DISPLAY_MINIMUM_TIME}
    Verify Lunch Daily Routine Is Changed    ${DISPLAY_MINIMUM_TIME}
    Verify Dinner Daily Routine Is Changed    ${DISPLAY_MINIMUM_TIME}
    Verify Bed Time Daily Routine Is Changed    ${DISPLAY_MINIMUM_TIME}
    [Teardown]    Click "Done" Button

Verify Daily Routines Can Be Modified With Middle Values
    [Documentation]    Daily Routines Can Be Successfully Modified And Displayed (Partition 1)
    Click "Daily Routine" Option
    Enter Wake Up Values    ${TIME_ROUTINE_MID}[hour]    ${TIME_ROUTINE_MID}[minute]
    Enter Breakfast Values    ${TIME_ROUTINE_MID}[hour]    ${TIME_ROUTINE_MID}[minute]
    Enter Lunch Values    ${TIME_ROUTINE_MID}[hour]    ${TIME_ROUTINE_MID}[minute]
    Enter Dinner Values    ${TIME_ROUTINE_MID}[hour]    ${TIME_ROUTINE_MID}[minute]
    Enter Bed Time Values In Routine    ${TIME_ROUTINE_MID}[hour]    ${TIME_ROUTINE_MID}[minute]
    Click "Done" Button
    Click "Daily Routine" Option
    Verify Wake Up Daily Routine Is Changed    ${DISPLAY_MIDDLE_TIME}
    Verify Breakfast Daily Routine Is Changed    ${DISPLAY_MIDDLE_TIME}
    Verify Lunch Daily Routine Is Changed    ${DISPLAY_MIDDLE_TIME}
    Verify Dinner Daily Routine Is Changed    ${DISPLAY_MIDDLE_TIME}
    Verify Bed Time Daily Routine Is Changed    ${DISPLAY_MIDDLE_TIME}
    [Teardown]    Click "Done" Button

Verify Daily Routines Can Not Be Modified With Invalid Combination Values
    [Documentation]    Daily Routines Can Not Be Successfully Modified And Displayed (Partition 2)
    Click "Daily Routine" Option
    Enter Breakfast Values    ${TIME_ROUTINE_MID+1HOUR}[hour]    ${TIME_ROUTINE_MID+1HOUR}[minute]
    Enter Lunch Values    ${TIME_ROUTINE_MID}[hour]    ${TIME_ROUTINE_MID}[minute]
    Enter Dinner Values    ${TIME_ROUTINE_MID}[hour]    ${TIME_ROUTINE_MID}[minute]
    Click "Done" Button
    Verify Warning Message Lunch Should Be Between Breakfast And Dinner
    Click Dialog Close Button
    Enter Lunch Values    ${TIME_ROUTINE_MID+1HOUR}[hour]    ${TIME_ROUTINE_MID+1HOUR}[minute]
    Enter Dinner Values    ${TIME_ROUTINE_MID}[hour]    ${TIME_ROUTINE_MID}[minute]
    Enter Bed Time Values In Routine  ${TIME_ROUTINE_MID}[hour]    ${TIME_ROUTINE_MID}[minute]
    Click "Done" Button
    Verify Warning Message Dinner Should Be Between Lunch And Bedtime
    Click Dialog Close Button
    [Teardown]    Click Arrow Back Button


Verify Daily Routines Can Be Modified With Maximum Values
    [Documentation]    Daily Routines Can Be Successfully Modified And Displayed (Partition 1)
    Click "Daily Routine" Option
    Enter Wake Up Values    ${TIME_ROUTINE_MAX}[hour]    ${TIME_ROUTINE_MAX}[minute]
    Enter Breakfast Values    ${TIME_ROUTINE_MAX}[hour]    ${TIME_ROUTINE_MAX}[minute]
    Enter Lunch Values    ${TIME_ROUTINE_MAX}[hour]    ${TIME_ROUTINE_MAX}[minute]
    Enter Dinner Values    ${TIME_ROUTINE_MAX}[hour]    ${TIME_ROUTINE_MAX}[minute]
    Enter Bed Time Values In Routine    ${TIME_ROUTINE_MAX}[hour]    ${TIME_ROUTINE_MAX}[minute]
    Click "Done" Button
    Click "Daily Routine" Option
    Verify Wake Up Daily Routine Is Changed    ${DISPLAY_MAXIMUM_TIME}
    Verify Breakfast Daily Routine Is Changed    ${DISPLAY_MAXIMUM_TIME}
    Verify Lunch Daily Routine Is Changed    ${DISPLAY_MAXIMUM_TIME}
    Verify Dinner Daily Routine Is Changed    ${DISPLAY_MAXIMUM_TIME}
    Verify Bed Time Daily Routine Is Changed    ${DISPLAY_MAXIMUM_TIME}
    [Teardown]    Click "Done" Button