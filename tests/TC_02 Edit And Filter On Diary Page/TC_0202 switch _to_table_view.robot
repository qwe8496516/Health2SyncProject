*** Settings ***
Resource         ../../resources/keywords/diary_page_keywords.robot
Resource         ../../resources/keywords/add_user_health_data_keywords.robot

Suite Setup    Launch Application
Suite Teardown    Shutdown Application

*** Test Cases ***
Verify Table View Glucose Displayed Correctly
    [Documentation]
    Create Glucose Diary  10  past  Before Lunch
    Click Diary Menu
    Click Table View
    Click Spinner On Table View
    Select Glucose Filter
    Verify Glucose Show On Table View  10  Lunch
    Click List View
    Delete Diary
    [Teardown]

Verify Table View Pressure Displayed Correctly
    [Documentation]
    Create Pressure Diary  3  2  1  past  After Breakfast
    Click Diary Menu
    Click Table View
    Click Spinner On Table View
    Select Pressure Filter
    Verify Pressure Show On Table View  After Breakfast  3/2  1
    Click List View
    Delete Diary
    [Teardown]

Verify Table View Weight Displayed Correctly
    [Documentation]
    Create Weight Diary  20  20  past  Wake-up
    Click Diary Menu
    Click Table View
    Click Spinner On Table View
    Select Weight Filter
    Verify Pressure Show On Table View  Wake-up  20  20
    Click List View
    Delete Diary
    [Teardown]