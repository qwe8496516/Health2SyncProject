*** Settings ***
Resource         ../../resources/keywords/diary_page_keywords.robot
Resource         ../../resources/keywords/add_user_health_data_keywords.robot
Suite Setup    Launch Application
#Suite Teardown    Shutdown Application

*** Test Cases ***
Verify Diary Page Loads Successfully
    [Documentation]
    #Create Execise Diary
    Click Diary Menu
    Click Filter Button
    Click Record Type & Value Show More Button
    # Click Glucose Checkbox
    # Click Pressure Checkbox
    # Click Weigtht Checkbox
    # Click Body Fat Checkbox
    # Click Medication Checkbox
    # Click Diet Checkbox
    # Click Record Exercise Checkbox
    # Click Note/Photo Checkbox
    # Click Mood Checkbox
    Scroll To Find TextView  Show More
    Click Period Show More Button
    Scroll To Find Checkbox  Other
    # Click Wake-up Checkbox
    # Click Breakfast Checkbox
    # Click Lunch Checkbox
    # Click Dinner Checkbox
    # Click Snack Checkbox
    # Click Period Exercise Checkbox
    # Click Bedtime Checkbox
    # Click Midnight Checkbox
    # Click Other Checkbox
    Click Done Button
    #Click Show more
    #Delete Exercise Diary
    [Teardown]