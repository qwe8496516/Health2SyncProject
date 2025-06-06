*** Settings ***
Resource         ../../resources/keywords/dashboard_information_keywords.robot
Resource         ../../resources/keywords/add_user_health_data_keywords.robot
Resource         ../../resources/keywords/diary_page_keywords.robot
Resource         ./dashboard_variable.robot

Test Setup    Launch Application
Test Teardown    Shutdown Application

*** Test Cases ***
Verify User Can Modify Glucose Target WithIn Normal Range (Partition 1)
    [Documentation]    Glucose Target Can Be Successfully Modified And Displayed
    [Setup]    Create Glucose Diary    ${GLUCOSE_DIARY}[glucose]    ${GLUCOSE_DIARY}[time]    ${GLUCOSE_DIARY}[period]
    Click Dashboard Menu
    Click Glucose Dashboard Section
    Click Dashboard Menu Setting Button
    Click Blood Glucose Set Goals Option
    Enter Before Meal Values    ${BLOOD_GLUCOSE_GOAL_NORMAL}[low]    ${BLOOD_GLUCOSE_GOAL_NORMAL}[high]
    Enter After Meal Values    ${BLOOD_GLUCOSE_GOAL_NORMAL}[low]    ${BLOOD_GLUCOSE_GOAL_NORMAL}[high]
    Enter Bedtime Values    ${BLOOD_GLUCOSE_GOAL_NORMAL}[low]    ${BLOOD_GLUCOSE_GOAL_NORMAL}[high]
    Click Confirm Button
    Click Back Image Button
    Verify Glucose Values Is Correct    ${GLUCOSE_DIARY}[glucose]    ${GLUCOSE_DIARY}[glucose]    ${GLUCOSE_DIARY}[glucose]
    Verify Distribution Is Correct    ${BLOOD_GLUCOSE_NORMAL_GOOD_DISTRIBUTION}[good]    ${BLOOD_GLUCOSE_NORMAL_GOOD_DISTRIBUTION}[high]    ${BLOOD_GLUCOSE_NORMAL_GOOD_DISTRIBUTION}[low]    ${BLOOD_GLUCOSE_NORMAL_GOOD_DISTRIBUTION}[total]
    [Teardown]    Run Keywords    Click Back Image Button
    ...                    AND    Click Diary Menu
    ...                    AND    Delete Diary

Verify User Can Modify Glucose Target WithIn High Range (Partition 1)
    [Documentation]    Glucose Target Can Be Successfully Modified And Displayed With High
    [Setup]    Create Glucose Diary    ${GLUCOSE_DIARY}[glucose]    ${GLUCOSE_DIARY}[time]    ${GLUCOSE_DIARY}[period]
    Click Dashboard Menu
    Click Glucose Dashboard Section
    Click Dashboard Menu Setting Button
    Click Blood Glucose Set Goals Option
    Enter Before Meal Values    ${BLOOD_GLUCOSE_GOAL_HIGH}[low]    ${BLOOD_GLUCOSE_GOAL_HIGH}[high]
    Enter After Meal Values    ${BLOOD_GLUCOSE_GOAL_HIGH}[low]    ${BLOOD_GLUCOSE_GOAL_HIGH}[high]
    Enter Bedtime Values    ${BLOOD_GLUCOSE_GOAL_HIGH}[low]    ${BLOOD_GLUCOSE_GOAL_HIGH}[high]
    Click Confirm Button
    Click Back Image Button
    Verify Glucose Values Is Correct    ${GLUCOSE_DIARY}[glucose]    ${GLUCOSE_DIARY}[glucose]    ${GLUCOSE_DIARY}[glucose]
    Verify Distribution Is Correct    ${BLOOD_GLUCOSE_NORMAL_HIGH_DISTRIBUTION}[good]    ${BLOOD_GLUCOSE_NORMAL_HIGH_DISTRIBUTION}[high]    ${BLOOD_GLUCOSE_NORMAL_HIGH_DISTRIBUTION}[low]    ${BLOOD_GLUCOSE_NORMAL_HIGH_DISTRIBUTION}[total]
    [Teardown]    Run Keywords    Click Back Image Button
    ...                    AND    Click Diary Menu
    ...                    AND    Delete Diary

Verify User Can Modify Glucose Target WithIn Low Range (Partition 1)
    [Documentation]    Glucose Target Can Be Successfully Modified And Displayed With Low
    [Setup]    Create Glucose Diary    ${GLUCOSE_DIARY}[glucose]    ${GLUCOSE_DIARY}[time]    ${GLUCOSE_DIARY}[period]
    Click Dashboard Menu
    Click Glucose Dashboard Section
    Click Dashboard Menu Setting Button
    Click Blood Glucose Set Goals Option
    Enter Before Meal Values    ${BLOOD_GLUCOSE_GOAL_LOW}[low]    ${BLOOD_GLUCOSE_GOAL_LOW}[high]
    Enter After Meal Values    ${BLOOD_GLUCOSE_GOAL_LOW}[low]    ${BLOOD_GLUCOSE_GOAL_LOW}[high]
    Enter Bedtime Values    ${BLOOD_GLUCOSE_GOAL_LOW}[low]    ${BLOOD_GLUCOSE_GOAL_LOW}[high]
    Click Confirm Button
    Click Back Image Button
    Verify Glucose Values Is Correct    ${GLUCOSE_DIARY}[glucose]    ${GLUCOSE_DIARY}[glucose]    ${GLUCOSE_DIARY}[glucose]
    Verify Distribution Is Correct    ${BLOOD_GLUCOSE_NORMAL_LOW_DISTRIBUTION}[good]    ${BLOOD_GLUCOSE_NORMAL_LOW_DISTRIBUTION}[high]    ${BLOOD_GLUCOSE_NORMAL_LOW_DISTRIBUTION}[low]    ${BLOOD_GLUCOSE_NORMAL_LOW_DISTRIBUTION}[total]
    [Teardown]    Run Keywords    Click Back Image Button
    ...                    AND    Click Diary Menu
    ...                    AND    Delete Diary

Verify User Can Modify Glucose Target With Invalid Range Low Equal To High (Partition 2)
    [Documentation]    Glucose Target Can Not Be Successfully Modified And Displayed 
    Click Dashboard Menu
    Click Glucose Dashboard Section
    Click Dashboard Menu Setting Button
    Click Blood Glucose Set Goals Option
    Enter Before Meal Values    ${BLOOD_GLUCOSE_GOAL_LOW_EQUAL_TO_HIGH}[low]    ${BLOOD_GLUCOSE_GOAL_LOW_EQUAL_TO_HIGH}[high]
    Verify Warning Message High End Should Be Higher Than The Low End
    Click Dialog OK Button
    Enter After Meal Values    ${BLOOD_GLUCOSE_GOAL_LOW_EQUAL_TO_HIGH}[low]    ${BLOOD_GLUCOSE_GOAL_LOW_EQUAL_TO_HIGH}[high]
    Verify Warning Message High End Should Be Higher Than The Low End
    Click Dialog OK Button
    Enter Bedtime Values    ${BLOOD_GLUCOSE_GOAL_LOW_EQUAL_TO_HIGH}[low]    ${BLOOD_GLUCOSE_GOAL_LOW_EQUAL_TO_HIGH}[high]
    Verify Warning Message High End Should Be Higher Than The Low End
    Click Dialog OK Button
    Click Confirm Button

Verify User Can Modify Glucose Target With Invalid Range Low Higher Than High (Partition 3)
    [Documentation]    Glucose Target Can Not Be Successfully Modified And Displayed 
    Click Dashboard Menu
    Click Glucose Dashboard Section
    Click Dashboard Menu Setting Button
    Click Blood Glucose Set Goals Option
    Enter Before Meal Values    ${BLOOD_GLUCOSE_GOAL_LOW_HIGHER_THAN_HIGH}[low]    ${BLOOD_GLUCOSE_GOAL_LOW_HIGHER_THAN_HIGH}[high]
    Verify Warning Message High End Should Be Higher Than The Low End
    Click Dialog OK Button
    Enter After Meal Values    ${BLOOD_GLUCOSE_GOAL_LOW_HIGHER_THAN_HIGH}[low]    ${BLOOD_GLUCOSE_GOAL_LOW_HIGHER_THAN_HIGH}[high]
    Verify Warning Message High End Should Be Higher Than The Low End
    Click Dialog OK Button
    Enter Bedtime Values    ${BLOOD_GLUCOSE_GOAL_LOW_HIGHER_THAN_HIGH}[low]    ${BLOOD_GLUCOSE_GOAL_LOW_HIGHER_THAN_HIGH}[high]
    Verify Warning Message High End Should Be Higher Than The Low End
    Click Dialog OK Button
    Click Confirm Button