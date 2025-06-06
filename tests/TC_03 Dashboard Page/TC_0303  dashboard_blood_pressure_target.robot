*** Settings ***
Resource         ../../resources/keywords/dashboard_information_keywords.robot
Resource         ../../resources/keywords/add_user_health_data_keywords.robot
Resource         ../../resources/keywords/diary_page_keywords.robot
Resource         ./dashboard_variable.robot

Test Setup    Run Keywords    Launch Application
...                    AND    Create Pressure Diary    ${PRESSURE_DIARY}[systolic]    ${PRESSURE_DIARY}[diastolic]    ${PRESSURE_DIARY}[pulse]    ${PRESSURE_DIARY}[time]    ${PRESSURE_DIARY}[period]

Test Teardown    Run Keywords    Click Back Image Button
...                       AND    Click Diary Menu
...                       AND    Delete Diary
...                       AND    Click Diary Menu
...                       AND    Shutdown Application

*** Test Cases ***
Verify User Can Modify Blood Pressure Target WithIn Good Range
    [Documentation]    Blood Pressure Target Can Be Successfully Modified And Displayed With Good (Partition 1)
    Click Dashboard Menu
    Click Pressure Dashboard Section
    Click Dashboard Menu Setting Button
    Enter Systolic Values    ${SYSTOLIC_GOAL_NORMAL}[low]    ${SYSTOLIC_GOAL_NORMAL}[high]
    Enter Diastolic Values    ${DIASTOLIC_GOAL_NORMAL_GOOD}[low]    ${DIASTOLIC_GOAL_NORMAL_GOOD}[high]
    Enter Pulse Values    ${PULSE_GOAL_NORMAL}[low]    ${PULSE_GOAL_NORMAL}[high]
    Click Confirm Button
    Verify Pressure Systolic Values Is Correct    ${PRESSURE_DIARY}[systolic]    ${PRESSURE_DIARY}[systolic]    ${PRESSURE_DIARY}[systolic]
    Verify Pressure Diastolic Values Is Correct    ${PRESSURE_DIARY}[diastolic]    ${PRESSURE_DIARY}[diastolic]    ${PRESSURE_DIARY}[diastolic]
    Verify Distribution Is Correct    ${PRESSURE_NORMAL_GOOD_DISTRIBUTION}[good]    ${PRESSURE_NORMAL_GOOD_DISTRIBUTION}[high]    ${PRESSURE_NORMAL_GOOD_DISTRIBUTION}[low]    ${PRESSURE_NORMAL_GOOD_DISTRIBUTION}[total]
    Verify Pressure Pulse Values Is Correct    ${PRESSURE_DIARY}[pulse]    ${PRESSURE_DIARY}[pulse]    ${PRESSURE_DIARY}[pulse]

Verify User Can Modify Blood Pressure Target WithIn High Range
    [Documentation]    Blood Pressure Target Can Be Successfully Modified And Displayed With High (Partition 1)
    Click Dashboard Menu
    Click Pressure Dashboard Section
    Click Dashboard Menu Setting Button
    Enter Systolic Values    ${SYSTOLIC_GOAL_NORMAL}[low]    ${SYSTOLIC_GOAL_NORMAL}[high]
    Enter Diastolic Values    ${DIASTOLIC_GOAL_NORMAL_HIGH}[low]    ${DIASTOLIC_GOAL_NORMAL_HIGH}[high]
    Enter Pulse Values    ${PULSE_GOAL_NORMAL}[low]    ${PULSE_GOAL_NORMAL}[high]
    Click Confirm Button
    Verify Pressure Systolic Values Is Correct    ${PRESSURE_DIARY}[systolic]    ${PRESSURE_DIARY}[systolic]    ${PRESSURE_DIARY}[systolic]
    Verify Pressure Diastolic Values Is Correct    ${PRESSURE_DIARY}[diastolic]    ${PRESSURE_DIARY}[diastolic]    ${PRESSURE_DIARY}[diastolic]
    Verify Distribution Is Correct    ${PRESSURE_NORMAL_HIGH_DISTRIBUTION}[good]    ${PRESSURE_NORMAL_HIGH_DISTRIBUTION}[high]    ${PRESSURE_NORMAL_HIGH_DISTRIBUTION}[low]    ${PRESSURE_NORMAL_HIGH_DISTRIBUTION}[total]
    Verify Pressure Pulse Values Is Correct    ${PRESSURE_DIARY}[pulse]    ${PRESSURE_DIARY}[pulse]    ${PRESSURE_DIARY}[pulse]

Verify User Can Modify Blood Pressure Target WithIn Low Range
    [Documentation]    Blood Pressure Target Can Be Successfully Modified And Displayed With Low (Partition 1)
    Click Dashboard Menu
    Click Pressure Dashboard Section
    Click Dashboard Menu Setting Button
    Enter Systolic Values    ${SYSTOLIC_GOAL_NORMAL}[low]    ${SYSTOLIC_GOAL_NORMAL}[high]
    Enter Diastolic Values    ${DIASTOLIC_GOAL_NORMAL_LOW}[low]    ${DIASTOLIC_GOAL_NORMAL_LOW}[high]
    Enter Pulse Values    ${PULSE_GOAL_NORMAL}[low]    ${PULSE_GOAL_NORMAL}[high]
    Click Confirm Button
    Verify Pressure Systolic Values Is Correct    ${PRESSURE_DIARY}[systolic]    ${PRESSURE_DIARY}[systolic]    ${PRESSURE_DIARY}[systolic]
    Verify Pressure Diastolic Values Is Correct    ${PRESSURE_DIARY}[diastolic]    ${PRESSURE_DIARY}[diastolic]    ${PRESSURE_DIARY}[diastolic]
    Verify Distribution Is Correct    ${PRESSURE_NORMAL_LOW_DISTRIBUTION}[good]    ${PRESSURE_NORMAL_LOW_DISTRIBUTION}[high]    ${PRESSURE_NORMAL_LOW_DISTRIBUTION}[low]    ${PRESSURE_NORMAL_LOW_DISTRIBUTION}[total]
    Verify Pressure Pulse Values Is Correct    ${PRESSURE_DIARY}[pulse]    ${PRESSURE_DIARY}[pulse]    ${PRESSURE_DIARY}[pulse]

Verify User Can Not Modify Blood Pressure Target With Invalid Range Low Equal To High 
    [Documentation]    Blood Pressure Target Can Not Be Successfully Modified And Displayed (Partition 2)
    Click Dashboard Menu
    Click Dashboard Section    ${PRESSURE_DASHBOARD}
    Click Dashboard Menu Setting Button
    Enter Systolic Values    ${SYSTOLIC_GOAL_LOW_EQUAL_TO_HIGH}[low]    ${SYSTOLIC_GOAL_LOW_EQUAL_TO_HIGH}[high]
    Verify Warning Message High End Should Be Higher Than The Low End
    Click Dialog OK Button
    Enter Diastolic Values    ${DIASTOLIC_GOAL_LOW_EQUAL_TO_HIGH}[low]    ${DIASTOLIC_GOAL_LOW_EQUAL_TO_HIGH}[high]
    Verify Warning Message High End Should Be Higher Than The Low End
    Click Dialog OK Button
    Enter Pulse Values    ${PULSE_GOAL_LOW_EQUAL_TO_HIGH}[low]    ${PULSE_GOAL_LOW_EQUAL_TO_HIGH}[high]
    Verify Warning Message High End Should Be Higher Than The Low End
    Click Dialog OK Button
    Click Confirm Button

Verify User Can Not Modify Blood Pressure Target With Invalid Range Low Higher Than High 
    [Documentation]    Blood Pressure Target Can Not Be Successfully Modified And Displayed (Partition 3)
    Click Dashboard Menu
    Click Dashboard Section    ${PRESSURE_DASHBOARD}
    Click Dashboard Menu Setting Button
    Enter Systolic Values    ${SYSTOLIC_GOAL_LOW_HIGHER_THAN_HIGH}[low]    ${SYSTOLIC_GOAL_LOW_HIGHER_THAN_HIGH}[high]
    Verify Warning Message High End Should Be Higher Than The Low End
    Click Dialog OK Button
    Enter Diastolic Values    ${DIASTOLIC_GOAL_LOW_HIGHER_THAN_HIGH}[low]    ${DIASTOLIC_GOAL_LOW_HIGHER_THAN_HIGH}[high]
    Verify Warning Message High End Should Be Higher Than The Low End
    Click Dialog OK Button
    Enter Pulse Values    ${PULSE_GOAL_LOW_HIGHER_THAN_HIGH}[low]    ${PULSE_GOAL_LOW_HIGHER_THAN_HIGH}[high]
    Verify Warning Message High End Should Be Higher Than The Low End
    Click Dialog OK Button
    Click Confirm Button