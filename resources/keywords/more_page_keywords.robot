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

Verify Health Report Is Exported
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="android:id/message" and @text="Your data will be sent shortly."]

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
    Click "Goals" Option
    Scroll To Bottom Of Page
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_value" and @text="${steps}"]

Verify Weekly Exercise Time Goal Is Changed
    [Arguments]    ${time}
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_value" and @text="${time}"]

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

Increase Breakfast Routine By 1 Hour
    Click "Breakfast" Option
    Increase Time Slider By 1 Hour
    Click "Done" Button

Click "Breakfast" Option
    Click Element Until Element Is Visible    xpath=//android.widget.LinearLayout[@resource-id="com.h2sync.android.h2syncapp:id/view_routine_breakfast"]/android.widget.LinearLayout

Increase Lunch Routine By 1 Hour
    Click "Lunch" Option
    Increase Time Slider By 1 Hour
    Click "Done" Button

Click "Lunch" Option
    Click Element Until Element Is Visible    xpath=//android.widget.LinearLayout[@resource-id="com.h2sync.android.h2syncapp:id/view_routine_lunch"]/android.widget.LinearLayout

Increase Dinner Routine By 1 Hour
    Click "Dinner" Option
    Increase Time Slider By 1 Hour
    Click "Done" Button

Click "Dinner" Option
    Click Element Until Element Is Visible    xpath=//android.widget.LinearLayout[@resource-id="com.h2sync.android.h2syncapp:id/view_routine_dinner"]/android.widget.LinearLayout

Increase Bed Time Routine By 1 Hour
    Click "Bed Time" Option
    Increase Time Slider By 1 Hour
    Click "Done" Button

Click "Bed Time" Option
    Click Element Until Element Is Visible    xpath=//android.widget.LinearLayout[@resource-id="com.h2sync.android.h2syncapp:id/view_routine_bed"]/android.widget.LinearLayout

Increase Every Daily Routine By 1 Hour
    Increase Wake Up Routine By 1 Hour
    Increase Breakfast Routine By 1 Hour
    Increase Lunch Routine By 1 Hour
    Increase Dinner Routine By 1 Hour
    Increase Bed Time Routine By 1 Hour
    Click "Done" Button

Verify Daily Routines Are Modified
    Click "Daily Routine" Option
    Wake Up Routine Should Be    08:00
    Breakfast Routine Should Be    09:00
    Lunch Routine Should Be    13:00
    Dinner Routine Should Be    19:00
    Bed Time Routine Should Be    23:00

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

Decrease Wake Up Routine By 1 Hour
    Click "Wake Up" Option
    Decrease Time Slider By 1 Hour
    Click "Done" Button

Decrease Breakfast Routine By 1 Hour
    Click "Breakfast" Option
    Decrease Time Slider By 1 Hour
    Click "Done" Button

Decrease Lunch Routine By 1 Hour
    Click "Lunch" Option
    Decrease Time Slider By 1 Hour
    Click "Done" Button

Decrease Dinner Routine By 1 Hour
    Click "Dinner" Option
    Decrease Time Slider By 1 Hour
    Click "Done" Button

Decrease Bed Time Routine By 1 Hour
    Click "Bed Time" Option
    Decrease Time Slider By 1 Hour
    Click "Done" Button

Decrease Every Daily Routine By 1 Hour
    Decrease Wake Up Routine By 1 Hour
    Decrease Breakfast Routine By 1 Hour
    Decrease Lunch Routine By 1 Hour
    Decrease Dinner Routine By 1 Hour
    Decrease Bed Time Routine By 1 Hour
    Click "Done" Button