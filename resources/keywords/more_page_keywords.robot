*** Settings ***
Library    AppiumLibrary
Resource   ../keywords/common_keywords.robot

*** Keywords ***
On More Page
    Click Element Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_title" and @text="More"]

Click "Units" Option
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/view_units"]/android.view.ViewGroup

Modify Blood Glucose Unit
    [Arguments]    ${unit}
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/view_glucose_unit"]/android.view.ViewGroup
    Click Element Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/title" and contains(@text, '${unit}')]

Modify Weight Unit
    [Arguments]    ${unit}
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/view_weight_unit"]/android.view.ViewGroup
    Click Element Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/title" and contains(@text, "${unit}")]

Verify Blood Glucose Unit Is Changed
    [Arguments]    ${unit}
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[.//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_content" and @text="Blood Glucose"]]//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_value" and @text="${unit}"]

Verify Weight Unit Is Changed
    [Arguments]    ${unit}
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[.//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_content" and @text="Weight"]]//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_value" and @text="${unit}"]

Click "PDF Report/Excel" Option
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/view_pdf_report"]/android.view.ViewGroup

Click "Send Report" Button
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/button_send_report"]

Input Email
    [Arguments]    ${email}
    Input Text Until Element Is Visible  xpath=//android.widget.EditText[@resource-id="com.h2sync.android.h2syncapp:id/edittext_email"]   ${email}

Click "Send" Button
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/send_report"]

Click "Confirm" Button
    Click Element Until Element Is Visible     xpath=//android.widget.Button[@resource-id="android:id/button1" and @text="Confirm"]

Verify Health Report Is Exported
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="android:id/message" and @text="Your data will be sent shortly."]

Click "Yes" Button
    Wait Until Element Is Visible    xpath=//android.widget.Button[@resource-id="android:id/button1" and @text="Yes"]

Click "Favorite Food" Option
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/view_favorite_foods"]/android.view.ViewGroup

Click "Create New Food" Button
    Click Element Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/label_title" and @text="Create New Food"]

Input Food Name
    [Arguments]    ${foodName}
    Input Text Until Element Is Visible    xpath=//android.widget.EditText[@resource-id="com.h2sync.android.h2syncapp:id/edit_food_name"]    ${foodName}

Click "Create" Button
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/button_done" and @text="Create"]

Verify Favorite Food Is Created
    [Arguments]    ${foodName}
    Wait Until Element Is Visible    xpath=//androidx.recyclerview.widget.RecyclerView[@resource-id="com.h2sync.android.h2syncapp:id/recycler_view_favorite"]//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/label_title" and @text="${foodName}"]

Delete Favorite Food
    [Arguments]    ${foodName}
    Click Element Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/label_title" and @text="${foodName}"]
    Click "Edit" Button
    Scroll To Bottom Of Page
    Click "Delete Custom Food" Button
    Click "Yes" Button

Click "Edit" Button
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/menu_edit"]

Scroll To Bottom Of Page
    [Documentation]    Reference from "Scroll To Bottom Of Layout Container" Keyword
    # These coordinates are based on the bounds [0,0][1080,2400]
    ${start_x}=    Set Variable    540         # Middle of the width (1080/2)
    ${start_y}=    Set Variable    2000        # Near the bottom (e.g., 2400 - 400)
    ${end_x}=      Set Variable    540         # Same x (vertical swipe)
    ${end_y}=      Set Variable    400         # Near the top (e.g., 0 + 400)
    Swipe    ${start_x}    ${start_y}    ${end_x}    ${end_y}    800

Click "Delete Custom Food" Button
    Click Element Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_delete_custom_food"]