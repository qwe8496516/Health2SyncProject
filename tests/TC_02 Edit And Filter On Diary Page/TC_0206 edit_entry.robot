*** Settings ***
Resource    ../../resources/keywords/add_user_health_data_keywords.robot
Resource    ../../resources/keywords/diary_page_keywords.robot
Suite Setup    Launch Application
Suite Teardown    Shutdown Application
*** Test Cases ***
Edit Diary Entry
    [Documentation]    Edit an existing diary entry and verify the changes.
    [Setup]    Create Glucose Diary  100  past  Before Lunch
    Click Diary Menu
    Click Table View
    Verify Glucose Show On Table View  100  Lunch
    Click List View
    Click Edit Glucose Diary Entry  50
    Glucose Diary Entry Value Should Be  50
    [Teardown]    Delete Diary