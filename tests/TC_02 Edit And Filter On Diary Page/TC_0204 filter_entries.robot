*** Settings ***
Resource         ../../resources/keywords/diary_page_keywords.robot
Resource         ../../resources/keywords/add_user_health_data_keywords.robot
Suite Setup    Launch Application
Suite Teardown    Shutdown Application

*** Test Cases ***
Verify Glucose Show After Filted
    [Documentation]
    Create Glucose Diary Time Set 1Hour Before    60    now    Wake-up 
    Create Glucose Diary    80    now    Wake-up    
    Click Diary Menu
    Click Filter Button
    Click Record Type & Value Show More Button
    Set Glucose Filter    70    85
    Click Done Button
    Verify Glucose Diary Is Correct    80
    Exit Search state on Diary Page
    Delete Diary
    Delete Diary
    [Teardown]

Verify Pressure Show After Filted
    [Documentation]
    Create Pressure Diary Time Set 1Hour Before    60    40    20    now    Wake-up 
    Create Pressure Diary    62    42    20    now    Wake-up 
    Click Diary Menu
    Click Filter Button
    Click Record Type & Value Show More Button
    Set Pressure Filter    59    61    39    41
    Click Done Button
    Verify Pressure Is Correct    60    40    20
    Exit Search state on Diary Page
    Delete Diary
    Delete Diary
    [Teardown]

Verify Period Show After Filted
    [Documentation]
    Create Glucose Diary Time Set 1Hour Before    60    now    Wake-up 
    Create Glucose Diary    80    now    After Lunch 
    Click Diary Menu
    Click Filter Button
    Click Wake-up Checkbox
    Click Done Button
    Verify Glucose Diary Is Correct    60
    Exit Search state on Diary Page
    Delete Diary
    Delete Diary
    [Teardown]