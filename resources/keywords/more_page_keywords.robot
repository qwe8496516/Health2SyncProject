*** Settings ***
Library    AppiumLibrary
Resource   ../keywords/common_keywords.robot

*** Keywords ***
On More Page
    Click Element Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_title" and @text="More"]

Click "Units" Option
    Click Element Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_content" and @text="Units"]

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
