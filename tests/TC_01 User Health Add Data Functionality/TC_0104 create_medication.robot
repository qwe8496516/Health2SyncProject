*** Settings ***
Resource         ../../resources/keywords/add_user_health_data_keywords.robot

Suite Setup    Launch Application
Suite Teardown    Shutdown Application

*** Variables ***
${CARBS_MAX}             999
${CARBS_MIN}             0
${UNITS_MAX}             999
${UNITS_MIN}             0
${TABLETS_MAX}           9
${TABLETS_MIN}           0
${PERIODS}       Wake-up    Before Breakfast  After Breakfast    Before Lunch   After Lunch     Before Dinner   After Dinner    Before Snack    After Snack     Before Exercise    After Exercise    Bedtime   Midnight   Other
${TIMES}         now    past

*** Test Cases ***
Verify Insulin/GLP-1 Medication Entry With Different Times
    FOR    ${time}    IN    ${TIMES}
        Create Insulin/GLP-1 Medication Diary    Actrapid    50    25    ${time}    Wake-up
        Verify Insulin/GLP-1 Medication Is Correct    Actrapid    50    25
        Delete Diary
    END

Verify Insulin/GLP-1 Medication Entry With Different Periods
    FOR    ${period}    IN    ${PERIODS}
        Create Insulin/GLP-1 Medication Diary    Actrapid    50    25    now    ${period}
        Verify Insulin/GLP-1 Medication Is Correct    Actrapid    50    25
        Delete Diary
    END

Verify Insulin/GLP-1 Medication Entry With Bundary Values
    Create Insulin/GLP-1 Medication Diary    Admelog    ${CARBS_MIN}    ${UNITS_MIN}    now    Wake-up
    Verify Insulin/GLP-1 Medication Is Correct    Admelog    ${CARBS_MIN}    ${UNITS_MIN}
    Delete Diary

    Create Insulin/GLP-1 Medication Diary    Humalog U-100    ${CARBS_MAX}    ${UNITS_MAX}    now    Wake-up
    Verify Insulin/GLP-1 Medication Is Correct    Humalog U-100    ${CARBS_MAX}    ${UNITS_MAX}
    Delete Diary


Verify Insulin/GLP-1 Medication Entry With different Medication Name
    Create Insulin/GLP-1 Medication Diary    NovoRapid® (NovoLog®)    50    25    now    Wake-up
    Verify Insulin/GLP-1 Medication Is Correct    NovoRapid® (NovoLog®)    50    25
    Delete Diary

    Create Insulin/GLP-1 Medication Diary    Actrapid    50    25    now    Wake-up
    Verify Insulin/GLP-1 Medication Is Correct    Actrapid    50    25
    Delete Diary

    Create Insulin/GLP-1 Medication Diary    Humulin N (Humulin NPH)    50    25    now    Wake-up
    Verify Insulin/GLP-1 Medication Is Correct    Humulin N (Humulin NPH)    50    25
    Delete Diary

    Create Insulin/GLP-1 Medication Diary    Lantus    50    25    now    Wake-up
    Verify Insulin/GLP-1 Medication Is Correct    Lantus    50    25
    Delete Diary

    Create Insulin/GLP-1 Medication Diary    Humulin 70/30 (Humulin 30/70)    50    25    now    Wake-up
    Verify Insulin/GLP-1 Medication Is Correct    Humulin 70/30 (Humulin 30/70)    50    25
    Delete Diary

    Create Insulin/GLP-1 Medication Diary    Soliqua® 100/33    50    25    now    Wake-up
    Verify Insulin/GLP-1 Medication Is Correct    Soliqua® 100/33    50    25
    Delete Diary



########################################################################################################################################################
Verify Oral Medication Entry With Different Times
    FOR    ${time}    IN    ${TIMES}
        Create Oral Medication Diary    Acarbose - 50 mg    5    ${time}    Wake-up
        Verify Oral Medication Is Correct    Acarbose - 50 mg    5
        Delete Diary
    END

Verify Oral Medication Entry With Different Periods
    FOR    ${period}    IN    ${PERIODS}
        Create Oral Medication Diary    Acarbose - 50 mg    5    now    ${period}
        Verify Oral Medication Is Correct    Acarbose - 50 mg    5
        Delete Diary
    END


Verify Oral Medication Entry With Boundary Values
    Create Oral Medication Diary    Acarbose - 50 mg    ${TABLETS_MIN}    now    Wake-up
    Verify Oral Medication Is Correct    Acarbose - 50 mg    ${TABLETS_MIN}
    Delete Diary

    Create Oral Medication Diary    Metformin - 1000 mg    ${TABLETS_MAX}    now    Wake-up
    Verify Oral Medication Is Correct    Metformin - 1000 mg    ${TABLETS_MAX}
    Delete Diary


Verify Oral Medication Entry With different Medication Name
    Create Oral Medication Diary    Sitagliptin / Metformin (Janumet®) - 50 mg/1000 mg    5    now    Wake-up
    Verify Oral Medication Is Correct    Sitagliptin / Metformin (Janumet®) - 50 mg/1000 mg    5
    Delete Diary

    Create Oral Medication Diary    Empagliflozin (Jardiance®) - 10 mg    5    now    Wake-up
    Verify Oral Medication Is Correct    Empagliflozin (Jardiance®) - 10 mg    5
    Delete Diary






    