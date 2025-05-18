*** Settings ***
Library    AppiumLibrary
Resource   ../keywords/common_keywords.robot

*** Keywords ***
Click Add Diary Menu
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/tab_add_diary"]

Click Blood Glucose Diary
    Click Element Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="com.h2sync.android.h2syncapp:id/view_item_blood_glucose"]

Click Done Button
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/button_done"]

Enter Blood Glucose
    [Arguments]    ${bloodGlucose}
    Input Text Until Element Is Visible     xpath=//android.widget.EditText[@resource-id="com.h2sync.android.h2syncapp:id/edit_value"]    ${bloodGlucose}

Create Glucose Diary
    [Arguments]    ${bloodGlucose}
    Click Add Diary Menu
    Click Blood Glucose Diary
    Enter Blood Glucose    ${bloodGlucose} 
    Click Done Button
    
Delete Glucose Diary
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/layout_title_section"]
    Click Element Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_diary_delete"]
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="android:id/button1"]

Verify Glucose Diary Is Correct
    [Arguments]    ${bloodGlucose}
    Verify Text Element Is Equal To Expected Value    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_item_title"]    Blood Glucose
    Verify Text Element Is Equal To Expected Value    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_item_value"]    ${bloodGlucose} mg/dL

Create Diary Entry Guide
    Click Add Diary Menu
    Click Add Diary Entry Guide Button
    Click "Start" Button
    Edit Disease History    Pre-Diabetes    High Blood Pressure    Depression
    Edit Height    180
    Edit Weight    75
    Click "Confirm" Button
    Select Devices    Glucose Meter    Blood Pressure Monitor    Weight Scale
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_title" and @text="Logging makes disease management easier!"]    15
    Scroll To Bottom Of Layout Container
    &{suggestions} =    Create Dictionary
    ...     Blood Glucose=2
    ...     Blood Pressure=7
    ...     Weight=1
    Verify Suggestion Result Are Correct    &{suggestions}

Reset Diary Entry Guide
    Click "Reset" Button

Click Add Diary Entry Guide Button
    Click Element Until Element Is Visible    xpath=//android.widget.ImageView[@resource-id="com.h2sync.android.h2syncapp:id/image_suggestion_arrow"]

Click "Start" Button
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/button_start"]

Edit Disease History
    [Arguments]    @{options}
    Click Element Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_edit_content"]
    FOR    ${option}    IN    @{options}
        ${checkbox} =    Set Variable    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_title" and @text="${option}"]/preceding-sibling::android.widget.CheckBox
        ${status} =    Get Element Attribute    ${checkbox}    checked
        Log    ${status}
        IF    '${status}' == 'false'
            Click Element Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_title" and @text="${option}"]
        END
    END
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/button_confirm"]

Edit Height
    [Arguments]    ${height}
    Click Element Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_title" and @text="Height"]/following-sibling::android.widget.FrameLayout//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_edit_content"]
    Input Text Until Element Is Visible    xpath=//android.widget.EditText[@resource-id="com.h2sync.android.h2syncapp:id/edit_value"]    ${height}
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/button_complete"]

Edit Weight
    [Arguments]    ${weight}
    Click Element Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_title" and @text="Weight"]/following-sibling::android.widget.FrameLayout//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_edit_content"]
    Input Text Until Element Is Visible    xpath=//android.widget.EditText[@resource-id="com.h2sync.android.h2syncapp:id/edit_value"]    ${weight}
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/button_complete"]

Click "Confirm" Button
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/button_confirm"]
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="android:id/button1"]

Select Devices
    [Arguments]    @{devices}
    FOR    ${device}    IN    @{devices}
        Click Element Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_title" and @text="${device}"]
    END
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/button_confirm"]

Scroll To Bottom Of Layout Container
    # These coordinates are based on the bounds [0,0][1080,2400]
    ${start_x}=    Set Variable    540         # Middle of the width (1080/2)
    ${start_y}=    Set Variable    2000        # Near the bottom (e.g., 2400 - 400)
    ${end_x}=      Set Variable    540         # Same x (vertical swipe)
    ${end_y}=      Set Variable    400         # Near the top (e.g., 0 + 400)
    Swipe    ${start_x}    ${start_y}    ${end_x}    ${end_y}    800

Verify Suggestion Result Are Correct
    [Arguments]    &{suggestions}
    FOR    ${option}    ${value}    IN    &{suggestions}
        Verify Text Element Is Equal To Expected Value    xpath=//android.widget.TextView[@text='${option}']/ancestor::android.view.ViewGroup//android.widget.TextView[@resource-id='com.h2sync.android.h2syncapp:id/text_weekly_record']    ${value} times a week
    END

Click "Reset" Button
    Click Element Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_reset"]
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="android:id/button1"]
    Wait Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/button_start"]    10