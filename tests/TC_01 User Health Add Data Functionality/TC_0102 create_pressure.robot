*** Settings ***
Resource         ../../resources/keywords/add_user_health_data_keywords.robot

Suite Setup      Launch Application
Suite Teardown   Shutdown Application

*** Variables ***
${PRESSURE_MAX}    500
${PRESSURE_MIN}    1
${HEART_RATE_MAX}  500
${HEART_RATE_MIN}  1

*** Test Cases ***


# 測試收縮壓和舒張壓的邊界條件
Verify Pressure Entry With Minimum Values
    [Documentation]    Verify that pressure entry with minimum values (1 for systolic, 1 for diastolic, 1 for heart rate) is rejected.
    [Setup]    Create Pressure Diary    ${PRESSURE_MIN}    ${PRESSURE_MIN}    ${HEART_RATE_MIN}    now    Wake-up
    Verify Pressure Is Correct    ${PRESSURE_MIN}    ${PRESSURE_MIN}    ${HEART_RATE_MIN}
    [Teardown]    Delete Diary

Verify Pressure Entry With Maximum Values
    [Documentation]    Verify that pressure entry with maximum values (500 for systolic, 500 for diastolic, 500 for heart rate) is rejected.
    [Setup]    Create Pressure Diary    ${PRESSURE_MAX}    ${PRESSURE_MAX}    ${HEART_RATE_MAX}    past    After Dinner
    Verify Pressure Is Correct    ${PRESSURE_MAX}    ${PRESSURE_MAX}    ${HEART_RATE_MAX}
    [Teardown]    Delete Diary

Verify New Pressure Entry With Valid Pressure Relation
    [Documentation]    Pressure Entry Can Be Successfully Added To The Diary Page
    [Setup]    Create Pressure Diary    120     80      100      past    After Snack
    Verify Pressure Is Correct    120     80      100
    [Teardown]    Delete Diary 

# 測試收縮壓小於舒張壓的情況
Verify Pressure Entry With Invalid Pressure Relation
    [Documentation]    Verify that pressure entry with systolic < diastolic is rejected.
    [Setup]    Create Pressure Diary    80    120    100    now    After Breakfast
    Verify Alert Showing    Systolic should be higher than diastolic.

# 測試不同時間參數的組合
Verify Pressure Entry With Now And Bedtime
    [Documentation]    Verify that pressure entry with "now" and "Bedtime" is successfully added.
    [Setup]    Create Pressure Diary    120    80    100    now    Bedtime
    Verify Pressure Is Correct    120    80    100
    [Teardown]    Delete Diary 

Verify Pressure Entry With Past And Midnight
    [Documentation]    Verify that pressure entry with "past" and "Midnight" is successfully added.
    [Setup]    Create Pressure Diary    130    90    110    past    Midnight
    Verify Pressure Is Correct    130    90    110
    [Teardown]    Delete Diary

# 測試不同時間段的組合
Verify Pressure Entry With Before Lunch
    [Documentation]    Verify that pressure entry with "Before Lunch" is successfully added.
    [Setup]    Create Pressure Diary    140    85    95    past    Before Lunch
    Verify Pressure Is Correct    140    85    95
    [Teardown]    Delete Diary

Verify Pressure Entry With After Snack
    [Documentation]    Verify that pressure entry with "After Snack" is successfully added.
    [Setup]    Create Pressure Diary    125    75    80    now    After Snack
    Verify Pressure Is Correct    125    75    80
    [Teardown]    Delete Diary

# 測試心跳的邊界條件
Verify Pressure Entry With Minimum Heart Rate
    [Documentation]    Verify that pressure entry with the minimum heart rate (1) is successfully added.
    [Setup]    Create Pressure Diary    120    80    ${HEART_RATE_MIN}    now    Wake-up
    Verify Pressure Is Correct    120    80    ${HEART_RATE_MIN}
    [Teardown]    Delete Diary

Verify Pressure Entry With Maximum Heart Rate
    [Documentation]    Verify that pressure entry with the maximum heart rate (500) is successfully added.
    [Setup]    Create Pressure Diary    130    90    ${HEART_RATE_MAX}    past    After Dinner
    Verify Pressure Is Correct    130    90    ${HEART_RATE_MAX}
    [Teardown]    Delete Diary

# 測試異常情況
Verify Pressure Entry With Invalid Low Values
    [Documentation]    Verify that pressure entry with invalid low values (e.g., 0 for systolic, diastolic, and heart rate) is rejected.
    [Setup]    Create Pressure Diary    0    0    0    now    Wake-up
    Click Cancel Button
    Verify Pressure Diary Is Not Present    0    0    0

Verify Pressure Entry With Invalid High Values
    [Documentation]    Verify that pressure entry with invalid high values (e.g., 501 for systolic, diastolic, and heart rate) is rejected.
    [Setup]    Create Pressure Diary    501    501    501    past    After Dinner
    Click Cancel Button
    Verify Pressure Diary Is Not Present   501    501    501
