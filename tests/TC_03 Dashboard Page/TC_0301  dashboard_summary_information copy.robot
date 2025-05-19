*** Settings ***
Resource         ../../resources/keywords/dashboard_information_keywords.robot

Suite Setup    Launch Application
Suite Teardown    Shutdown Application

*** Test Cases ***
Verify Summary Information For Each Dashboard Section Is Displayed Correctly
    [Documentation]    Summary Information Can Be Successfully Displayed
    # [Setup]    Create Glucose Diary    121
    Click Dashboard Section     glucose
    Click Dashboard Setting Button
    # Click Blood Glucose Set Goals Option
    Click Confirm Button
    Click Back Image Button
    # [Teardown]    Delete Glucose Diary