*** Settings ***
Resource         ../../resources/keywords/add_user_health_data_keywords.robot

Suite Setup    Launch Application
Suite Teardown    Shutdown Application



*** Test Cases ***
Verify New Insulin/GLP-1 Medication Entry Can Be Successfully Added To The Diary Page
    [Documentation]    Medication Entry Can Be Successfully Added To The Diary Page
    [Setup]    Create Insulin/GLP-1 Medication Diary    Soliqua® 100/50      20     10    current    Before Breakfast
    Verify Insulin/GLP-1 Medication Is Correct    Soliqua® 100/50      20     10 
    [Teardown]    Delete Diary


Verify New Oral Medication Entry Can Be Successfully Added To The Diary Page
    [Documentation]    Medication Entry Can Be Successfully Added To The Diary Page
    [Setup]    Create Oral Medication Diary    Ertugliflozin (Steglatro®) - 5 mg      3    current    Before Breakfast
    Verify Oral Medication Is Correct    Ertugliflozin (Steglatro®) - 5 mg       3
    [Teardown]    Delete Diary
    