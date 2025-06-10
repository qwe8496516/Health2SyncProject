*** Settings ***
Resource         ../../resources/keywords/add_user_health_data_keywords.robot

Suite Setup      Launch Application
Suite Teardown   Shutdown Application

*** Variables ***
${GLUCOSE_MAX}   900
${GLUCOSE_MIN}   1
${PERIODS}       Wake-up    Before Breakfast  After Breakfast    Before Lunch   After Lunch     Before Dinner   After Dinner    Before Snack    After Snack     Before Exercise    After Exercise    Bedtime   Midnight   Other
${TIMES}         now    past

*** Test Cases ***
Verify Glucose Entry With Different Times
    FOR    ${time}    IN    ${TIMES}
        Create Glucose Diary    50    ${time}    Wake-up
        Verify Glucose Diary Is Correct    50
        Delete Diary
    END

Verify Glucose Entry With Different Periods
    FOR    ${period}    IN    ${PERIODS}
        Create Glucose Diary    50    now    ${period}
        Verify Glucose Diary Is Correct    50
        Delete Diary
    END

Verify Glucose Entry With Boundary Values
    FOR    ${time}    IN    ${TIMES}
        Create Glucose Diary    ${GLUCOSE_MIN}    now    Wake-up
        Verify Glucose Diary Is Correct    ${GLUCOSE_MIN}
        Delete Diary

        Create Glucose Diary    ${GLUCOSE_MAX}    now    Wake-up
        Verify Glucose Diary Is Correct    ${GLUCOSE_MAX}
        Delete Diary
    END

Verify Glucose Entry With Normal Values
    Create Glucose Diary    50    now    Wake-up
    Verify Glucose Diary Is Correct    50
    Delete Diary


  
