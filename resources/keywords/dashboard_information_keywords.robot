*** Settings ***
Library    AppiumLibrary
Resource   ../keywords/common_keywords.robot

*** Keywords ***
Click Dashboard Menu
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/tab_dashboard"]

Click Blood Glucose Dashboard
    Click Element Until Element Is Visible    xpath=//androidx.recyclerview.widget.RecyclerView[@resource-id="com.h2sync.android.h2syncapp:id/recycler_view_dashboard"]/android.widget.FrameLayout[1]

Click Exercise Dashboard
    Click Element Until Element Is Visible    xpath=//androidx.recyclerview.widget.RecyclerView[@resource-id="com.h2sync.android.h2syncapp:id/recycler_view_dashboard"]/android.widget.FrameLayout[2]

Click Dashboard Setting Button
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/menu_setting"]

Click Blood Glucose Set Goals Option
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/layout_goals"]

Click Confirm Button
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/button_confirm"]

Click Back Image Button
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/toolbar"]//android.widget.ImageButton

Scroll Until Dashboard Is Visible
    [Arguments]    ${dashboard}
    Scroll Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_${dashboard}"]

Click Dashboard Section
    [Arguments]    ${dashboard}
    # Scroll Until Dashboard Is Visible    ${dashboard}
    Click Element Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_${dashboard}"]/ancestor::android.widget.FrameLayout