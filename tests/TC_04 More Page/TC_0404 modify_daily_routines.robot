*** Settings ***
Resource         ../../resources/keywords/more_page_keywords.robot

Suite Setup    Run Keywords    Launch Application
...                     AND    On More Page
Suite Teardown    Shutdown Application

*** Test Cases ***
Verify Daily Routines Can Be Modified
    [Documentation]    Verify Daily Routines Can Be Modified
    ...                The default values for the daily routines are: {Wake Up: 07:00, Breakfast: 08:00, Lunch: 12:00, Dinner: 18:00, Bed Time: 22:00}
    Click "Daily Routine" Option
    Increase Every Daily Routine By 1 Hour
    Verify Daily Routines Are Modified
    [Teardown]    Decrease Every Daily Routine By 1 Hour