*** Settings ***
Library    AppiumLibrary
Resource   ../keywords/common_keywords.robot

*** Keywords ***
Click Diary Menu
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/tab_diaries"]

Click Dashboard Menu
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/tab_dashboard"]

Click Table View
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/display_type" and @text="Table View"]

Click List View
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/display_type" and @text="List View"]

Click Filter Button
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/layout_filter"]

Click Glucose Checkbox
    Click Element Until Element Is Visible    xpath=//android.widget.CheckBox[@resource-id="com.h2sync.android.h2syncapp:id/checkbox_record_type" and @text="Glucose"]

Click Set RANGE
    Click Element Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_range_value" and @text="Set Range"]

Enter Min And Max At Set Range
    [Arguments]    ${min}    ${max}
    Wait Until Page Contains Element    xpath=//android.widget.EditText[@resource-id="com.h2sync.android.h2syncapp:id/edit_min_value"]
    Input Text    xpath=//android.widget.EditText[@resource-id="com.h2sync.android.h2syncapp:id/edit_min_value"]    ${min}
    Input Text    xpath=//android.widget.EditText[@resource-id="com.h2sync.android.h2syncapp:id/edit_max_value"]    ${max}

Set Glucose Filter    
    [Arguments]    ${min}    ${max}
    Click Glucose Checkbox
    Click Set RANGE
    Enter Min And Max At Set Range    ${min}    ${max}
    Click Done Button

Click Pressure Checkbox
    Click Element Until Element Is Visible    xpath=//android.widget.CheckBox[@resource-id="com.h2sync.android.h2syncapp:id/checkbox_record_type" and @text="Pressure"]

Enter Range Of Pressure 
    [Arguments]    ${Systolic min}    ${Systolicmax}    ${Diastolic min}    ${Diastolic max}
    Wait Until Page Contains Element    xpath=//android.widget.TextView[contains(@text, "Systolic")]/following-sibling::android.widget.EditText
    Input Text    xpath=//android.widget.TextView[contains(@text, "Systolic")]/following-sibling::android.widget.EditText[@text="Min."]    ${Systolic min}
    Input Text    xpath=//android.widget.TextView[contains(@text, "Systolic")]/following-sibling::android.widget.EditText[@text="Max."]    ${Systolicmax}
    Input Text    xpath=//android.widget.TextView[contains(@text, "Diastolic")]/following-sibling::android.widget.EditText[@text="Min."]    ${Diastolic min}
    Input Text    xpath=//android.widget.TextView[contains(@text, "Diastolic")]/following-sibling::android.widget.EditText[@text="Max."]   ${Diastolic max}

Set Pressure Filter
    [Arguments]    ${Systolic min}    ${Systolicmax}    ${Diastolic min}    ${Diastolic max}
    Click Pressure Checkbox
    Click Set RANGE
    Enter Range Of Pressure    ${Systolic min}    ${Systolicmax}    ${Diastolic min}    ${Diastolic max}
    Click Done Button 

Click Weigtht Checkbox
    Click Element Until Element Is Visible    xpath=//android.widget.CheckBox[@resource-id="com.h2sync.android.h2syncapp:id/checkbox_record_type" and @text="Weight"]

Set Weigtht Filter    
    [Arguments]    ${min}    ${max}
    Click Weigtht Checkbox
    Click Set RANGE
    Enter Min And Max At Set Range    ${min}    ${max}
    Click Done Button

Set Body Fat Filter    
    [Arguments]    ${min}    ${max}
    Click Body Fat Checkbox
    Click Set RANGE
    Enter Min And Max At Set Range    ${min}    ${max}
    Click Done Button

Click Record Type & Value Show More Button
    Click Element Until Element Is Visible    xpath=//androidx.recyclerview.widget.RecyclerView[@resource-id="com.h2sync.android.h2syncapp:id/recycler_view_record_type"]/android.widget.LinearLayout

Click Body Fat Checkbox
    Click Element Until Element Is Visible    xpath=//android.widget.CheckBox[@resource-id="com.h2sync.android.h2syncapp:id/checkbox_record_type" and @text="Body Fat"]

Click Medication Checkbox
    Click Element Until Element Is Visible    xpath=//android.widget.CheckBox[@resource-id="com.h2sync.android.h2syncapp:id/checkbox_record_type" and @text="Medication"]

Click Diet Checkbox
    Click Element Until Element Is Visible    xpath=//android.widget.CheckBox[@resource-id="com.h2sync.android.h2syncapp:id/checkbox_record_type" and @text="Diet"]

Click Record Exercise Checkbox
    Click Element Until Element Is Visible    xpath=//androidx.recyclerview.widget.RecyclerView[@resource-id="com.h2sync.android.h2syncapp:id/recycler_view_record_type"]/android.view.ViewGroup/android.widget.CheckBox[@resource-id="com.h2sync.android.h2syncapp:id/checkbox_record_type" and @text="Exercise"]

Click Note/Photo Checkbox
    Click Element Until Element Is Visible    xpath=//android.widget.CheckBox[@resource-id="com.h2sync.android.h2syncapp:id/checkbox_record_type" and @text="Note/Photo"]

Click Mood Checkbox
    Click Element Until Element Is Visible    xpath=//android.widget.CheckBox[@resource-id="com.h2sync.android.h2syncapp:id/checkbox_record_type" and @text="Mood"]

Click Wake-up Checkbox
    Click Element Until Element Is Visible    xpath=//android.widget.CheckBox[@resource-id="com.h2sync.android.h2syncapp:id/checkbox_record_type" and @text="Wake-up"]

Click Breakfast Checkbox
    Click Element Until Element Is Visible    xpath=//android.widget.CheckBox[@resource-id="com.h2sync.android.h2syncapp:id/checkbox_record_type" and @text="Breakfast"]

Click Lunch Checkbox
    Click Element Until Element Is Visible    xpath=//android.widget.CheckBox[@resource-id="com.h2sync.android.h2syncapp:id/checkbox_record_type" and @text="Lunch"]

Click Dinner Checkbox
    Click Element Until Element Is Visible    xpath=//android.widget.CheckBox[@resource-id="com.h2sync.android.h2syncapp:id/checkbox_record_type" and @text="Dinner"]

Click Snack Checkbox
    Click Element Until Element Is Visible    xpath=//android.widget.CheckBox[@resource-id="com.h2sync.android.h2syncapp:id/checkbox_record_type" and @text="Snack"]

Click Period Exercise Checkbox
    Click Element Until Element Is Visible    xpath=//androidx.recyclerview.widget.RecyclerView[@resource-id="com.h2sync.android.h2syncapp:id/recycler_view_period_type"]/android.view.ViewGroup/android.widget.CheckBox[@resource-id="com.h2sync.android.h2syncapp:id/checkbox_record_type" and @text="Exercise"]

Click Bedtime Checkbox
    Click Element Until Element Is Visible    xpath=//android.widget.CheckBox[@resource-id="com.h2sync.android.h2syncapp:id/checkbox_record_type" and @text="Bedtime"]

Click Midnight Checkbox
    Click Element Until Element Is Visible    xpath=//android.widget.CheckBox[@resource-id="com.h2sync.android.h2syncapp:id/checkbox_record_type" and @text="Midnight"]

Click Other Checkbox
    Click Element Until Element Is Visible    xpath=//android.widget.CheckBox[@resource-id="com.h2sync.android.h2syncapp:id/checkbox_record_type" and @text="Other"]

Click Period Show More Button
    Click Element Until Element Is Visible    xpath=//androidx.recyclerview.widget.RecyclerView[@resource-id="com.h2sync.android.h2syncapp:id/recycler_view_period_type"]/android.widget.LinearLayout

Click Spinner On Table View
    Click Element Until Element Is Visible    xpath=//android.widget.Spinner[@resource-id="com.h2sync.android.h2syncapp:id/spinner_item"]

Select Glucose Filter
    Click Element Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_filter_item" and @text="Glucose"]

Select Pressure Filter
    Click Element Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_filter_item" and @text="Pressure"]

Select Weight Filter
    Click Element Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_filter_item" and @text="Weight"]

Verify Glucose Show On Table View
    [Arguments]    ${glucose}    ${time}
    Wait Until Page Contains Element    xpath=//android.widget.FrameLayout[@resource-id="com.h2sync.android.h2syncapp:id/layout_left"]/android.widget.TextView
    ${text}=    Get Text    xpath=//android.widget.FrameLayout[@resource-id="com.h2sync.android.h2syncapp:id/layout_left"]/android.widget.TextView
    Should Be Equal    ${text}    ${glucose}
    ${text}=    Get Text    xpath=//androidx.recyclerview.widget.RecyclerView[@resource-id="com.h2sync.android.h2syncapp:id/recycler_diary_table"]//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_period"]
    Should Be Equal    ${text}    ${time}

Verify Pressure Show On Table View
    [Arguments]    ${time}    ${Pressure}    ${Pulse}
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_period" and @text="${time}"]
    ${text}=    Get Text    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_period" and @text="${time}"]
    Should Be Equal    ${text}    ${time}
    ${text}=    Get Text    xpath=//android.widget.FrameLayout[@resource-id="com.h2sync.android.h2syncapp:id/layout_left"]/android.widget.TextView
    Should Be Equal    ${text}    ${Pressure}
    ${text}=    Get Text    xpath=//android.widget.FrameLayout[@resource-id="com.h2sync.android.h2syncapp:id/layout_right"]/android.widget.TextView
    Should Be Equal    ${text}    ${Pulse}

Verify Weight Show On Table View
    [Arguments]    ${time}    ${weight}    ${body fat}
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_period" and @text="${time}"]
    ${text}=    Get Text    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_period" and @text="${time}"]
    Should Be Equal    ${text}    ${time}
    ${text}=    Get Text    xpath=//android.widget.FrameLayout[@resource-id="com.h2sync.android.h2syncapp:id/layout_left"]/android.widget.TextView
    Should Be Equal    ${text}    ${Pressure}
    ${text}=    Get Text    xpath=//android.widget.FrameLayout[@resource-id="com.h2sync.android.h2syncapp:id/layout_right"]/android.widget.TextView
    Should Be Equal    ${text}    ${Pulse}

Swipe Down Until Element Visible
    [Arguments]    ${locator}    ${max_swipes}=10
    FOR    ${index}    IN RANGE    5
        ${exists}=    Run Keyword And Return Status    Element Should Be Visible    xpath=${locator}
        Exit For Loop If    ${exists}
        Swipe    500    1500    500    500    1000
    END

Scroll To Find TextView
    [Arguments]    ${keyword}
    Swipe Down Until Element Visible    //android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_expand_or_collapse" and @text="${keyword}"]

Scroll To Find Checkbox
    [Arguments]    ${keyword}
    Swipe Down Until Element Visible    //android.widget.CheckBox[@resource-id="com.h2sync.android.h2syncapp:id/checkbox_record_type" and @text="${keyword}"]

Verify On Diary Page
    Verify Text Element Is Equal To Expected Value    xpath=(//android.widget.TextView[@text="Diary"])[1]    Diary

Verify List View on Rage
    Verify Text Element Is Equal To Expected Value    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/display_type"]    List View

Click Search Bar
    Click Element Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="com.h2sync.android.h2syncapp:id/layout_keyword"]

Enter Keyword At Search Bar
    [Arguments]    ${keywords}
    Wait Until Page Contains Element    xpath=//android.widget.EditText[@resource-id="com.h2sync.android.h2syncapp:id/edit_search_title"]    timeout=10s
    Input Text Until Element Is Visible  xpath=//android.widget.EditText[@resource-id="com.h2sync.android.h2syncapp:id/edit_search_title"]    ${keywords}

Press Enter At Search Bar
    Press Keycode    66

Exit Search state on Diary Page
    Click Element Until Element Is Visible    xpath=//android.widget.ImageView[@resource-id="com.h2sync.android.h2syncapp:id/image_cancel"]

Verify Entries with Keyword Shows on Diary Page
    [Arguments]    ${keywords}
    Wait Until Element Is Visible    xpath=(//android.widget.TextView[contains(@text, ${keywords})])    10s

Create Glucose Diary Time Set 1Hour Before
    [Arguments]    ${bloodGlucose}  ${time}  ${period}
    Click Add Diary Menu
    Click Blood Glucose Diary
    Choose Date   ${time}
    Set Time 1Hour Before
    Choose Period   ${period}
    Enter Blood Glucose    ${bloodGlucose} 
    Click Done Button

Create Pressure Diary Time Set 1Hour Before
    [Arguments]    ${systolic}  ${diastolic}   ${pulse}  ${time}  ${period}
    Click Add Diary Menu
    Click Pressure Diary
    Choose Date   ${time}
    Set Time 1Hour Before
    Choose Period   ${period}
    Enter Pressure     ${systolic}  ${diastolic}  ${pulse}
    Click Done Button

Set Time 1Hour Before
    Wait Until Element Is Visible    //android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_date"]    10s
    Click Element    //android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_date"]
    Swipe    331    1370    331    1561    500
    Wait Until Element Is Visible    //android.widget.Button[@resource-id="android:id/button1"]    10s
    Click Element    //android.widget.Button[@resource-id="android:id/button1"]

Click First Entry
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/layout_title_section"]
    Click Element    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/layout_title_section"]

Click Cancel Button
    Wait Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/button_cancel"]
    Click Element    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/button_cancel"]

Verify Glucose Show Correct Data   
    [Arguments]    ${bloodGlucose}    ${period}
    Verify Text Element Is Equal To Expected Value    xpath=//android.widget.EditText[@resource-id="com.h2sync.android.h2syncapp:id/edit_value"]    ${bloodGlucose}
    Verify Text Element Is Equal To Expected Value    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_period"]    ${period}

Verify Pressure Show Correct Data   
    [Arguments]    ${systolic}    ${diastolic}    ${pulse}    ${period}
    Verify Text Element Is Equal To Expected Value    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/layout_systolic"]/android.widget.EditText   ${systolic}
    Verify Text Element Is Equal To Expected Value    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/layout_diastolic"]/android.widget.EditText   ${diastolic}
    Verify Text Element Is Equal To Expected Value    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/layout_pulse"]/android.widget.EditText   ${pulse}
    Verify Text Element Is Equal To Expected Value    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_period"]    ${period}

Verify Weight Show Correct Data   
    [Arguments]    ${weight}    ${body fat}    ${period}
    Verify Text Element Is Equal To Expected Value    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/layout_weight"]/android.widget.EditText   ${weight}
    Verify Text Element Is Equal To Expected Value    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/layout_body_fat"]/android.widget.EditText   ${body fat}
    Verify Text Element Is Equal To Expected Value    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_period"]    ${period}

Verify Medication Show Correct Data   
    [Arguments]    ${medication_content}    ${carbs}    ${unit}    ${period}
    Verify Text Element Is Equal To Expected Value    xpath=//androidx.recyclerview.widget.RecyclerView[@resource-id="com.h2sync.android.h2syncapp:id/recycler_view_medication"]/android.widget.LinearLayout[1]/android.widget.EditText   ${carbs}
    ${elements}=    Get WebElements    xpath=//androidx.recyclerview.widget.RecyclerView[@resource-id="com.h2sync.android.h2syncapp:id/recycler_view_medication"]/android.widget.LinearLayout[.//android.widget.CheckBox[@text="${medication_content}"] and .//android.widget.EditText[@text="${unit}"]]
    Should Not Be Empty    ${elements}
    Verify Text Element Is Equal To Expected Value    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_period"]    ${period}

Verify Diet Show Correct Data   
    [Arguments]    ${category}    ${serv}    ${period}
    Check Food Name At Create Page    ${category}
    Check Serv At Create Page    ${serv}
    Verify Text Element Is Equal To Expected Value    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_period"]    ${period}

Check Food Name At Create Page
    [Arguments]    ${category}
    Wait Until Element Is Visible    xpath=//androidx.recyclerview.widget.RecyclerView[@resource-id="com.h2sync.android.h2syncapp:id/recycler_view_diary_food"]
    ${elements}=    Get WebElements    xpath=//androidx.recyclerview.widget.RecyclerView[@resource-id="com.h2sync.android.h2syncapp:id/recycler_view_diary_food"]/android.view.ViewGroup[.//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_food_name" and @text="${category}"]]
    Should Not Be Empty    ${elements}

Check Serv At Create Page
    [Arguments]    ${serv}
    Wait Until Element Is Visible    xpath=//androidx.recyclerview.widget.RecyclerView[@resource-id="com.h2sync.android.h2syncapp:id/recycler_view_diary_food"]
    ${elements}=    Get WebElements    xpath=//androidx.recyclerview.widget.RecyclerView[@resource-id="com.h2sync.android.h2syncapp:id/recycler_view_diary_food"]/android.view.ViewGroup[.//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_serving" and @text="${serv} serv."]]
    Should Not Be Empty    ${elements}

Verify Exercise Show Correct Data   
    [Arguments]    ${exercise type}    ${hour}    ${minute}    ${period}
    Wait Until Element Is Visible    xpath=//androidx.recyclerview.widget.RecyclerView[@resource-id="com.h2sync.android.h2syncapp:id/recycler_view_exercise"]
    ${checkbox index}=    Find Group With Exercise Checkbox    ${exercise type}
    Verify Text Element Is Equal To Expected Value    xpath=//androidx.recyclerview.widget.RecyclerView[@resource-id="com.h2sync.android.h2syncapp:id/recycler_view_exercise"]/android.view.ViewGroup[${checkbox index}]/android.widget.CheckBox    ${exercise type}
    Verify Text Element Is Equal To Expected Value    xpath=//androidx.recyclerview.widget.RecyclerView[@resource-id="com.h2sync.android.h2syncapp:id/recycler_view_exercise"]/android.view.ViewGroup[${checkbox index}]/android.widget.TextView    ${hour} hr ${minute} mins
    Verify Text Element Is Equal To Expected Value    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_period"]    ${period}  


Find Group With Exercise Checkbox
    [Arguments]    ${exercise_type}
    ${groups}=    Get WebElements    xpath=//androidx.recyclerview.widget.RecyclerView[@resource-id="com.h2sync.android.h2syncapp:id/recycler_view_exercise"]/android.view.ViewGroup
    ${index}=     Set Variable    1
    FOR    ${group}    IN    @{groups}
        ${checkbox}=    Run Keyword And Return Status    Get WebElement    xpath=.//android.widget.CheckBox[@resource-id="com.h2sync.android.h2syncapp:id/check_box_exercise" and @text="${exercise_type}"]
        Run Keyword If    ${checkbox}    Return From Keyword    ${index}
        ${index}=    Evaluate    ${index} + 1
    END
    RETURN    ${index}

Reset Daily Diet Entry
    Click Diary Menu
    Click Element Until Element Is Visible  xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_item_title" and @text="Diet"]
    Wait Until Element Is Visible  xpath=//androidx.recyclerview.widget.RecyclerView[@resource-id="com.h2sync.android.h2syncapp:id/recycler_view_vertical"]/android.widget.FrameLayout[2]/android.widget.FrameLayout/android.view.ViewGroup
    Swipe Down Until Element Visible  xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_diary_delete"]
    Click Element Until Element Is Visible  xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_diary_delete"]
    Click Element Until Element Is Visible  xpath=//android.widget.Button[@resource-id="android:id/button1"]
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text="You don’t have any diaries yet."]