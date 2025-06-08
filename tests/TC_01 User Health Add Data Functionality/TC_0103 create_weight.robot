*** Settings ***
Resource         ../../resources/keywords/add_user_health_data_keywords.robot

Suite Setup      Launch Application
Suite Teardown   Shutdown Application

*** Variables ***
${WEIGHT_MAX}    500
${WEIGHT_MIN}    1
${BODY_FAT_MAX}  99
${BODY_FAT_MIN}  1

*** Test Cases ***
# Verify New Weight Entry Can Be Successfully Added To The Diary Page
#     [Documentation]    Weight Entry Can Be Successfully Added To The Diary Page
#     [Setup]    Create Weight Diary    60      20      past    After Snack
#     Verify Weight Is Correct    60      20 
#     [Teardown]    Delete Diary 

# 測試體重和體脂的邊界條件
Verify Weight Entry With Minimum Values
    [Documentation]    Verify that weight entry with minimum values (1 for weight, 1 for body fat) is successfully added.
    [Setup]    Create Weight Diary    ${WEIGHT_MIN}    ${BODY_FAT_MIN}    now    Wake-up
    Verify Weight Is Correct    ${WEIGHT_MIN}    ${BODY_FAT_MIN}
    [Teardown]    Delete Diary

Verify Weight Entry With Maximum Values
    [Documentation]    Verify that weight entry with maximum values (500 for weight, 99 for body fat) is successfully added.
    [Setup]    Create Weight Diary    ${WEIGHT_MAX}    ${BODY_FAT_MAX}    past    After Dinner
    Verify Weight Is Correct    ${WEIGHT_MAX}    ${BODY_FAT_MAX}
    [Teardown]    Delete Diary

# 測試不同時間參數的組合
Verify Weight Entry With Now And Bedtime
    [Documentation]    Verify that weight entry with "now" and "Bedtime" is successfully added.
    [Setup]    Create Weight Diary    70    25    now    Bedtime
    Verify Weight Is Correct    70    25
    [Teardown]    Delete Diary

Verify Weight Entry With Past And Midnight
    [Documentation]    Verify that weight entry with "past" and "Midnight" is successfully added.
    [Setup]    Create Weight Diary    75    30    past    Midnight
    Verify Weight Is Correct    75    30
    [Teardown]    Delete Diary

# 測試不同時間段的組合
Verify Weight Entry With Before Lunch
    [Documentation]    Verify that weight entry with "Before Lunch" is successfully added.
    [Setup]    Create Weight Diary    80    35    past    Before Lunch
    Verify Weight Is Correct    80    35
    [Teardown]    Delete Diary

Verify Weight Entry With After Snack
    [Documentation]    Verify that weight entry with "After Snack" is successfully added.
    [Setup]    Create Weight Diary    65    20    now    After Snack
    Verify Weight Is Correct    65    20
    [Teardown]    Delete Diary

# 測試體脂的邊界條件
Verify Weight Entry With Minimum Body Fat
    [Documentation]    Verify that weight entry with the minimum body fat (1) is successfully added.
    [Setup]    Create Weight Diary    90    ${BODY_FAT_MIN}    now    Wake-up
    Verify Weight Is Correct    90    ${BODY_FAT_MIN}
    [Teardown]    Delete Diary

Verify Weight Entry With Maximum Body Fat
    [Documentation]    Verify that weight entry with the maximum body fat (99) is successfully added.
    [Setup]    Create Weight Diary    95    ${BODY_FAT_MAX}    past    After Dinner
    Verify Weight Is Correct    95    ${BODY_FAT_MAX}
    [Teardown]    Delete Diary

# 測試異常情況
Verify Weight Entry With Invalid Low Values
    [Documentation]    Verify that weight entry with invalid low values (e.g., 0 for weight, 0 for body fat) is rejected.
    [Setup]    Create Weight Diary    0    0    now    Wake-up
    Click Cancel Button
    Verify Weight Diary Is Not Present    0    0


Verify Weight Entry With Invalid High Values
    [Documentation]    Verify that weight entry with invalid high values (e.g., 501 for weight, 100 for body fat) is rejected.
    [Setup]    Create Weight Diary    501    100    past    After Dinner
    Click Cancel Button
    Verify Weight Diary Is Not Present    501    100

