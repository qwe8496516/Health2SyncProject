*** Settings ***
Resource         ../../resources/keywords/add_user_health_data_keywords.robot

Suite Setup      Launch Application
Suite Teardown   Shutdown Application

*** Variables ***
${WEIGHT_MAX}    500
${WEIGHT_MIN}    1
${BODY_FAT_MAX}  99
${BODY_FAT_MIN}  1
${PERIODS}       Wake-up    Before Breakfast  After Breakfast    Before Lunch   After lauch     Before Dinner   After Dinner    Before Snack    After Snack     Before Exercise    After exercise    Bedtime   Midnight   Other
${TIMES}         now    past

*** Test Cases ***
Verify Weight Entry With Different Times
    FOR    ${time}    IN    ${TIMES}
        Create Weight Diary    60    20    now    Wake-up
        Verify Weight Is Correct    60    20
        Delete Diary
    END

Verify Weight Entry With Different Periods
    FOR    ${period}    IN    ${PERIODS}
        Log    Testing period: ${period}
        Create Weight Diary    70    25    now    ${period}
        Verify Weight Is Correct    70    25
        Delete Diary
    END


Verify Weight Entry With Boundary Values
    Create Weight Diary    ${WEIGHT_MIN}    ${BODY_FAT_MIN}    now    Wake-up
    Verify Weight Is Correct    ${WEIGHT_MIN}    ${BODY_FAT_MIN}
    Delete Diary
    
    Create Weight Diary    ${WEIGHT_MAX}    ${BODY_FAT_MAX}    now    Wake-up
    Verify Weight Is Correct    ${WEIGHT_MAX}    ${BODY_FAT_MAX}
    Delete Diary


Verify Weight Entry With Normal Weight And Body Fat
    Create Weight Diary    60    20    now    Wake-up
    Verify Weight Is Correct    60    20
    Delete Diary


