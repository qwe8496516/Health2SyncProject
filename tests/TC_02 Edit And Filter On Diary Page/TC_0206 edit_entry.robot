*** Settings ***
Resource    ../../resources/keywords/add_user_health_data_keywords.robot
Resource    ../../resources/keywords/diary_page_keywords.robot
Suite Setup    Launch Application
Suite Teardown    Shutdown Application
*** Test Cases ***
Edit Glucose Diary Entry
    [Documentation]    Edit an existing glucose diary entry and verify the changes.
    [Setup]    Create Glucose Diary  100  past  Before Lunch
    Click Diary Menu
    Click Table View
    Verify Glucose Show On Table View  100  Lunch
    Click List View
    Edit Glucose Diary Entry  50
    Verify Glucose Diary Is Correct  50
    [Teardown]    Delete Diary

Edit Pressure Diary Entry
    [Documentation]    Edit an existing pressure diary entry and verify the changes.
    [Setup]    Create Pressure Diary    1    1    1    now    Wake-up
    Edit Pressure Diary    500    500    500
    Verify Pressure Is Correct    500    500    500
    [Teardown]    Delete Diary

Edit Weight Diary Entry
    [Documentation]    Edit an existing weight diary entry and verify the changes.
    [Setup]    Create Weight Diary    1    1    now    Wake-up
    Edit Weight Diary    500    99
    Verify Weight Is Correct    500    99
    [Teardown]    Delete Diary

Edit Medication Diary Entry
    [Documentation]    Edit an existing medication diary entry and verify the changes.
    [Setup]    Create Insulin/GLP-1 Medication Diary    Admelog    0    0    now    Wake-up
    Edit Medication Diary  999    999
    Verify Insulin/GLP-1 Medication Is Correct    Admelog    999    999
    [Teardown]    Delete Diary

Edit Diet Diary Entry
    [Documentation]    Edit an existing diet diary entry and verify the changes.
    ${entry}=    Create Dictionary    category=Bread    serv=0.1
    ${entries}=    Create List    ${entry}
    Create Diet Diary    ${entries}    current    Before Breakfast
    ${editEntry}=    Create Dictionary    category=Bread    serv=19.9
    ${editEntries}=    Create List    ${editEntry}
    Edit Diet Diary    ${editEntries}
    Verify Diet Is Correct    ${editEntries}
    [Teardown]    Delete Diary

Edit Exercise Diary Entry
    [Documentation]    Edit an existing exercise diary entry and verify the changes.
    ${entry}=    Create Dictionary    type=Stretching    hour=0    minute=5
    ${entries}=    Create List    ${entry}
    Create Exercise Diary    ${entries}    current    Before Breakfast
    ${editEntry}=    Create Dictionary    type=Stretching    hour=9    minute=55
    ${editEntries}=    Create List    ${editEntry}
    Edit Exercise Diary  ${editEntries}
    Verify Exercise Is Correct  ${editEntries}
    [Teardown]    Delete Diary