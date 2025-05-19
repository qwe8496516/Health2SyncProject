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
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/item_setting"]

Click Blood Glucose Set Goals Option
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/layout_goals"]

Click Daily Steps Target Option
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/layout_exercise_steps"]

Enter Daily Steps Target
    [Arguments]    ${target}
    Input Text Until Element Is Visible    xpath=//android.widget.EditText[@resource-id="com.h2sync.android.h2syncapp:id/edit_text_value"]    ${target}

Get Exercise Steps Value
    ${steps} =    Get Text Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_exercise_steps"]
    return    ${steps}

Click Confirm Button
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/button_confirm"]

Click Save Button
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/button_save"]

Click Back Image Button
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/toolbar"]//android.widget.ImageButton

Scroll Until Dashboard Is Visible
    [Arguments]    ${dashboard}
    Scroll Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_${dashboard}"]

Scroll To Bottom Of Layout Container
    # These coordinates are based on the bounds [0,0][1080,2400]
    ${start_x}=    Set Variable    540         # Middle of the width (1080/2)
    ${start_y}=    Set Variable    2000        # Near the bottom (e.g., 2400 - 400)
    ${end_x}=      Set Variable    540         # Same x (vertical swipe)
    ${end_y}=      Set Variable    400         # Near the top (e.g., 0 + 400)
    Swipe    ${start_x}    ${start_y}    ${end_x}    ${end_y}    800

Click Dashboard Section
    [Arguments]    ${dashboard}
    Scroll To Bottom Of Layout Container
    Click Element Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_${dashboard}"]/ancestor::android.widget.FrameLayout

Change Daily Steps Target
    [Arguments]    ${target_steps}
    Click Dashboard Setting Button
    Click Daily Steps Target Option
    Enter Daily Steps Target    ${target_steps}
    Click Save Button

Verify Steps Target Is Equal To Expected Value
    [Arguments]    ${targetValue} 
    Verify Text Element Is Equal To Expected Value  xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_exercise_steps"]  ${targetValue}