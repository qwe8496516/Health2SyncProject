*** Settings ***
Resource         ../../resources/keywords/dashboard_information_keywords.robot

Suite Setup    Launch Application
Suite Teardown    Shutdown Application

*** Test Cases ***
Verify Summary Information For Each Dashboard Section Is Displayed Correctly
    [Documentation]    Summary Information Can Be Successfully Displayed
    # [Setup]    Create Glucose Diary    121
    # Verify Glucose Diary Is Correct    121
    # [Teardown]    Delete Glucose Diary