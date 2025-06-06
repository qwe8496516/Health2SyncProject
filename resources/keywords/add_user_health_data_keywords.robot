*** Settings ***
Library    AppiumLibrary
Library    Collections
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

Click Add Diet Diary
    Click Element Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_diary_entry_item" and @text="Diet"]


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


Create Diet Diary
    [Arguments]    ${entries}   ${time}  ${period}
    Click Add Diary Menu
    Click Add Diet Diary
    Choose Date   ${time}
    Choose Period   ${period}
    Add Foods    ${entries} 
    Click Done Button


Add Foods
    [Arguments]    ${entries}

    Click Element Until Element Is Visible    //android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_add_by_category"]

    FOR    ${entry}    IN    @{entries}
        ${category}=    Get From Dictionary    ${entry}    category
        ${serv}=        Get From Dictionary    ${entry}    serv

        ${serv_float}=    Evaluate    float(${serv})
        Run Keyword If    not ${0.0} <= ${serv_float} <= ${19.9}    Fail    Serv value must be between 0.0 and 19.9

        ${index}=    Get Food Index    ${category}
        Click Element Until Element Is Visible    xpath=(//android.widget.FrameLayout[@resource-id="com.h2sync.android.h2syncapp:id/layout_right"])[${index}]

        ${integer_part}=    Evaluate    int(${serv_float})
        ${decimal_part}=    Evaluate    int(round((${serv_float} - ${integer_part}) * 10))

        Log To Console      target: ${integer_part}.${decimal_part}

        Swipe To Set Diet Serving Value    1    ${integer_part}
        Swipe To Set Diet Serving Value    2    ${decimal_part}

        Click Element    //android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/button_done"]
    END

    Click Element    //android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/button_bottom"]


Get Food Index
    [Arguments]    ${food_name}
    [Documentation]    根據指定的文字找到對應的 ViewGroup 索引

    # 定義食物名稱與索引的映射表
    ${food_map}=    Create Dictionary
    ...    Bread=1
    ...    Meat=2
    ...    Pasta=3
    ...    Fish=4
    ...    Rice=5
    ...    Seafood=6
    ...    Starchy Veggies=7
    ...    Eggs=8
    ...    Other Grains=9
    ...    Other Proteins=10
    ...    Vegetables=11
    ...    Fruits=12
    ...    Dairy=13
    ...    Oils=14
    ...    Juice=15
    ...    Alcohol=16
    ...    Soft Drinks=17
    ...    Coffee/Tea=18

    # 查找指定食物名稱的索引
    ${index}=    Get From Dictionary    ${food_map}    ${food_name}

    Log To Console  category index: ${index}

    # 確保找到匹配的索引，否則報錯
    Run Keyword If    ${index} == None    Fail    Food name '${food_name}' not found.

    [Return]    ${index}


Swipe To Set Diet Serving Value
    [Arguments]    ${input_index}    ${target_value}
    [Documentation]    向上滑動設置指定的數值

    # 等待目標元素可見
    Wait Until Element Is Visible    xpath=(//android.widget.EditText[@resource-id="android:id/numberpicker_input"])[${input_index}]

    # 獲取當前值並轉換為整數
    ${current_value}=    Get Text    xpath=(//android.widget.EditText[@resource-id="android:id/numberpicker_input"])[${input_index}]
    ${current_value}=    Convert To Integer    ${current_value}

    # 將目標值轉換為整數（以防傳遞的是字串）
    ${target_value}=    Convert To Integer    ${target_value}

    Log To Console      target: ${target_value}

    # 使用 WHILE 進行迴圈
    WHILE    ${current_value} != ${target_value}
        # 根據索引值決定滑動操作
        Run Keyword If    ${input_index} == 1    Swipe    435    1823    435    1673    300
        Run Keyword If    ${input_index} == 2   Swipe    645    1823    645    1673    300

        # 更新當前值
        ${current_value}=    Get Text    xpath=(//android.widget.EditText[@resource-id="android:id/numberpicker_input"])[${input_index}]
        ${current_value}=    Convert To Integer    ${current_value}
        Sleep    0.5s
    END


    
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
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="${expected_medication_text}"]

Verify Oral Medication Is Correct
    [Arguments]    ${medication_content}    ${tablets}    
    Verify Text Element Is Equal To Expected Value    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_item_title"]    Medication
   
    ${expected_medication_text}=    Set Variable    ${medication_content}
    Run Keyword If    '${tablets}' != ''    Set Test Variable    ${expected_medication_text}    ${medication_content} - ${tablets} tablets
    Sleep  3s
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="${expected_medication_text}"]


*** Keywords ***
Verify Diet Is Correct
    [Arguments]    ${entries}
    Verify Text Element Is Equal To Expected Value    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_item_title"]    Diet

    # 定義卡路里表與碳水表
    ${calories_table}=    Create Dictionary
    ...    Bread=7
    ...    Meat=8
    ...    Pasta=7
    ...    Fish=8
    ...    Rice=7
    ...    Seafood=8
    ...    Starchy Veggies=7
    ...    Eggs=8
    ...    Other Grains=7
    ...    Other Proteins=8
    ...    Vegetables=3
    ...    Fruits=6
    ...    Dairy=12
    ...    Oils=5
    ...    Juice=6
    ...    Alcohol=13
    ...    Soft Drinks=6
    ...    Coffee/Tea=0

    ${carbs_table}=    Create Dictionary
    ...    Bread=1.5
    ...    Meat=0
    ...    Pasta=1.5
    ...    Fish=0
    ...    Rice=1.5
    ...    Seafood=0
    ...    Starchy Veggies=1.5
    ...    Eggs=0
    ...    Other Grains=1.5
    ...    Other Proteins=0
    ...    Vegetables=0.5
    ...    Fruits=1.5
    ...    Dairy=1.2
    ...    Oils=0
    ...    Juice=1.5
    ...    Alcohol=0
    ...    Soft Drinks=1.5
    ...    Coffee/Tea=0

    # 初始化總熱量與總碳水
    ${total_calories}=    Set Variable    0
    ${total_carbs}=       Set Variable    0

    # 遍歷每個條目
    FOR    ${entry}    IN    @{entries}
        ${category}=    Get From Dictionary    ${entry}    category
        ${serv}=        Get From Dictionary    ${entry}    serv

        # 從表中獲取每單位的卡路里和碳水
        ${calories_per_unit}=    Get From Dictionary    ${calories_table}    ${category}
        ${carbs_per_unit}=       Get From Dictionary    ${carbs_table}       ${category}

        # 計算當前條目的熱量與碳水
        ${serv_float}=    Evaluate    float(${serv})
        ${calories}=      Evaluate    ${serv_float} * float(${calories_per_unit})
        ${carbs}=         Evaluate    ${serv_float} * float(${carbs_per_unit})

        # 更新總熱量與總碳水
        ${total_calories}=    Evaluate    ${total_calories} + ${calories}
        ${total_carbs}=       Evaluate    ${total_carbs} + ${carbs}

        # 驗證當前條目是否正確顯示
        ${expected_text}=    Set Variable    ${category} - ${serv} (serv.)
        Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="${expected_text}"]

    END

    # 將最終結果乘以10
    ${total_calories}=    Evaluate    ${total_calories} * 10
    ${total_carbs}=       Evaluate    ${total_carbs} * 10

    ${total_calories}=    Evaluate    round(${total_calories})
    ${total_carbs}=       Evaluate    int(${total_carbs}) if ${total_carbs} == int(${total_carbs}) else round(${total_carbs}, 1)


    # 驗證總熱量與碳水是否正確顯示
    ${expected_total_text}=    Set Variable    ${total_calories} Cal / ${total_carbs} g of carbs
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_item_value" and @text="${expected_total_text}"]

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