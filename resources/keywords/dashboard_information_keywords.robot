*** Settings ***
Library    AppiumLibrary
Library    DateTime
Resource   ../keywords/common_keywords.robot

*** Keywords ***
Click Dashboard Menu
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/tab_dashboard"]

Click Dashboard Menu Setting Button
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/menu_setting"]

Click Dashboard Item Setting Button
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/item_setting"]

Click Blood Glucose Set Goals Option
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/layout_goals"]

Click Confirm Button
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/button_confirm"]

Click Save Button
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/button_save"]

Click Back Image Button
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/toolbar"]//android.widget.ImageButton

Click Daily Steps Target Option
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/layout_exercise_steps"]

Click Weekly Exercise Time Target Option
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/layout_exercise_minutes"]

Click Before Meal Option
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/view_glucose_before_meal"]

Click After Meal Option
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/view_glucose_after_meal"]

Click Bedtime Option
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/view_glucose_bedtime"]

Click Systolic Option
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/view_systolic"]

Click Diastolic Option
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/view_diastolic"]

Click Pulse Option
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/view_pulse"]

Click Modal Done Button
    Click Element Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/button_right" and @text="Done"]

Click Modal Cancel Button
    Click Element Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/button_left" and @text="Cancel"]

Click Dialog OK Button
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="android:id/button1"]

Swipe Number Picker Lower Value
    [Arguments]    ${value}
    WHILE    ${True}
        Sleep    0.1s
        ${current_value} =    Get Text Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="com.h2sync.android.h2syncapp:id/design_bottom_sheet"]/android.view.ViewGroup/android.widget.NumberPicker[1]//android.widget.EditText[@resource-id="android:id/numberpicker_input"]
        ${equal} =    Evaluate    "${current_value}" == "${value}"
        Log    Current Value: ${current_value}
        Log    Expected Value: ${value}
        Log    Equal: ${equal}
        IF    ${equal}
            BREAK
        ELSE IF   ${current_value} < ${value}
            Swipe    435    1981    435    1832    500
        ELSE
            Swipe    435    1981    435    2131    500
        END
    END

Swipe Number Picker Higher Value
    [Arguments]    ${value}
    WHILE    ${True}
        ${current_value} =    Get Text Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="com.h2sync.android.h2syncapp:id/design_bottom_sheet"]/android.view.ViewGroup/android.widget.NumberPicker[2]//android.widget.EditText[@resource-id="android:id/numberpicker_input"]
        ${equal} =    Evaluate    "${current_value}" == "${value}"
        IF    ${equal}
            BREAK
        ELSE IF   ${current_value} < ${value}
            Swipe    645    1981    645    1832    500
        ELSE
            Swipe    645    1981    645    2131    500
        END
    END

Enter Before Meal Values
    [Arguments]    ${lower_value}    ${higher_value}
    Click Before Meal Option
    Swipe Number Picker Lower Value    ${lower_value}
    Swipe Number Picker Higher Value    ${higher_value}
    Click Modal Done Button
    Click Confirm Button

Enter After Meal Values
    [Arguments]    ${lower_value}    ${higher_value}
    Click After Meal Option
    Swipe Number Picker Lower Value    ${lower_value}
    Swipe Number Picker Higher Value    ${higher_value}
    Click Modal Done Button

Enter Bedtime Values
    [Arguments]    ${lower_value}    ${higher_value}
    Click Bedtime Option
    Swipe Number Picker Lower Value    ${lower_value}
    Swipe Number Picker Higher Value    ${higher_value}
    Click Modal Done Button

Enter Systolic Values
    [Arguments]    ${lower_value}    ${higher_value}
    Click Systolic Option
    Swipe Number Picker Lower Value    ${lower_value}
    Swipe Number Picker Higher Value    ${higher_value}
    Click Modal Done Button

Enter Diastolic Values
    [Arguments]    ${lower_value}    ${higher_value}
    Click Diastolic Option
    Swipe Number Picker Lower Value    ${lower_value}
    Swipe Number Picker Higher Value    ${higher_value}
    Click Modal Done Button

Enter Pulse Values
    [Arguments]    ${lower_value}    ${higher_value}
    Click Pulse Option
    Swipe Number Picker Lower Value    ${lower_value}
    Swipe Number Picker Higher Value    ${higher_value}
    Click Modal Done Button

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

Get Glucose Lowest Value
    ${glucoseLowestValue} =    Get Text Until Element Is Visible    xpath=//android.widget.LinearLayout[@resource-id="com.h2sync.android.h2syncapp:id/view_table_glucose_value"]/android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_start"]
    [Return]    ${glucoseLowestValue}

Get Glucose Highest Value
    ${glucoseHighestValue} =    Get Text Until Element Is Visible    xpath=//android.widget.LinearLayout[@resource-id="com.h2sync.android.h2syncapp:id/view_table_glucose_value"]/android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_middle"]
    [Return]    ${glucoseHighestValue}

Get Glucose Average Value
    ${glucoseAverageValue} =    Get Text Until Element Is Visible    xpath=//android.widget.LinearLayout[@resource-id="com.h2sync.android.h2syncapp:id/view_table_glucose_value"]/android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_end"]
    [Return]    ${glucoseAverageValue}

Get Systolic Lowest Value
    ${systolicLowestValue} =    Get Text Until Element Is Visible    xpath=//android.widget.LinearLayout[@resource-id="com.h2sync.android.h2syncapp:id/view_table_systolic_value"]//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_start"]
    [Return]    ${systolicLowestValue}

Get Systolic Highest Value
    ${systolicHighestValue} =    Get Text Until Element Is Visible    xpath=//android.widget.LinearLayout[@resource-id="com.h2sync.android.h2syncapp:id/view_table_systolic_value"]//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_middle"]
    [Return]    ${systolicHighestValue}

Get Systolic Average Value
    ${systolicAverageValue} =    Get Text Until Element Is Visible    xpath=//android.widget.LinearLayout[@resource-id="com.h2sync.android.h2syncapp:id/view_table_systolic_value"]//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_end"]
    [Return]    ${systolicAverageValue}

Get Diastolic Lowest Value
    ${diastolicLowestValue} =    Get Text Until Element Is Visible    xpath=//android.widget.LinearLayout[@resource-id="com.h2sync.android.h2syncapp:id/view_table_diastolic_value"]//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_start"]
    [Return]    ${diastolicLowestValue}

Get Diastolic Highest Value
    ${diastolicHighestValue} =    Get Text Until Element Is Visible    xpath=//android.widget.LinearLayout[@resource-id="com.h2sync.android.h2syncapp:id/view_table_diastolic_value"]//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_middle"]
    [Return]    ${diastolicHighestValue}

Get Diastolic Average Value
    ${diastolicAverageValue} =    Get Text Until Element Is Visible    xpath=//android.widget.LinearLayout[@resource-id="com.h2sync.android.h2syncapp:id/view_table_diastolic_value"]//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_end"]
    [Return]    ${diastolicAverageValue}

Get Pulse Lowest Value
    ${pulseLowestValue} =    Get Text Until Element Is Visible    xpath=//android.widget.LinearLayout[@resource-id="com.h2sync.android.h2syncapp:id/view_table_pulse_value"]//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_start"]
    [Return]    ${pulseLowestValue}

Get Pulse Highest Value
    ${pulseHighestValue} =    Get Text Until Element Is Visible    xpath=//android.widget.LinearLayout[@resource-id="com.h2sync.android.h2syncapp:id/view_table_pulse_value"]//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_middle"]
    [Return]    ${pulseHighestValue}

Get Pulse Average Value
    ${pulseAverageValue} =    Get Text Until Element Is Visible    xpath=//android.widget.LinearLayout[@resource-id="com.h2sync.android.h2syncapp:id/view_table_pulse_value"]//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_end"]
    [Return]    ${pulseAverageValue}

Get Good Distribution Value
    ${value} =    Get Text Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_good_count"]
    [Return]    ${value}

Get High Distribution Value
    ${value} =    Get Text Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_high_count"]
    [Return]    ${value}

Get Low Distribution Value
    ${value} =    Get Text Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_low_count"]
    [Return]    ${value}

Get Total Distribution Value
    ${value} =    Get Text Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_total_count"]
    [Return]    ${value}

Get Error Message Text
    ${value} =    Get Text Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="android:id/message"]
    [Return]    ${value}

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
    ${dashboardPath} =    Set Variable    xpath=//androidx.recyclerview.widget.RecyclerView//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_${dashboard}"]/ancestor::android.widget.FrameLayout
    Scroll Until Dashboard Section Is Visible    ${dashboardPath}
    Click Element Until Element Is Visible    ${dashboardPath}

Click Glucose Dashboard Section
    Click Element Until Element Is Visible    xpath=//androidx.recyclerview.widget.RecyclerView[@resource-id="com.h2sync.android.h2syncapp:id/recycler_view_dashboard"]/android.widget.FrameLayout[1]

Click Pressure Dashboard Section
    Click Element Until Element Is Visible    xpath=//androidx.recyclerview.widget.RecyclerView[@resource-id="com.h2sync.android.h2syncapp:id/recycler_view_dashboard"]/android.widget.FrameLayout[1]

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

Verify Glucose Values Is Correct
    [Arguments]    ${glucoseLowerValue}    ${glucoseHigherValue}    ${glucoseAverageValue}
    ${glucoseLowestValue} =    Get Glucose Lowest Value
    ${glucoseHighestValue} =    Get Glucose Highest Value
    ${glucoseAverageValue} =    Get Glucose Average Value
    Should Be Equal    ${glucoseLowestValue}    ${glucoseLowerValue}
    Should Be Equal    ${glucoseHighestValue}    ${glucoseHigherValue}
    Should Be Equal    ${glucoseAverageValue}    ${glucoseAverageValue}

Verify Distribution Is Correct
    [Arguments]    ${Good}    ${High}    ${Low}    ${Total}
    ${GoodValue} =    Get Good Distribution Value
    ${HighValue} =    Get High Distribution Value
    ${LowValue} =    Get Low Distribution Value
    ${TotalValue} =    Get Total Distribution Value
    Should Be Equal    ${GoodValue}    ${Good}
    Should Be Equal    ${HighValue}    ${High}
    Should Be Equal    ${LowValue}    ${Low}
    Should Be Equal    ${TotalValue}    ${Total}

Verify Pressure Systolic Values Is Correct
    [Arguments]    ${systolicLowerValue}    ${systolicHigherValue}    ${systolicAverageValue}
    ${systolicLowestValue} =    Get Systolic Lowest Value
    ${systolicHighestValue} =    Get Systolic Highest Value
    ${systolicAverageValue} =    Get Systolic Average Value
    Should Be Equal    ${systolicLowestValue}    ${systolicLowerValue}
    Should Be Equal    ${systolicHighestValue}    ${systolicHigherValue}
    Should Be Equal    ${systolicAverageValue}    ${systolicAverageValue}

Verify Pressure Diastolic Values Is Correct
    [Arguments]    ${diastolicLowerValue}    ${diastolicHigherValue}    ${diastolicAverageValue}
    ${diastolicLowestValue} =    Get Diastolic Lowest Value
    ${diastolicHighestValue} =    Get Diastolic Highest Value
    ${diastolicAverageValue} =    Get Diastolic Average Value
    Should Be Equal    ${diastolicLowestValue}    ${diastolicLowerValue}
    Should Be Equal    ${diastolicHighestValue}    ${diastolicHigherValue}
    Should Be Equal    ${diastolicAverageValue}    ${diastolicAverageValue}

Verify Pressure Pulse Values Is Correct
    [Arguments]    ${pulseLowerValue}    ${pulseHigherValue}    ${pulseAverageValue}
    Scroll Until Text Element Is Visible    Pulse Trends
    ${pulseLowestValue} =    Get Pulse Lowest Value
    ${pulseHighestValue} =    Get Pulse Highest Value
    ${pulseAverageValue} =    Get Pulse Average Value
    Should Be Equal    ${pulseLowestValue}    ${pulseLowerValue}
    Should Be Equal    ${pulseHighestValue}    ${pulseHigherValue}
    Should Be Equal    ${pulseAverageValue}    ${pulseAverageValue}

Verify Warning Message High End Should Be Higher Than The Low End
    ${errorMsg} =    Get Error Message Text
    Should Be Equal    ${errorMsg}    The high end of the range should be higher than the low end.