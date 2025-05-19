*** Settings ***
Resource         ../../resources/keywords/more_page_keywords.robot

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
    [Teardown]    Delete Favorite Food    Hamburger