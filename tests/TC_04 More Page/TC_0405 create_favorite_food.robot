*** Settings ***
Resource         ../../resources/keywords/more_page_keywords.robot
Resource         ./more_page_variable.robot

Suite Setup    Run Keywords    Launch Application
...                     AND    On More Page
Suite Teardown    Shutdown Application

*** Test Cases ***
Verify New Food Can Be Created In "Favorite Food"
    [Documentation]    Verify New Food Can Be Created In "Favorite Food"
    Click "Favorite Food" Option
    Click "Create New Food" Button
    Enter Food Name    Hamburger
    Click "Create" Button
    Verify Favorite Food Is Created    Hamburger
    [Teardown]    Run Keywords    Delete Favorite Food    Hamburger
    ...                    AND    Click Arrow Back Button

Verify New Food Can Not Be Created In "Favorite Food" With Empty Name
    [Documentation]    Verify New Food Can Not Be Created In "Favorite Food" With Empty Name (Empty String Partition)
    Click "Favorite Food" Option
    Click "Create New Food" Button
    Enter Food Name    ${EMPTY_STRING}
    Click "Create" Button
    Verify Favorite Food Is Not Created
    [Teardown]    Run Keywords    Click X Button
    ...                    AND    Click Arrow Back Button