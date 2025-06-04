*** Settings ***
Library    AppiumLibrary
Library    DateTime
Resource   ../keywords/common_keywords.robot

*** Keywords ***
Click Dashboard Menu
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/tab_dashboard"]

Click Blood Glucose Dashboard
    Click Element Until Element Is Visible    xpath=//androidx.recyclerview.widget.RecyclerView[@resource-id="com.h2sync.android.h2syncapp:id/recycler_view_dashboard"]/android.widget.FrameLayout[1]

Click Exercise Dashboard
    Click Element Until Element Is Visible    xpath=//androidx.recyclerview.widget.RecyclerView[@resource-id="com.h2sync.android.h2syncapp:id/recycler_view_dashboard"]/android.widget.FrameLayout[2]

Click Dashboard Menu Setting Button
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/menu_setting"]

Click Dashboard Item Setting Button
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/item_setting"]

Click Blood Glucose Set Goals Option
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/layout_goals"]

Click Daily Steps Target Option
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/layout_exercise_steps"]

Click Weekly Exercise Time Target Option
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/layout_exercise_minutes"]

Enter Daily Steps Target
    [Arguments]    ${target}
    Input Text Until Element Is Visible    xpath=//android.widget.EditText[@resource-id="com.h2sync.android.h2syncapp:id/edit_text_value"]    ${target}

Enter Weekly Exercise Time Target
    [Arguments]    ${target}
    Input Text Until Element Is Visible    xpath=//android.widget.EditText[@resource-id="com.h2sync.android.h2syncapp:id/edit_text_value"]    ${target}

Get Exercise Steps Value
    ${steps} =    Get Text Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_exercise_steps"]
    [Return]    ${steps}

Get Dashboard Section Name
    [Arguments]    ${dashboard}
    ${dashboardName} =    Get Text Until Element Is Visible    xpath=//android.widget.TextView[@text="${dashboard}"]
    [Return]    ${dashboardName}

Get Date With Dashboard Section Name
    [Arguments]    ${dashboardName}
    ${date} =    Get Current Date    result_format=%#m/%#d
    ${newDashboardName} =    Set Variable    ${date} ${dashboardName}
    [Return]    ${newDashboardName}

Click Confirm Button
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/button_confirm"]

Click Save Button
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/button_save"]

Click Back Image Button
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/toolbar"]//android.widget.ImageButton

Scroll Until Dashboard Is Visible
    [Arguments]    ${dashboard}
    Scroll Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_${dashboard}"]

Scroll Until Text Element Is Visible
    [Arguments]    ${text}
    ${width} =    Get Window Width
    ${height} =   Get Window Height   
    ${start_x} =    Evaluate    ${width} / 2
    ${start_y} =    Evaluate    ${height} * 0.3

    WHILE    ${True}
        ${is_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath=//android.widget.TextView[contains(@text, '${text}')]
        Log    ${is_visible}
        IF    ${is_visible}
            BREAK
        END
        # Scroll down from center to bottom
        ${end_x} =      Set Variable    ${start_x}
        ${end_y} =      Set Variable    0
        Swipe    ${start_x}    ${start_y}    ${end_x}    ${end_y}    1000
    END

Scroll Until Dashboard Section Is Visible
    [Arguments]    ${locator}
    ${width} =    Get Window Width
    ${height} =   Get Window Height   
    ${start_x} =    Evaluate    ${width} / 2
    ${start_y} =    Evaluate    ${height} * 0.8

    WHILE    ${True}
        ${is_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator}
        Log    ${is_visible}
        IF    ${is_visible}
            BREAK
        END
        # Scroll down from center to bottom
        ${end_x} =      Set Variable    ${start_x}
        ${end_y} =      Set Variable    0
        Swipe    ${start_x}    ${start_y}    ${end_x}    ${end_y}    1000
    END

Click Dashboard Section
    [Arguments]    ${dashboard}
    ${dashboardPath} =    Set Variable    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_${dashboard}"]/ancestor::android.widget.FrameLayout
    Scroll Until Dashboard Section Is Visible    ${dashboardPath}
    Click Element Until Element Is Visible    ${dashboardPath}

Change Daily Steps Target
    [Arguments]    ${target_steps}
    Click Dashboard Item Setting Button
    Click Daily Steps Target Option
    Enter Daily Steps Target    ${target_steps}
    Click Save Button

Change Weekly Exercise Time Target
    [Arguments]    ${target_exercise}
    Click Dashboard Item Setting Button
    Click Weekly Exercise Time Target Option
    Enter Weekly Exercise Time Target    ${target_exercise}
    Click Save Button

Verify Steps Target Is Equal To Expected Value
    [Arguments]    ${targetValue} 
    Verify Text Element Is Equal To Expected Value  xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_exercise_steps"]  ${targetValue}

Verify Exercise Target Is Equal To Expected Value
    [Arguments]    ${targetValue} 
    Verify Text Element Is Equal To Expected Value  xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_exercise_minutes"]  ${targetValue}

Verify Dashboard Section Is Displayed
    [Arguments]    ${section}
    ${dashboardSection} =    Get Dashboard Section Name    ${section}
    Should Be Equal    ${dashboardSection}    ${section}