*** Settings ***
Resource         ../../resources/keywords/add_user_health_data_keywords.robot

Suite Setup    Launch Application
Suite Teardown    Shutdown Application

# *** Test Cases ***
# Verify New Exercise Entry Can Be Successfully Added To The Diary Page
#     [Documentation]    Exercise Entry Can Be Successfully Added To The Diary Page
#     Create Execise Diary
#     [Teardown]
#     Delete Exercise Diary


*** Test Cases ***
Verify New Exercise Entry Can Be Successfully Added To The Diary Page
    [Documentation]    Exercise Entry Can Be Successfully Added To The Diary Page

    ${entry1}=    Create Dictionary    type=Tennis   hour=1   minute=5
    ${entry2}=    Create Dictionary    type=Stretching   hour=2    minute=0
    ${entry3}=    Create Dictionary    type=Biking (Slow)   hour=0    minute=15
    ${entries}=    Create List    ${entry1}    ${entry2}    ${entry3}
    Create Exercise Diary   ${entries}    current    Before Breakfast
    Verify Exercise Is Correct    ${entries}
    [Teardown]    Delete Diary