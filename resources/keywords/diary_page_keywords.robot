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

Click Search Bar
    Click Element Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="com.h2sync.android.h2syncapp:id/layout_keyword"]

Enter Keyword At Search Bar
    [Arguments]    ${keywords}
    Wait Until Page Contains Element    xpath=//android.widget.EditText[@resource-id="com.h2sync.android.h2syncapp:id/edit_search_title"]    timeout=10s
    Input Text Until Element Is Visible  xpath=//android.widget.EditText[@resource-id="com.h2sync.android.h2syncapp:id/edit_search_title"]    ${keywords}

Press Enter At Search Bar
    Press Keycode    66

Exit Search state on Diary Page
    Click Element Until Element Is Visible    xpath=//android.widget.ImageView[@resource-id="com.h2sync.android.h2syncapp:id/image_cancel"]

Verify Entries with Keyword Shows on Diary Page
    [Arguments]    ${keywords}
    Wait Until Element Is Visible    xpath=(//android.widget.TextView[contains(@text, ${keywords})])    10s
