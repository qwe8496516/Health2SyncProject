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

*** Test Cases ***
# 測試胰島素/GLP-1 的最小值
Verify Insulin/GLP-1 Entry With Minimum Values
    [Documentation]    Verify that Insulin/GLP-1 entry with minimum values (${CARBS_MIN} for carbs, ${UNITS_MIN} for units) is successfully added.
    [Setup]    Create Insulin/GLP-1 Medication Diary    Admelog    ${CARBS_MIN}    ${UNITS_MIN}    current    Before Breakfast
    Verify Insulin/GLP-1 Medication Is Correct    Admelog    ${CARBS_MIN}    ${UNITS_MIN}
    [Teardown]    Delete Diary

# 測試胰島素/GLP-1 的最大值
Verify Insulin/GLP-1 Entry With Maximum Values
    [Documentation]    Verify that Insulin/GLP-1 entry with maximum values (${CARBS_MAX} for carbs, ${UNITS_MAX} for units) is successfully added.
    [Setup]    Create Insulin/GLP-1 Medication Diary    Humalog U-100    ${CARBS_MAX}    ${UNITS_MAX}    past    After Dinner
    Verify Insulin/GLP-1 Medication Is Correct    Humalog U-100    ${CARBS_MAX}    ${UNITS_MAX}
    [Teardown]    Delete Diary

# 測試不同胰島素類型的組合
Verify Insulin/GLP-1 Entry With Rapid-Acting Insulin
    [Documentation]    Verify that Rapid-Acting Insulin entry is successfully added.
    [Setup]    Create Insulin/GLP-1 Medication Diary    NovoRapid® (NovoLog®)    50    25    current    Bedtime
    Verify Insulin/GLP-1 Medication Is Correct    NovoRapid® (NovoLog®)    50    25
    [Teardown]    Delete Diary

Verify Insulin/GLP-1 Entry With Short-Acting Insulin
    [Documentation]    Verify that Rapid-Acting Insulin entry is successfully added.
    [Setup]    Create Insulin/GLP-1 Medication Diary    Actrapid    50    25    current    Bedtime
    Verify Insulin/GLP-1 Medication Is Correct    Actrapid    50    25
    [Teardown]    Delete Diary

Verify Insulin/GLP-1 Entry With Intermediate-Acting Insulin
    [Documentation]    Verify that Rapid-Acting Insulin entry is successfully added.
    [Setup]    Create Insulin/GLP-1 Medication Diary    Humulin N (Humulin NPH)    50    25    current    Bedtime
    Verify Insulin/GLP-1 Medication Is Correct    Humulin N (Humulin NPH)    50    25
    [Teardown]    Delete Diary

Verify Insulin/GLP-1 Entry With Long-Acting Insulin
    [Documentation]    Verify that Long-Acting Insulin entry is successfully added.
    [Setup]    Create Insulin/GLP-1 Medication Diary    Lantus    200    50    past    Midnight
    Verify Insulin/GLP-1 Medication Is Correct    Lantus    200    50
    [Teardown]    Delete Diary

Verify Insulin/GLP-1 Entry With Pre-Mixed Insulin
    [Documentation]    Verify that Long-Acting Insulin entry is successfully added.
    [Setup]    Create Insulin/GLP-1 Medication Diary    Humulin 70/30 (Humulin 30/70)    200    50    past    Midnight
    Verify Insulin/GLP-1 Medication Is Correct    Humulin 70/30 (Humulin 30/70)    200    50
    [Teardown]    Delete Diary

# Verify Insulin/GLP-1 Entry With GLP-1 Insulin
#     [Documentation]    Verify that Long-Acting Insulin entry is successfully added.
#     [Setup]    Create Insulin/GLP-1 Medication Diary    Bydureon®    200    50    past    Midnight
#     Verify Insulin/GLP-1 Medication Is Correct    Bydureon®    200    50
#     [Teardown]    Delete Diary

Verify Insulin/GLP-1 Entry With Long-Acting/GLP-1 Combination Insulin
    [Documentation]    Verify that Long-Acting Insulin entry is successfully added.
    [Setup]    Create Insulin/GLP-1 Medication Diary    Soliqua® 100/33    200    50    past    Midnight
    Verify Insulin/GLP-1 Medication Is Correct    Soliqua® 100/33    200    50
    [Teardown]    Delete Diary

# 測試不合法的低值
Verify Insulin/GLP-1 Entry With Invalid Low Values
    [Documentation]    Verify that Insulin/GLP-1 entry with invalid low values (0 for carbs, 0 for units) is rejected.
    [Setup]        Create Insulin/GLP-1 Medication Diary    Toujeo    -1    -1   current    Before Breakfast
    Verify Insulin/GLP-1 Medication Diary Is Not Present    Toujeo    -1   -1
    [Teardown]    Delete Diary


# 測試不合法的高值
Verify Insulin/GLP-1 Entry With Invalid High Values
    [Documentation]    Verify that Insulin/GLP-1 entry with invalid high values (${CARBS_MAX + 1} for carbs, 1000 for units) is rejected.
    [Setup]      Create Insulin/GLP-1 Medication Diary    Tresiba®    1000    1000    past    After Dinner
    Verify Insulin/GLP-1 Medication Diary Is Not Present    Tresiba®    1000    1000
    [Teardown]    Delete Diary

# 測試不合法藥物名稱
Verify Insulin/GLP-1 Medication Entry With Invalid Medication
    [Documentation]    Verify that an oral medication entry with an invalid medication name (e.g., "abc") is not added to the diary.
    Run Keyword And Expect Error    *    Create Insulin/GLP-1 Medication Diary    abc    200    50    current    Before Breakfast
    Click Cancel Button
    Verify Insulin/GLP-1 Medication Diary Is Not Present    abc     200    50

########################################################################################################################################################
# 測試口服藥物的最小值
Verify Oral Medication Entry With Minimum Values
    [Documentation]    Verify that oral medication entry with minimum values (${TABLETS_MIN} tablet) is successfully added.
    [Setup]    Create Oral Medication Diary    Acarbose - 50 mg    ${TABLETS_MIN}    current    Before Breakfast
    Verify Oral Medication Is Correct    Acarbose - 50 mg    ${TABLETS_MIN}
    [Teardown]    Delete Diary



# 測試口服藥物的最大值
Verify Oral Medication Entry With Maximum Values
    [Documentation]    Verify that oral medication entry with maximum values (${TABLETS_MAX} tablets) is successfully added.
    [Setup]    Create Oral Medication Diary    Metformin - 1000 mg    ${TABLETS_MAX}    past    After Lunch
    Verify Oral Medication Is Correct    Metformin - 1000 mg    ${TABLETS_MAX}
    [Teardown]    Delete Diary

# 測試不同口服藥物類型的組合
Verify Oral Medication Entry With Combination Therapy
    [Documentation]    Verify that combination therapy entry is successfully added.
    [Setup]    Create Oral Medication Diary    Sitagliptin / Metformin (Janumet®) - 50 mg/1000 mg    3    current    Bedtime
    Verify Oral Medication Is Correct    Sitagliptin / Metformin (Janumet®) - 50 mg/1000 mg    3
    [Teardown]    Delete Diary

Verify Oral Medication Entry With SGLT2 Inhibitor
    [Documentation]    Verify that SGLT2 inhibitor entry is successfully added.
    [Setup]    Create Oral Medication Diary    Empagliflozin (Jardiance®) - 10 mg    2    past    Morning Snack
    Verify Oral Medication Is Correct    Empagliflozin (Jardiance®) - 10 mg    2
    [Teardown]    Delete Diary

# 測試不合法的低值
Verify Oral Medication Entry With Invalid Low Values
    [Documentation]    Verify that oral medication entry with invalid low values (0 tablets) is rejected.
    [Setup]    Create Oral Medication Diary    Glibenclamide - 1 mg    -1    current    Before Breakfast
    Verify Oral Medication Diary Is Not Present    Glibenclamide - 1 mg    -1
    [Teardown]    Delete Diary

# 測試不合法的高值
Verify Oral Medication Entry With Invalid High Values
    [Documentation]    Verify that oral medication entry with invalid high values (${TABLETS_MAX + 1} tablets) is rejected.
    [Setup]    Create Oral Medication Diary    Glibenclamide - 2 mg    1000    past    After Dinner
    Verify Oral Medication Diary Is Not Present    Glibenclamide - 2 mg    1000
    [Teardown]    Delete Diary

# 測試不合法藥物名稱
Verify Oral Medication Entry With Invalid Medication
    [Documentation]    Verify that an oral medication entry with an invalid medication name (e.g., "abc") is not added to the diary.
    Run Keyword And Expect Error    *    Create Oral Medication Diary    abc       50    current    Before Breakfast
    Click Cancel Button
    Verify Oral Medication Diary Is Not Present    abc       50


# *** Test Cases ***
# Verify New Insulin/GLP-1 Medication Entry Can Be Successfully Added To The Diary Page
#     [Documentation]    Medication Entry Can Be Successfully Added To The Diary Page
#     [Setup]    Create Insulin/GLP-1 Medication Diary    Soliqua® 100/50      20     10    current    Before Breakfast
#     Verify Insulin/GLP-1 Medication Is Correct    Soliqua® 100/50      20     10 
#     [Teardown]    Delete Diary


# Verify New Oral Medication Entry Can Be Successfully Added To The Diary Page
#     [Documentation]    Medication Entry Can Be Successfully Added To The Diary Page
#     [Setup]    Create Oral Medication Diary    Ertugliflozin (Steglatro®) - 5 mg      3    current    Before Breakfast
#     Verify Oral Medication Is Correct    Ertugliflozin (Steglatro®) - 5 mg       3
#     [Teardown]    Delete Diary
    