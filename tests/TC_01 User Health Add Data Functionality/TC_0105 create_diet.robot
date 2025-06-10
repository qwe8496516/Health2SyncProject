*** Settings ***
Resource         ../../resources/keywords/add_user_health_data_keywords.robot

Suite Setup    Launch Application
Suite Teardown    Shutdown Application

*** Variables ***
${SERV_MIN}               0.1
${SERV_MAX}               19.9


@{GRAINS}                Bread    Pasta    Rice    Starchy Veggies    Other Grains
@{PROTEIN_FOODS}         Meat    Fish    Seafood    Eggs    Other Proteins
@{VEGETABLES}            Vegetables
@{FRUITS}                Fruits
@{DAIRY}                 Dairy
@{OILS}                  Oils
@{OTHERS}                Juice    Alcohol    Soft Drinks    Coffee/Tea

${PERIODS}       Wake-up    Before Breakfast  After Breakfast    Before Lunch   After Lunch     Before Dinner   After Dinner    Before Snack    After Snack     Before Exercise    After Exercise    Bedtime   Midnight   Other
${TIMES}         now    past

*** Test Cases ***
Verify Diet Entry With Different Times
    ${entry}=    Create Dictionary    category=Bread    serv=1.5
    ${entries}=    Create List    ${entry}
    FOR    ${time}    IN    ${TIMES}
        Create Diet Diary    ${entries}    ${time}    Wake-up
        Verify Diet Is Correct    ${entries}
        Delete Diary
    END

Verify Diet Entry With Different Periods
    ${entry}=    Create Dictionary    category=Bread    serv=1.5
    ${entries}=    Create List    ${entry}
    FOR    ${period}    IN    ${PERIODS}
        Create Diet Diary    ${entries}    ${period}    Wake-up
        Verify Diet Is Correct    ${entries}
        Delete Diary
    END

Verify Diet Entry With Boundary Serving Values
    ${entry}=    Create Dictionary    category=Bread    serv=${SERV_MIN}
    ${entries}=    Create List    ${entry}
    Create Diet Diary    ${entries}    now   Wake-up
    Verify Diet Is Correct    ${entries}
    Delete Diary

    ${entry}=    Create Dictionary    category=Meat    serv=${SERV_MAX}
    ${entries}=    Create List    ${entry}
    Create Diet Diary    ${entries}    now   Wake-up
    Verify Diet Is Correct    ${entries}
    Delete Diary


Verify Diet Entry With Same Catagory Combinations
    ${entry1}=    Create Dictionary    category=Bread    serv=2.5
    ${entry2}=    Create Dictionary    category=Rice     serv=3.0
    ${entry3}=    Create Dictionary    category=Pasta    serv=1.5
    ${entries}=    Create List    ${entry1}    ${entry2}    ${entry3}
    Create Diet Diary    ${entries}    now   Wake-up
    Verify Diet Is Correct    ${entries}
    [Teardown]    Delete Diary

Verify Diet Entry With Cross-Category Combinations
    ${entry1}=    Create Dictionary    category=Vegetables    serv=1.0
    ${entry2}=    Create Dictionary    category=Fruits        serv=2.5
    ${entry3}=    Create Dictionary    category=Meat          serv=3.0
    ${entry4}=    Create Dictionary    category=Dairy         serv=0.5
    ${entries}=    Create List    ${entry1}    ${entry2}    ${entry3}    ${entry4}
    Create Diet Diary    ${entries}    now   Wake-up
    Verify Diet Is Correct    ${entries}
    [Teardown]    Delete Diary

