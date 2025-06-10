*** Settings ***
Resource    ../../resources/keywords/add_user_health_data_keywords.robot
Resource    ../../resources/keywords/diary_page_keywords.robot
Suite Setup    Launch Application
Suite Teardown    Shutdown Application
*** Test Cases ***
Cancel Edit Glucose Diary Entry
    [Documentation]    Cancel editing an existing Glucose diary entry and verify the original value remains unchanged.
    [Setup]    Create Glucose Diary  100  past  Before Lunch
    Click Diary Menu
    Click Table View
    Verify Glucose Show On Table View  100  Lunch
    Click List View
    Cancel Edit Glucose Diary  50
    Click Table View
    Verify Glucose Show On Table View  100  Lunch
    Click List View
    [Teardown]    Delete Diary

Cancel Edit Pressure Diary Entry
    [Documentation]    Cancel editing an existing Pressure diary entry and verify the original values remain unchanged.
    [Setup]    Create Pressure Diary    1    1    1    now    Wake-up
    Click Diary Menu
    Verify Pressure Is Correct    1    1    1
    Cancel Edit Pressure Diary    500    500    500
    Verify Pressure Is Correct    1    1    1
    [Teardown]    Delete Diary

Cancel Edit Weight Diary Entry
    [Documentation]    Cancel editing an existing Weight diary entry and verify the original value remains unchanged.
    [Setup]    Create Weight Diary    1    1    past    Before Lunch
    Click Diary Menu
    Verify Weight Is Correct    1    1
    Cancel Edit Weight Diary    500    99
    Verify Weight Is Correct    1    1
    [Teardown]    Delete Diary