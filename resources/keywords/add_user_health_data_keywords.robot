*** Settings ***
Library    AppiumLibrary

*** Keywords ***
Create Glucose Diary
    [Arguments]    ${bloodGlucose}
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/tab_add_diary"]
    Click Element Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="com.h2sync.android.h2syncapp:id/view_item_blood_glucose"]
    Input Text Until Element Is Visible     xpath=//android.widget.EditText[@resource-id="com.h2sync.android.h2syncapp:id/edit_value"]    ${bloodGlucose}
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/button_done"] 
    
Delete Glucose Diary
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/layout_title_section"]
    Click Element Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_diary_delete"]
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="android:id/button1"]

Verify Glucose Diary Is Correct
    [Arguments]    ${bloodGlucose}
    Verify Text Element Is Equal To Expected Value    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_item_title"]    Blood Glucose
    Verify Text Element Is Equal To Expected Value    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_item_value"]    ${bloodGlucose} mg/dL