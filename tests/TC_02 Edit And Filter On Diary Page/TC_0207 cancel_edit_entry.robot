*** Settings ***
Resource    ../../resources/keywords/add_user_health_data_keywords.robot
Resource    ../../resources/keywords/diary_page_keywords.robot
Suite Setup    Launch Application
Suite Teardown    Shutdown Application
*** Test Cases ***
Cancel Edit Diary Entry
    [Documentation]    Cancel editing an existing diary entry and verify the original value remains unchanged.
    [Setup]    Create Glucose Diary  100  past  Before Lunch
    Click Diary Menu
    Click Table View
    Verify Glucose Show On Table View  100  Lunch
    Click List View
    Cancel Edit Glucose Diary Entry  50
    Glucose Diary Entry Value Should Be  100
    [Teardown]    Delete Diary