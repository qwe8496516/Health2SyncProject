*** Settings ***
Resource         ../../resources/keywords/diary_page_keywords.robot
Resource         ../../resources/keywords/add_user_health_data_keywords.robot
Suite Setup    Launch Application
#Suite Teardown    Shutdown Application

*** Test Cases ***
Verify Click Glucose Show Data
    [Documentation]
    Create Glucose Diary    80    now    Before Lunch
    Click Diary Menu
    Click First Entry
    Verify Glucose Show Correct Data    80    Before Lunch
    Click Cancel Button
    Delete Diary
    [Teardown]

Verify Click Pressure Show Data
    [Documentation]
    Create Pressure Diary    60    40    20    now    Wake-up 
    Click Diary Menu
    Click First Entry
    Verify Pressure Show Correct Data    60    40    20    Wake-up 
    Click Cancel Button
    Delete Diary
    [Teardown]

Verify Click Weight Show Data
    [Documentation]
    Create Weight Diary    70    20    now    Wake-up 
    Click Diary Menu
    Click First Entry
    Verify Weight Show Correct Data     70    20     Wake-up 
    Click Cancel Button
    Delete Diary
    [Teardown]

Verify Click Medication Show Data
    [Documentation]
    Create Insulin/GLP-1 Medication Diary    Admelog    2    2    now    Wake-up 
    Click Diary Menu
    Click First Entry
    Verify Medication Show Correct Data     Admelog    2    2    Wake-up 
    Click Cancel Button
    Delete Diary
    [Teardown]

Verify Click Diet Show Data
    ${entry}=    Create Dictionary    category=Bread    serv=1.2
    ${entries}=    Create List    ${entry}
    Create Diet Diary    ${entries}    now    Wake-up
    Click Diary Menu
    Click First Entry
    Verify Diet Show Correct Data    Bread    1.2    Wake-up
    Click Cancel Button
    Delete Diary
    [Teardown]

Verify Click Exercise Show Data
    ${entry}=    Create Dictionary    type=Tennis   hour=1   minute=5
    ${entries}=    Create List    ${entry}
    Create Exercise Diary   ${entries}    now    Wake-up
    Click Diary Menu
    Click First Entry
    Verify Exercise Show Correct Data    Tennis    1    5    Wake-up
    Click Cancel Button
    Delete Diary
    [Teardown]