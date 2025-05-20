*** Settings ***
Library    AppiumLibrary
Resource   ../keywords/common_keywords.robot

*** Keywords ***
Click Diary Menu
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/tab_diaries"]

Click Table View
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/display_type"]

Verify On Diary Page
    Verify Text Element Is Equal To Expected Value    xpath=(//android.widget.TextView[@text="Diary"])[1]    Diary

Verify List View on Rage
    Verify Text Element Is Equal To Expected Value    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/display_type"]    List View
