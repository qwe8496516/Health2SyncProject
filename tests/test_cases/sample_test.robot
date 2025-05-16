*** Settings ***
Resource         ../../resources/keywords/common_keywords.robot

Suite Setup    Launch Application
Suite Teardown    Shutdown Application

*** Test Cases ***
Sample Test Case
    [Documentation]    Test Common Keywords
    # [Setup] // create a setup step to launch the app
    Verify Element Is Visible On Page    xpath=//android.widget.TextView[@text="Diary"]
    Click Element Until Element Is Visible    xpath=//android.widget.TextView[@text="Diary"]
    Click Element Until Element Is Visible    id=com.h2sync.android.h2syncapp:id/layout_keyword
    Input Text Until Element Is Visible  //android.widget.EditText[@resource-id="com.h2sync.android.h2syncapp:id/edit_search_title"]  test
    # [Teardown] // delete the teardown step to close the app