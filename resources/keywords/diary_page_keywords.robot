*** Settings ***
Library    AppiumLibrary
Resource   ../keywords/common_keywords.robot

*** Keywords ***
Click Diary Menu
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/tab_diaries"]

Click Table View
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/display_type" and @text="Table View"]

Click List View
    Click Element Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.h2sync.android.h2syncapp:id/display_type" and @text="List View"]

Click Filter Button
    Click Element Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="com.h2sync.android.h2syncapp:id/layout_filter"]

Click Glucose Checkbox
    Click Element Until Element Is Visible    xpath=//android.widget.CheckBox[@resource-id="com.h2sync.android.h2syncapp:id/checkbox_record_type" and @text="Glucose"]

Click Pressure Checkbox
    Click Element Until Element Is Visible    xpath=//android.widget.CheckBox[@resource-id="com.h2sync.android.h2syncapp:id/checkbox_record_type" and @text="Pressure"]

Click Weigtht Checkbox
    Click Element Until Element Is Visible    xpath=//android.widget.CheckBox[@resource-id="com.h2sync.android.h2syncapp:id/checkbox_record_type" and @text="Weight"]

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
    ${text}=    Get Text    xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_period"]
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
