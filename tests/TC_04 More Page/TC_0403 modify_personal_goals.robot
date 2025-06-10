*** Settings ***
Resource         ../../resources/keywords/more_page_keywords.robot
Resource         ./more_page_variable.robot

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
    Click "Goals" Option
    Scroll To Bottom Of Page
    Verify Daily Steps Goal Is Changed    50
    Verify Weekly Exercise Time Goal Is Changed    25
    [Teardown]    Change Daily Steps And Weekly Exercise Time To Original Value

Verify User Can Modify Glucose Goals Within Normal Range
    [Documentation]    Glucose Goals Can Be Successfully Modified And Displayed (Partition 1)
    Click "Goals" Option
    Enter Before Meal Values    ${BLOOD_GLUCOSE_GOAL_NORMAL}[low]    ${BLOOD_GLUCOSE_GOAL_NORMAL}[high]
    Enter After Meal Values    ${BLOOD_GLUCOSE_GOAL_NORMAL}[low]    ${BLOOD_GLUCOSE_GOAL_NORMAL}[high]
    Enter Bedtime Values    ${BLOOD_GLUCOSE_GOAL_NORMAL}[low]    ${BLOOD_GLUCOSE_GOAL_NORMAL}[high]
    Click "Confirm" Button
    Click "Goals" Option
    Verify Before Meal Goal Is Changed    ${BLOOD_GLUCOSE_GOAL_NORMAL}[low]    ${BLOOD_GLUCOSE_GOAL_NORMAL}[high]
    Verify After Meal Goal Is Changed    ${BLOOD_GLUCOSE_GOAL_NORMAL}[low]    ${BLOOD_GLUCOSE_GOAL_NORMAL}[high]
    Verify Bedtime Goal Is Changed    ${BLOOD_GLUCOSE_GOAL_NORMAL}[low]    ${BLOOD_GLUCOSE_GOAL_NORMAL}[high]
    [Teardown]    Click "Confirm" Button

Verify User Can Modify Glucose Goals Within High Range
    [Documentation]    Glucose Goals Can Be Successfully Modified And Displayed With High (Partition 1)
    Click "Goals" Option
    Enter Before Meal Values    ${BLOOD_GLUCOSE_GOAL_HIGH}[low]    ${BLOOD_GLUCOSE_GOAL_HIGH}[high]
    Enter After Meal Values    ${BLOOD_GLUCOSE_GOAL_HIGH}[low]    ${BLOOD_GLUCOSE_GOAL_HIGH}[high]
    Enter Bedtime Values    ${BLOOD_GLUCOSE_GOAL_HIGH}[low]    ${BLOOD_GLUCOSE_GOAL_HIGH}[high]
    Click "Confirm" Button
    Click "Goals" Option
    Verify Before Meal Goal Is Changed    ${BLOOD_GLUCOSE_GOAL_HIGH}[low]    ${BLOOD_GLUCOSE_GOAL_HIGH}[high]
    Verify After Meal Goal Is Changed    ${BLOOD_GLUCOSE_GOAL_HIGH}[low]    ${BLOOD_GLUCOSE_GOAL_HIGH}[high]
    Verify Bedtime Goal Is Changed    ${BLOOD_GLUCOSE_GOAL_HIGH}[low]    ${BLOOD_GLUCOSE_GOAL_HIGH}[high]
    [Teardown]    Click "Confirm" Button

Verify User Can Modify Glucose Goals WithIn Low Range
    [Documentation]    Glucose Goals Can Be Successfully Modified And Displayed With Low (Partition 1)
    Click "Goals" Option
    Enter Before Meal Values    ${BLOOD_GLUCOSE_GOAL_LOW}[low]    ${BLOOD_GLUCOSE_GOAL_LOW}[high]
    Enter After Meal Values    ${BLOOD_GLUCOSE_GOAL_LOW}[low]    ${BLOOD_GLUCOSE_GOAL_LOW}[high]
    Enter Bedtime Values    ${BLOOD_GLUCOSE_GOAL_LOW}[low]    ${BLOOD_GLUCOSE_GOAL_LOW}[high]
    Click "Confirm" Button
    Click "Goals" Option
    Verify Before Meal Goal Is Changed    ${BLOOD_GLUCOSE_GOAL_LOW}[low]    ${BLOOD_GLUCOSE_GOAL_LOW}[high]
    Verify After Meal Goal Is Changed    ${BLOOD_GLUCOSE_GOAL_LOW}[low]    ${BLOOD_GLUCOSE_GOAL_LOW}[high]
    Verify Bedtime Goal Is Changed    ${BLOOD_GLUCOSE_GOAL_LOW}[low]    ${BLOOD_GLUCOSE_GOAL_LOW}[high]
    [Teardown]    Click "Confirm" Button

Verify User Can Modify Glucose Target With Invalid Range Low Equal To High 
    [Documentation]    Glucose Target Can Not Be Successfully Modified And Displayed (Partition 2)
    Click "Goals" Option
    Enter Before Meal Values    ${BLOOD_GLUCOSE_GOAL_LOW_EQUAL_TO_HIGH}[low]    ${BLOOD_GLUCOSE_GOAL_LOW_EQUAL_TO_HIGH}[high]
    Verify Warning Message High End Should Be Higher Than The Low End
    Click Dialog OK Button
    Enter After Meal Values    ${BLOOD_GLUCOSE_GOAL_LOW_EQUAL_TO_HIGH}[low]    ${BLOOD_GLUCOSE_GOAL_LOW_EQUAL_TO_HIGH}[high]
    Verify Warning Message High End Should Be Higher Than The Low End
    Click Dialog OK Button
    Enter Bedtime Values    ${BLOOD_GLUCOSE_GOAL_LOW_EQUAL_TO_HIGH}[low]    ${BLOOD_GLUCOSE_GOAL_LOW_EQUAL_TO_HIGH}[high]
    Verify Warning Message High End Should Be Higher Than The Low End
    Click Dialog OK Button
    [Teardown]    Click "Confirm" Button

Verify User Can Modify Glucose Target With Invalid Range Low Higher Than High 
    [Documentation]    Glucose Target Can Not Be Successfully Modified And Displayed (Partition 3)
    Click "Goals" Option
    Enter Before Meal Values    ${BLOOD_GLUCOSE_GOAL_LOW_HIGHER_THAN_HIGH}[low]    ${BLOOD_GLUCOSE_GOAL_LOW_HIGHER_THAN_HIGH}[high]
    Verify Warning Message High End Should Be Higher Than The Low End
    Click Dialog OK Button
    Enter After Meal Values    ${BLOOD_GLUCOSE_GOAL_LOW_HIGHER_THAN_HIGH}[low]    ${BLOOD_GLUCOSE_GOAL_LOW_HIGHER_THAN_HIGH}[high]
    Verify Warning Message High End Should Be Higher Than The Low End
    Click Dialog OK Button
    Enter Bedtime Values    ${BLOOD_GLUCOSE_GOAL_LOW_HIGHER_THAN_HIGH}[low]    ${BLOOD_GLUCOSE_GOAL_LOW_HIGHER_THAN_HIGH}[high]
    Verify Warning Message High End Should Be Higher Than The Low End
    Click Dialog OK Button
    [Teardown]    Click "Confirm" Button