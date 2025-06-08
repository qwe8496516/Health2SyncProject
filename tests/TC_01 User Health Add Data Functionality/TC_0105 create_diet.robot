*** Settings ***
Resource         ../../resources/keywords/add_user_health_data_keywords.robot

Suite Setup    Launch Application
Suite Teardown    Shutdown Application

*** Variables ***
${SERV_MIN}               0.1
${SERV_MAX}               19.9
${SERV_INVALID_LOW}       -1
${SERV_INVALID_HIGH}      20.0

# 食物分類
@{GRAINS}                Bread    Pasta    Rice    Starchy Veggies    Other Grains
@{PROTEIN_FOODS}         Meat    Fish    Seafood    Eggs    Other Proteins
@{VEGETABLES}            Vegetables
@{FRUITS}                Fruits
@{DAIRY}                 Dairy
@{OILS}                  Oils
@{OTHERS}                Juice    Alcohol    Soft Drinks    Coffee/Tea

   

*** Test Cases ***
# Verify New Diet Entry Can Be Successfully Added To The Diary Page
#     [Documentation]    Diet Entry Can Be Successfully Added To The Diary Page

#     ${entry1}=    Create Dictionary    category=Bread    serv=1.2
#     ${entry2}=    Create Dictionary    category=Fruits    serv=3.4
#     ${entries}=    Create List    ${entry1}    ${entry2}
#     Create Diet Diary    ${entries}    current    Before Breakfast
#     Verify Diet Is Correct    ${entries}
#     [Teardown]    Delete Diary

Verify Diet Entry With Minimum Servings
    [Documentation]    Verify that a diet entry with the minimum servings (${SERV_MIN}) is successfully added.
    ${entry}=    Create Dictionary    category=Bread    serv=${SERV_MIN}
    ${entries}=    Create List    ${entry}
    Create Diet Diary    ${entries}    current    Before Breakfast
    Verify Diet Is Correct    ${entries}
    [Teardown]    Delete Diary

Verify Diet Entry With Maximum Servings
    [Documentation]    Verify that a diet entry with the maximum servings (${SERV_MAX}) is successfully added.
    ${entry}=    Create Dictionary    category=Meat    serv=${SERV_MAX}
    ${entries}=    Create List    ${entry}
    Create Diet Diary    ${entries}    current    After Lunch
    Verify Diet Is Correct    ${entries}
    [Teardown]    Delete Diary

Verify Diet Entry With Invalid Low Servings
    [Documentation]    Verify that a diet entry with servings below the minimum (${SERV_INVALID_LOW}) is rejected.
    ${entry}=    Create Dictionary    category=Fruits    serv=${SERV_INVALID_LOW}
    ${entries}=    Create List    ${entry}
    ${result}=    Run Keyword And Ignore Error    Create Diet Diary    ${entries}    current    Before Breakfast
    Should Contain    ${result[0]}    FAIL    Serv value must be between 0.0 and 19.9
    Click Cancel Choose Button
    Click Cancel Button
    Verify Diet Diary Is Not Present    ${entries}

Verify Diet Entry With Invalid High Servings
    [Documentation]    Verify that a diet entry with servings above the maximum (${SERV_INVALID_HIGH}) is rejected.
    ${entry}=    Create Dictionary    category=Fish    serv=${SERV_INVALID_HIGH}
    ${entries}=    Create List    ${entry}
    ${result}=    Run Keyword And Ignore Error    Create Diet Diary    ${entries}    current    Before Breakfast
    Should Contain    ${result[0]}    FAIL    Serv value must be between 0.0 and 19.9
    Click Cancel Choose Button
    Click Cancel Button
    Verify Diet Diary Is Not Present    ${entries}

Verify Diet Entry With Invalid Category
    [Documentation]    Verify that a diet entry with an invalid category (not listed in any category) is rejected.
    ${entry}=    Create Dictionary    category=InvalidFood    serv=2.0
    ${entries}=    Create List    ${entry}
    ${result}=    Run Keyword And Ignore Error    Create Diet Diary    ${entries}    current    Before Breakfast
    Should Contain    ${result[0]}    FAIL    not found.
    Click Cancel Choose Button
    Click Cancel Button
    Verify Diet Diary Is Not Present    ${entries}


Verify Diet Entry With Multiple Items From Grains
    [Documentation]    Verify that multiple items from the grains category can be added successfully.
    ${entry1}=    Create Dictionary    category=Bread    serv=2.5
    ${entry2}=    Create Dictionary    category=Rice     serv=3.0
    ${entry3}=    Create Dictionary    category=Pasta    serv=1.5
    ${entries}=    Create List    ${entry1}    ${entry2}    ${entry3}
    Create Diet Diary    ${entries}    current    Before Breakfast
    Verify Diet Is Correct    ${entries}
    [Teardown]    Delete Diary

Verify Diet Entry With Cross-Category Items
    [Documentation]    Verify that items from different categories can be added successfully.
    ${entry1}=    Create Dictionary    category=Vegetables    serv=1.0
    ${entry2}=    Create Dictionary    category=Fruits        serv=2.5
    ${entry3}=    Create Dictionary    category=Meat          serv=3.0
    ${entry4}=    Create Dictionary    category=Dairy         serv=0.5
    ${entries}=    Create List    ${entry1}    ${entry2}    ${entry3}    ${entry4}
    Create Diet Diary    ${entries}    current    After Lunch
    Verify Diet Is Correct    ${entries}
    [Teardown]    Delete Diary

