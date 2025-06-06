*** Settings ***
Resource         ../../resources/keywords/add_user_health_data_keywords.robot

Suite Setup    Launch Application
Suite Teardown    Shutdown Application

   

*** Test Cases ***
Verify New Diet Entry Can Be Successfully Added To The Diary Page
    [Documentation]    Diet Entry Can Be Successfully Added To The Diary Page

    ${entry1}=    Create Dictionary    category=Bread    serv=1.2
    ${entry2}=    Create Dictionary    category=Fruits    serv=3.4
    ${entries}=    Create List    ${entry1}    ${entry2}
    Create Diet Diary    ${entries}    current    Before Breakfast
    Verify Diet Is Correct    ${entries}
    [Teardown]    Delete Diary