*** Settings ***
Library    AppiumLibrary
Resource   ../keywords/common_keywords.robot

*** Keywords ***
Click Add Diary Menu
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/tab_add_diary"]

Click Blood Glucose Diary
    Click Element Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="com.h2sync.android.h2syncapp:id/view_item_blood_glucose"]

Click Pressure Diary
    Click Element Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_diary_entry_item" and @text="Pressure"]

Click Weight Diary
    Click Element Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_diary_entry_item" and @text="Weight"]

Click Add Medication Diary
    Click Element Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_diary_entry_item" and @text="Medication"]


Click Done Button
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/button_done"]

Enter Blood Glucose
    [Arguments]    ${bloodGlucose}
    Input Text Until Element Is Visible     xpath=//android.widget.EditText[@resource-id="com.h2sync.android.h2syncapp:id/edit_value"]    ${bloodGlucose}

Enter Pressure
    [Arguments]    ${systolic}    ${diastolic}    ${pulse}
    Input Text Until Element Is Visible    xpath=(//android.widget.EditText[@resource-id="com.h2sync.android.h2syncapp:id/edit_value"])[1]    ${systolic}
    Input Text Until Element Is Visible    xpath=(//android.widget.EditText[@resource-id="com.h2sync.android.h2syncapp:id/edit_value"])[2]    ${diastolic}
    Input Text Until Element Is Visible    xpath=(//android.widget.EditText[@resource-id="com.h2sync.android.h2syncapp:id/edit_value"])[3]    ${pulse}
    
Enter Weight     
    [Arguments]     ${weight}  ${body_fat}
    Input Text Until Element Is Visible    xpath=(//android.widget.EditText[@resource-id="com.h2sync.android.h2syncapp:id/edit_value"])[1]   ${weight}
    Input Text Until Element Is Visible    xpath=(//android.widget.EditText[@resource-id="com.h2sync.android.h2syncapp:id/edit_value"])[2]    ${body_fat}

Enter Insulin/GLP-1 Medication Value
    [Arguments]     ${carbs}  ${unit}
    Wait Until Element Is Visible    xpath=(//android.widget.EditText[@resource-id="com.h2sync.android.h2syncapp:id/edit_serving"])[1] 
    Clear Text    xpath=(//android.widget.EditText[@resource-id="com.h2sync.android.h2syncapp:id/edit_serving"])[1] 
    Input Text Until Element Is Visible      xpath=(//android.widget.EditText[@resource-id="com.h2sync.android.h2syncapp:id/edit_serving"])[1]    ${carbs}
    Wait Until Element Is Visible    xpath=(//android.widget.EditText[@resource-id="com.h2sync.android.h2syncapp:id/edit_serving"])[2]
    Clear Text    xpath=(//android.widget.EditText[@resource-id="com.h2sync.android.h2syncapp:id/edit_serving"])[2]
    Input Text Until Element Is Visible      xpath=(//android.widget.EditText[@resource-id="com.h2sync.android.h2syncapp:id/edit_serving"])[2]    ${unit}  

Enter Oral Medication Value
    [Arguments]     ${tablets}
    Wait Until Element Is Visible    //android.widget.EditText[@resource-id="com.h2sync.android.h2syncapp:id/edit_serving"]
    Clear Text    //android.widget.EditText[@resource-id="com.h2sync.android.h2syncapp:id/edit_serving"]
    Input Text    //android.widget.EditText[@resource-id="com.h2sync.android.h2syncapp:id/edit_serving"]    ${tablets}




Choose Date
    [Arguments]    ${time}
    Wait Until Element Is Visible    //android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_date"]    10s
    Click Element    //android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_date"]

    Run Keyword If    '${time}' == 'past'    Wait Until Element Is Visible    //android.widget.ImageButton[@content-desc="Previous month"]    10s
    Run Keyword If    '${time}' == 'past'    Click Element    //android.widget.ImageButton[@content-desc="Previous month"]
    Run Keyword If    '${time}' == 'past'    Wait Until Element Is Visible    //android.view.View[@resource-id="android:id/month_view"]//android.view.View    10s
    Run Keyword If    '${time}' == 'past'    Click Element    //android.view.View[@resource-id="android:id/month_view"]//android.view.View

    Wait Until Element Is Visible    //android.widget.Button[@resource-id="android:id/button1"]    10s
    Click Element    //android.widget.Button[@resource-id="android:id/button1"]

Choose Period
    [Arguments]    ${period}
    Wait Until Element Is Visible    //android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_period"]   10s
    Click Element    //android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_period"]

    # 確保一開始滑動到最頂部，直到文字為 "Wake-up"
    Log    Scrolling to the top of the list until text is 'Wake-up'
    WHILE    True
        Wait Until Keyword Succeeds    5x    1s    Element Should Be Visible    //android.widget.EditText[@resource-id="android:id/numberpicker_input"]

        ${is_element_present}=    Run Keyword And Return Status    Element Should Be Visible    //android.widget.EditText[@resource-id="android:id/numberpicker_input"]
        Run Keyword If    '${is_element_present}' == 'False'    Run Keywords    Log    "Element not found, stopping scroll"    AND    Exit For Loop

        ${current_text}=    Get Text    //android.widget.EditText[@resource-id="android:id/numberpicker_input"]
        Log    Current text: ${current_text}

        Run Keyword If    '${current_text}' == 'Wake-up'    Run Keywords    Log    "Reached the top of the list: Wake-up found"    AND    Exit For Loop

        Swipe    540    2000    540    2200    300
    END

    # 滾動直到匹配到目標選項或滑到底部（Other）
    WHILE    True
        Wait Until Keyword Succeeds    5x    1s    Element Should Be Visible    //android.widget.EditText[@resource-id="android:id/numberpicker_input"]

        ${is_element_present}=    Run Keyword And Return Status    Element Should Be Visible    //android.widget.EditText[@resource-id="android:id/numberpicker_input"]
        Run Keyword If    '${is_element_present}' == 'False'    Run Keywords    Log    "Element not found, stopping scroll"    AND    Exit For Loop

        ${current_text}=    Get Text    //android.widget.EditText[@resource-id="android:id/numberpicker_input"]
        Log    Current text: ${current_text}

        Run Keyword If    '${current_text}' == '${period}'    Run Keywords    Log    "Matched target period: ${current_text}"    AND    Exit For Loop

        Run Keyword If    '${current_text}' == 'Other'    Run Keywords    Log    "Reached the bottom of the list: Other"    AND    Exit For Loop

        Swipe    540    2000    540    1800    300
    END

    Run Keyword If    '${current_text}' == 'Other' and '${current_text}' != '${period}'    Click Element    //android.widget.EditText[@resource-id="android:id/numberpicker_input"]

    Wait Until Element Is Visible    //android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/button_right"]    10s
    Click Element    //android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/button_right"]

Choose Insulin/GLP-1 Medication
    [Arguments]    ${medication_content}
    Click Element Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_select_medication"]
    Click Element Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/title" and @text="Insulin/GLP-1"]

    WHILE    True
        ${is_element_present}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//android.widget.CheckBox[@resource-id="com.h2sync.android.h2syncapp:id/check_box_medication" and @text="${medication_content}"]
        Run Keyword If    '${is_element_present}' == 'True'    Run Keywords    Log    "Found target medication: ${medication_content}"    AND    Click Element    xpath=//android.widget.CheckBox[@resource-id="com.h2sync.android.h2syncapp:id/check_box_medication" and @text="${medication_content}"]    AND    Exit For Loop
        ${last_element_text}=    Get Text    xpath=(//androidx.recyclerview.widget.RecyclerView[@resource-id="com.h2sync.android.h2syncapp:id/recycler_view_medicine"]/android.widget.RelativeLayout[last()])//android.widget.CheckBox[@resource-id="com.h2sync.android.h2syncapp:id/check_box_medication"]
        Log    Current last element text: ${last_element_text}
        Run Keyword If    '${last_element_text}' == 'Xultophy®'    Run Keywords    Log    "Reached the bottom of the list: Xultophy®"    AND    Exit For Loop
        Swipe    553    2040    553    610   300
    END
    
    Run Keyword If    '${is_element_present}' == 'False'    Log    "Target medication not found: ${medication_content}, exiting process."    
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/button_bottom"]

Choose Oral Medication
    [Arguments]    ${medication_content}
    Click Element Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_select_medication"]
    Click Element Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/title" and @text="Oral"]

    WHILE    True
        ${is_element_present}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//android.widget.CheckBox[@resource-id="com.h2sync.android.h2syncapp:id/check_box_medication" and @text="${medication_content}"]
        Run Keyword If    '${is_element_present}' == 'True'    Run Keywords    Log    "Found target medication: ${medication_content}"    AND    Click Element    xpath=//android.widget.CheckBox[@resource-id="com.h2sync.android.h2syncapp:id/check_box_medication" and @text="${medication_content}"]    AND    Exit For Loop
        ${last_element_text}=    Get Text    xpath=(//androidx.recyclerview.widget.RecyclerView[@resource-id="com.h2sync.android.h2syncapp:id/recycler_view_medicine"]/android.widget.RelativeLayout[last()])//android.widget.CheckBox[@resource-id="com.h2sync.android.h2syncapp:id/check_box_medication"]
        Log    Current last element text: ${last_element_text}
        Run Keyword If    '${last_element_text}' == 'Vildagliptin / Metformin - 50 mg/850 mg'    Run Keywords    Log    "Reached the bottom of the list: Vildagliptin / Metformin - 50 mg/850 mg"    AND    Exit For Loop
        Swipe    553    2040    553    610   300
    END
    
    Run Keyword If    '${is_element_present}' == 'False'    Log    "Target medication not found: ${medication_content}, exiting process."    
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/button_bottom"]



Reset Insulin/GLP-1 Medication
    [Arguments]    ${medication_content}
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/layout_title_section"]
    Click Element Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_select_medication"]
    Click Element Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/title" and @text="Insulin/GLP-1"]

    WHILE    True
        ${is_element_present}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//android.widget.CheckBox[@resource-id="com.h2sync.android.h2syncapp:id/check_box_medication" and @text="${medication_content}"]
        Run Keyword If    '${is_element_present}' == 'True'    Run Keywords    Log    "Found target medication: ${medication_content}"    AND    Click Element    xpath=//android.widget.CheckBox[@resource-id="com.h2sync.android.h2syncapp:id/check_box_medication" and @text="${medication_content}"]    AND    Exit For Loop
        ${last_element_text}=    Get Text    xpath=(//androidx.recyclerview.widget.RecyclerView[@resource-id="com.h2sync.android.h2syncapp:id/recycler_view_medicine"]/android.widget.RelativeLayout[last()])//android.widget.CheckBox[@resource-id="com.h2sync.android.h2syncapp:id/check_box_medication"]
        Log    Current last element text: ${last_element_text}
        Run Keyword If    '${last_element_text}' == 'Xultophy®'    Run Keywords    Log    "Reached the bottom of the list: Xultophy®"    AND    Exit For Loop
        Swipe    553    2040    553    610   300
    END

    Run Keyword If    '${is_element_present}' == 'False'    Log    "Target medication not found: ${medication_content}, exiting process."
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/button_bottom"]
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/button_cancel"]

Reset Oral Medication
    [Arguments]    ${medication_content}
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/layout_title_section"]
    Click Element Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_select_medication"]
    Click Element Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/title" and @text="Oral"]

    WHILE    True
        ${is_element_present}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//android.widget.CheckBox[@resource-id="com.h2sync.android.h2syncapp:id/check_box_medication" and @text="${medication_content}"]
        Run Keyword If    '${is_element_present}' == 'True'    Run Keywords    Log    "Found target medication: ${medication_content}"    AND    Click Element    xpath=//android.widget.CheckBox[@resource-id="com.h2sync.android.h2syncapp:id/check_box_medication" and @text="${medication_content}"]    AND    Exit For Loop
        ${last_element_text}=    Get Text    xpath=(//androidx.recyclerview.widget.RecyclerView[@resource-id="com.h2sync.android.h2syncapp:id/recycler_view_medicine"]/android.widget.RelativeLayout[last()])//android.widget.CheckBox[@resource-id="com.h2sync.android.h2syncapp:id/check_box_medication"]
        Log    Current last element text: ${last_element_text}
        Run Keyword If    '${last_element_text}' == 'Vildagliptin / Metformin - 50 mg/850 mg'    Run Keywords    Log    "Reached the bottom of the list: Vildagliptin / Metformin - 50 mg/850 mg"    AND    Exit For Loop
        Swipe    553    2040    553    610   300
    END

    Run Keyword If    '${is_element_present}' == 'False'    Log    "Target medication not found: ${medication_content}, exiting process."
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/button_bottom"]
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/button_cancel"]

Create Glucose Diary
    [Arguments]    ${bloodGlucose}  ${time}  ${period}
    Click Add Diary Menu
    Click Blood Glucose Diary
    Choose Date   ${time}
    Choose Period   ${period}
    Enter Blood Glucose    ${bloodGlucose} 
    Click Done Button

Create Pressure Diary
    [Arguments]    ${systolic}  ${diastolic}   ${pulse}  ${time}  ${period}
    Click Add Diary Menu
    Click Pressure Diary
    Choose Date   ${time}
    Choose Period   ${period}
    Enter Pressure     ${systolic}  ${diastolic}  ${pulse}
    Click Done Button

Create Weight Diary 
    [Arguments]    ${weight}  ${body_fat}   ${time}  ${period}
    Click Add Diary Menu
    Click Weight Diary
    Choose Date   ${time}
    Choose Period   ${period}
    Enter Weight     ${weight}  ${body_fat}
    Click Done Button

Create Insulin/GLP-1 Medication Diary
    [Arguments]   ${medication_content}  ${carbs}  ${unit}  ${time}  ${period}
    Click Add Diary Menu
    Click Add Medication Diary
    Choose Date   ${time}
    Choose Period   ${period}
    Choose Insulin/GLP-1 Medication    ${medication_content}
    Enter Insulin/GLP-1 Medication Value  ${carbs}  ${unit}
    Click Done Button
    Reset Insulin/GLP-1 Medication  ${medication_content}

Create Oral Medication Diary
    [Arguments]   ${medication_content}  ${tablets}  ${time}  ${period}
    Click Add Diary Menu
    Click Add Medication Diary
    Choose Date   ${time}
    Choose Period   ${period}
    Choose Oral Medication    ${medication_content}
    Enter Oral Medication Value  ${tablets}  
    Click Done Button
    Reset Oral Medication  ${medication_content}


    
Delete Diary
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/layout_title_section"]
    Click Element Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_diary_delete"]
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="android:id/button1"]

Verify Glucose Diary Is Correct
    [Arguments]    ${bloodGlucose}
    Verify Text Element Is Equal To Expected Value    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_item_title"]    Blood Glucose
    Verify Text Element Is Equal To Expected Value    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_item_value"]    ${bloodGlucose} mg/dL

Verify Pressure Is Correct
    [Arguments]    ${systolic}    ${diastolic}    ${pulse}    
    ${expected_value}=    Set Variable    ${systolic}/${diastolic} mmHg ${pulse} bpm
    Verify Text Element Is Equal To Expected Value    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_item_title"]    Blood Pressure & Pulse
    Verify Text Element Is Equal To Expected Value    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_item_value"]    ${expected_value}
    
Verify Weight Is Correct
    [Arguments]    ${weight}    ${body_body_fat}
    ${expected_value}=    Set Variable    ${weight} kg ${body_body_fat} %
    Verify Text Element Is Equal To Expected Value    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_item_title"]    Weight & Body Fat
    Verify Text Element Is Equal To Expected Value    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_item_value"]    ${expected_value}


Verify Insulin/GLP-1 Medication Is Correct
    [Arguments]    ${medication_content}    ${carbs}    ${units}
    Verify Text Element Is Equal To Expected Value    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_item_title"]    Medication

    ${expected_carbs_text}=    Set Variable    Carbs ${carbs} g
    Run Keyword If    '${carbs}' != ''    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="${expected_carbs_text}"]
   
    ${expected_medication_text}=    Set Variable    ${medication_content}
    Run Keyword If    '${units}' != ''    Set Test Variable    ${expected_medication_text}     ${medication_content} - ${units} units
    Sleep  3s
    Log To Console    Current value of unit: ${units}
    Log To Console    Current value of expected medication text: ${expected_medication_text}
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="${expected_medication_text}"]

Verify Oral Medication Is Correct
    [Arguments]    ${medication_content}    ${tablets}    
    Verify Text Element Is Equal To Expected Value    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_item_title"]    Medication
   
    ${expected_medication_text}=    Set Variable    ${medication_content}
    Run Keyword If    '${tablets}' != ''    Set Test Variable    ${expected_medication_text}    ${medication_content} - ${tablets} tablets
    Sleep  3s
    Log To Console    Current value of tablets: ${tablets}
    Log To Console    Current value of expected medication text: ${expected_medication_text}
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="${expected_medication_text}"]




Click Exercise Diary
    Click Element Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="com.h2sync.android.h2syncapp:id/view_item_exercise"]

Select Jogging Checkbox
    Click Element Until Element Is Visible    xpath=//android.widget.CheckBox[@resource-id="com.h2sync.android.h2syncapp:id/check_box_exercise" and @text="Jogging"]

Swipe Add 5 Minutes In Exercise
    Sleep    1s
    Swipe    674    2131    674    1981    800

Confirm Time In Exercise
    Click Element Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/button_right"]

Create Execise Diary
    Click Add Diary Menu
    Click Exercise Diary
    Select Jogging Checkbox
    Swipe Add 5 Minutes In Exercise
    Confirm Time In Exercise
    Click Done Button

Clear Exercise time
    Click Element Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_exercise_duration"]
    Click Element Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/button_left"]

Delete Exercise Diary
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/layout_title_section"]
    Clear Exercise time
    Click Element Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_diary_delete"]
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="android:id/button1"]

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