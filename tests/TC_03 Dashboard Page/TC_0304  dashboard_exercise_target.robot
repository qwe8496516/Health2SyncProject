*** Settings ***
Resource         ../../resources/keywords/dashboard_information_keywords.robot

Suite Setup    Launch Application
Suite Teardown    Shutdown Application

*** Test Cases ***
Verify User Can Modify Exercise Target
    [Documentation]    Exercise Target Can Be Successfully Modified And Displayed
    Click Dashboard Section     steps
    Click Dashboard Setting Button
    Enter Daily Steps Target    10000
    Click Save Button
    Verify Text Element Is Equal To Expected Value  xpath=//android.widget.TextView[@resource-id="com.h2sync.android.h2syncapp:id/text_exercise_steps"]  10000