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