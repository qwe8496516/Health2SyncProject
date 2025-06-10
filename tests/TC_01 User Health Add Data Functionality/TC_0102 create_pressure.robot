*** Settings ***
Resource         ../../resources/keywords/add_user_health_data_keywords.robot

Suite Setup      Launch Application
Suite Teardown   Shutdown Application

*** Variables ***
${PRESSURE_MAX}    500
${PRESSURE_MIN}    1
${HEART_RATE_MAX}  500
${HEART_RATE_MIN}  1
${PERIODS}       Wake-up    Before Breakfast  After Breakfast    Before Lunch   After lauch     Before Dinner   After Dinner    Before Snack    After Snack     Before Exercise    After exercise    Bedtime   Midnight   Other
${TIMES}         now    past

*** Test Cases ***
Verify Pressure Entry With Different Times
    FOR    ${time}    IN    ${TIMES}
        Create Pressure Diary    120    80    100    ${time}    Wake-up
        Verify Pressure Is Correct    120    80    100
        Delete Diary
    END

Verify Pressure Entry With Different Periods
    FOR    ${period}    IN    ${PERIODS}
        Create Pressure Diary    120    80    100    now    ${period}
        Verify Pressure Is Correct    120    80    100
        Delete Diary
    END

# 測試收縮壓和舒張壓的邊界條件
Verify Pressure Entry With Pressure Boundary Values
    Create Pressure Diary    ${PRESSURE_MIN}    ${PRESSURE_MIN}    ${HEART_RATE_MIN}    now    Wake-up
    Verify Pressure Is Correct    ${PRESSURE_MIN}    ${PRESSURE_MIN}    ${HEART_RATE_MIN}
    Delete Diary

    Create Pressure Diary    ${PRESSURE_MAX}    ${PRESSURE_MAX}    ${HEART_RATE_MAX}    now    Wake-up
    Verify Pressure Is Correct    ${PRESSURE_MAX}    ${PRESSURE_MAX}    ${HEART_RATE_MAX}
    Delete Diary

Verify New Pressure Entry With Valid Values And Relation
    Create Pressure Diary    120     80      100      past    After Snack
    Verify Pressure Is Correct    120     80      100
    Delete Diary 


Verify Pressure Entry With Invalid Pressure Relation
    Create Pressure Diary    80    120    100    now    Wake-up
    Verify Alert Showing    Systolic should be higher than diastolic.



Verify Pressure Entry With Boundary Heart Rate
    Create Pressure Diary    120    80    ${HEART_RATE_MIN}    now    Wake-up
    Verify Pressure Is Correct    120    80    ${HEART_RATE_MIN}
    Delete Diary

    Create Pressure Diary    130    90    ${HEART_RATE_MAX}    past    After Dinner
    Verify Pressure Is Correct    130    90    ${HEART_RATE_MAX}
    Delete Diary

