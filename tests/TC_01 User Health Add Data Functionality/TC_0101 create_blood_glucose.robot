*** Settings ***
Resource         ../../resources/keywords/add_user_health_data_keywords.robot

Suite Setup      Launch Application
Suite Teardown   Shutdown Application

*** Variables ***
${GLUCOSE_MAX}   900
${GLUCOSE_MIN}   1


*** Test Cases ***



# 測試血糖值的邊界條件
Verify Glucose Entry With Minimum Value
    [Documentation]    Verify that glucose entry with the minimum value (1) is successfully added.
    [Setup]    Create Glucose Diary    ${GLUCOSE_MIN}    now    Wake-up
    Verify Glucose Diary Is Correct    ${GLUCOSE_MIN}
    [Teardown]    Delete Diary

Verify Glucose Entry With Maximum Value
    [Documentation]    Verify that glucose entry with the maximum value (900) is successfully added.
    [Setup]    Create Glucose Diary    ${GLUCOSE_MAX}    past    After Dinner
    Verify Glucose Diary Is Correct    ${GLUCOSE_MAX}
    [Teardown]    Delete Diary

# 測試不同時間參數的組合
Verify Glucose Entry With Now And Breakfast
    [Documentation]    Verify that glucose entry with "now" and "After Breakfast" is successfully added.
    [Setup]    Create Glucose Diary    150    now    After Breakfast
    Verify Glucose Diary Is Correct    150
    [Teardown]    Delete Diary

Verify Glucose Entry With Past And Midnight
    [Documentation]    Verify that glucose entry with "past" and "Midnight" is successfully added.
    [Setup]    Create Glucose Diary    200    past    Midnight
    Verify Glucose Diary Is Correct    200
    [Teardown]    Delete Diary

# 測試不同時間段的組合
Verify Glucose Entry With Before Lunch
    [Documentation]    Verify that glucose entry with "Before Lunch" is successfully added.
    [Setup]    Create Glucose Diary    180    past    Before Lunch
    Verify Glucose Diary Is Correct    180
    [Teardown]    Delete Diary

Verify Glucose Entry With After Snack
    [Documentation]    Verify that glucose entry with "After Snack" is successfully added.
    [Setup]    Create Glucose Diary    110    now    After Snack
    Verify Glucose Diary Is Correct    110
    [Teardown]    Delete Diary

Verify Glucose Entry With Bedtime
    [Documentation]    Verify that glucose entry with "Bedtime" is successfully added.
    [Setup]    Create Glucose Diary    140    past    Bedtime
    Verify Glucose Diary Is Correct    140
    [Teardown]    Delete Diary

Verify Glucose Entry With Other Period
    [Documentation]    Verify that glucose entry with "Other" is successfully added.
    [Setup]    Create Glucose Diary    130    now    Other
    Verify Glucose Diary Is Correct    130
    [Teardown]    Delete Diary

# 測試異常情況
Verify Glucose Entry With Invalid Low Value
    [Documentation]    Verify that glucose entry with a value below the minimum (e.g., 0) is rejected.
    [Setup]    Create Glucose Diary    0    now    Wake-up
    Click Cancel Button
    Verify Glucose Diary Is Not Present    0

Verify Glucose Entry With Invalid High Value
    [Documentation]    Verify that glucose entry with a value above the maximum (e.g., 901) is rejected.
    [Setup]    Create Glucose Diary    901    past    After Dinner
    Click Cancel Button
    Verify Glucose Diary Is Not Present      901
