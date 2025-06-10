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

Enter Email
    [Arguments]    ${email}
    Input Text Until Element Is Visible  xpath=//android.widget.EditText[@resource-id="com.h2sync.android.h2syncapp:id/edittext_email"]   ${email}

Click "Send" Button
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/send_report"]

Click "Confirm" Button
    ${status}=    Run Keyword And Return Status    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="android:id/button1" and @text="Confirm"]
    Run Keyword If    not ${status}    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/button_confirm"]

Verify Health Report Is Sent
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="android:id/message" and @text="Your data will be sent shortly."]

Verify Health Report Is Not Sent
    ${errorMsg} =    Get Error Message Text
    Should Be Equal    ${errorMsg}    No email

Click "Yes" Button
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="android:id/button1" and @text="Yes"]

Click "Favorite Food" Option
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/view_favorite_foods"]/android.view.ViewGroup

Click "Create New Food" Button
    Click Element Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/label_title" and @text="Create New Food"]

Enter Food Name
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

Click "Goals" Option
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/view_goals"]/android.view.ViewGroup

Modify Daily Steps
    [Arguments]    ${steps}
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/view_exercise_steps"]/android.view.ViewGroup
    Enter Daily Steps    ${steps}
    Click "Save" Button

Enter Daily Steps
    [Arguments]    ${steps}
    Input Text Until Element Is Visible    xpath=//android.widget.EditText[@resource-id="com.h2sync.android.h2syncapp:id/edit_text_value"]    ${steps}

Click "Save" Button
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/button_save"]

Modify Weekly Exercise Time
    [Arguments]    ${time}
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/view_exercise_minutes"]/android.view.ViewGroup
    Enter Weekly Exercise Time    ${time}
    Click "Save" Button

Enter Weekly Exercise Time
    [Arguments]    ${time}
    Input Text Until Element Is Visible    xpath=//android.widget.EditText[@resource-id="com.h2sync.android.h2syncapp:id/edit_text_value"]    ${time}

Verify Daily Steps Goal Is Changed
    [Arguments]    ${steps}
    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[.//android.widget.TextView[@text="Daily Steps"]]/following-sibling::android.widget.TextView[@text="${steps}"]

Verify Weekly Exercise Time Goal Is Changed
    [Arguments]    ${time}
    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[.//android.widget.TextView[@text="Weekly Exercise Time"]]/following-sibling::android.widget.TextView[@text="${time}"]

Change Daily Steps And Weekly Exercise Time To Original Value
    Modify Daily Steps    7500
    Modify Weekly Exercise Time    150
    Click "Confirm" Button

Click "Daily Routine" Option
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/view_daily_routine"]/android.view.ViewGroup

Increase Time Slider By 1 Hour
    # These coordinates are based on the bounds [0,0][1080,2400]
    ${start_x}=    Set Variable    438         # Current hour x position
    ${start_y}=    Set Variable    1980        # Current hour y position
    ${end_x}=      Set Variable    540         # Same x (vertical swipe)
    ${end_y}=      Set Variable    1820        # Slide by 1 hour to the top
    Swipe    ${start_x}    ${start_y}    ${end_x}    ${end_y}    800

Decrease Time Slider By 1 Hour
    # These coordinates are based on the bounds [0,0][1080,2400]
    ${start_x}=    Set Variable    438         # Current hour x position
    ${start_y}=    Set Variable    1980        # Current hour y position
    ${end_x}=      Set Variable    540         # Same x (vertical swipe)
    ${end_y}=      Set Variable    2140        # Slide by 1 hour to the bottom
    Swipe    ${start_x}    ${start_y}    ${end_x}    ${end_y}    800

Increase Wake Up Routine By 1 Hour
    Click "Wake Up" Option
    Increase Time Slider By 1 Hour
    Click "Done" Button

Click "Wake Up" Option
    Click Element Until Element Is Visible    xpath=//android.widget.LinearLayout[@resource-id="com.h2sync.android.h2syncapp:id/view_routine_wake_up"]/android.widget.LinearLayout

Click "Done" Button
    ${status}=    Run Keyword And Return Status    Click Element Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/button_right" and @text="Done"]
    Run Keyword If    not ${status}    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/button_confirm"]

Click "Breakfast" Option
    Click Element Until Element Is Visible    xpath=//android.widget.LinearLayout[@resource-id="com.h2sync.android.h2syncapp:id/view_routine_breakfast"]/android.widget.LinearLayout

Click "Lunch" Option
    Click Element Until Element Is Visible    xpath=//android.widget.LinearLayout[@resource-id="com.h2sync.android.h2syncapp:id/view_routine_lunch"]/android.widget.LinearLayout

Click "Dinner" Option
    Click Element Until Element Is Visible    xpath=//android.widget.LinearLayout[@resource-id="com.h2sync.android.h2syncapp:id/view_routine_dinner"]/android.widget.LinearLayout

Click "Bed Time" Option
    Click Element Until Element Is Visible    xpath=//android.widget.LinearLayout[@resource-id="com.h2sync.android.h2syncapp:id/view_routine_bed"]/android.widget.LinearLayout

Wake Up Routine Should Be
    [Arguments]    ${time}
    Wait Until Element Is Visible    xpath=//android.widget.LinearLayout[@resource-id="com.h2sync.android.h2syncapp:id/view_routine_wake_up"]//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_daily_routine_time" and @text="${time}"]

Breakfast Routine Should Be
    [Arguments]    ${time}
    Wait Until Element Is Visible    xpath=//android.widget.LinearLayout[@resource-id="com.h2sync.android.h2syncapp:id/view_routine_breakfast"]//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_daily_routine_time" and @text="${time}"]

Lunch Routine Should Be
    [Arguments]    ${time}
    Wait Until Element Is Visible    xpath=//android.widget.LinearLayout[@resource-id="com.h2sync.android.h2syncapp:id/view_routine_lunch"]//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_daily_routine_time" and @text="${time}"]

Dinner Routine Should Be
    [Arguments]    ${time}
    Wait Until Element Is Visible    xpath=//android.widget.LinearLayout[@resource-id="com.h2sync.android.h2syncapp:id/view_routine_dinner"]/android.widget.LinearLayout//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_daily_routine_time" and @text="${time}"]

Bed Time Routine Should Be
    [Arguments]    ${time}
    Wait Until Element Is Visible    xpath=//android.widget.LinearLayout[@resource-id="com.h2sync.android.h2syncapp:id/view_routine_bed"]/android.widget.LinearLayout//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_daily_routine_time" and @text="${time}"]

### Copied from dashboard_information_keywords ###

Click Before Meal Option
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/view_glucose_before_meal"]

Click After Meal Option
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/view_glucose_after_meal"]

Click Bedtime Option
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/view_glucose_bedtime"]

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
    [Documentation]    Same as Dashboard Information Keyword
    [Arguments]    ${lower_value}    ${higher_value}
    Click Before Meal Option
    Swipe Number Picker Lower Value    ${lower_value}
    Swipe Number Picker Higher Value    ${higher_value}
    Click "Done" Button

Enter After Meal Values
    [Arguments]    ${lower_value}    ${higher_value}
    Click After Meal Option
    Swipe Number Picker Lower Value    ${lower_value}
    Swipe Number Picker Higher Value    ${higher_value}
    Click "Done" Button

Enter Bedtime Values
    [Arguments]    ${lower_value}    ${higher_value}
    Click Bedtime Option
    Swipe Number Picker Lower Value    ${lower_value}
    Swipe Number Picker Higher Value    ${higher_value}
    Click "Done" Button

Verify Before Meal Goal Is Changed
    [Arguments]    ${lower_value}    ${higher_value}
    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[.//android.widget.TextView[@text="Before Meal"]]/following-sibling::android.widget.TextView[@text="${lower_value} - ${higher_value}"]

Verify After Meal Goal Is Changed
    [Arguments]    ${lower_value}    ${higher_value}
    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[.//android.widget.TextView[@text="After Meal"]]/following-sibling::android.widget.TextView[@text="${lower_value} - ${higher_value}"]

Verify Bedtime Goal Is Changed
    [Arguments]    ${lower_value}    ${higher_value}
    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[.//android.widget.TextView[@text="Bedtime"]]/following-sibling::android.widget.TextView[@text="${lower_value} - ${higher_value}"]

Get Error Message Text
    ${value} =    Get Text Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="android:id/message"]
    [Return]    ${value}

Verify Warning Message High End Should Be Higher Than The Low End
    ${errorMsg} =    Get Error Message Text
    Should Be Equal    ${errorMsg}    The high end of the range should be higher than the low end.

Click Dialog OK Button
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="android:id/button1"]

#####################

Page Title Should Be
    [Arguments]    ${pageTitle}
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/toolbar"]//android.widget.TextView[@text="${pageTitle}"]

Verify Favorite Food Is Not Created
    Page Title Should Be    Create Favorite Food

Click X Button
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/toolbar"]//android.widget.ImageButton

Click Arrow Back Button
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/toolbar"]//android.widget.ImageButton

Enter Wake Up Values
    [Arguments]    ${hour}    ${minute}
    Click "Wake Up" Option
    Swipe Number Picker Lower Value    ${hour}
    Swipe Number Picker Higher Value    ${minute}
    Click "Done" Button

Enter Breakfast Values
    [Arguments]    ${hour}    ${minute}
    Click "Breakfast" Option
    Swipe Number Picker Lower Value    ${hour}
    Swipe Number Picker Higher Value    ${minute}
    Click "Done" Button

Enter Lunch Values
    [Arguments]    ${hour}    ${minute}
    Click "Lunch" Option
    Swipe Number Picker Lower Value    ${hour}
    Swipe Number Picker Higher Value    ${minute}
    Click "Done" Button

Enter Dinner Values
    [Arguments]    ${hour}    ${minute}
    Click "Dinner" Option
    Swipe Number Picker Lower Value    ${hour}
    Swipe Number Picker Higher Value    ${minute}
    Click "Done" Button

Enter Bed Time Values In Routine
    [Arguments]    ${hour}    ${minute}
    Click "Bed Time" Option
    Swipe Number Picker Lower Value    ${hour}
    Swipe Number Picker Higher Value    ${minute}
    Click "Done" Button

Verify Wake Up Daily Routine Is Changed
    [Arguments]    ${time}
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_daily_routine_title" and @text="Wake Up"]/following-sibling::android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_daily_routine_time" and @text="${time}"]

Verify Breakfast Daily Routine Is Changed
    [Arguments]    ${time}
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_daily_routine_title" and @text="Breakfast"]/following-sibling::android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_daily_routine_time" and @text="${time}"]

Verify Lunch Daily Routine Is Changed
    [Arguments]    ${time}
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_daily_routine_title" and @text="Lunch"]/following-sibling::android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_daily_routine_time" and @text="${time}"]

Verify Dinner Daily Routine Is Changed
    [Arguments]    ${time}
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_daily_routine_title" and @text="Dinner"]/following-sibling::android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_daily_routine_time" and @text="${time}"]

Verify Bed Time Daily Routine Is Changed
    [Arguments]    ${time}
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_daily_routine_title" and @text="Bed Time"]/following-sibling::android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_daily_routine_time" and @text="${time}"]

Verify Warning Message Lunch Should Be Between Breakfast And Dinner
    ${errorMsg} =    Get Error Message Text
    Should Be Equal    ${errorMsg}    Lunch time should be between breakfast time and dinner time

Verify Warning Message Dinner Should Be Between Lunch And Bedtime
    ${errorMsg} =    Get Error Message Text
    Should Be Equal    ${errorMsg}    Dinner time should be between lunch time and bedtime

Click Dialog Close Button
    [Documentation]    Same as Click Dialog OK Button
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="android:id/button1"]