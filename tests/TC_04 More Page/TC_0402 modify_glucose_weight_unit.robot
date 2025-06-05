*** Settings ***
Resource         ../../resources/keywords/more_page_keywords.robot

Suite Setup    Run Keywords    Launch Application
...                     AND    On More Page
Suite Teardown    Shutdown Application

*** Test Cases ***
Verify Units Of "Blood Glucose" And "Weight" Can Be Modified
    [Documentation]    Verify Units Of "Blood Glucose" And "Weight" Can Be Modified
    Click "Units" Option
    Modify Blood Glucose Unit    mmol/L
    Modify Weight Unit     lb
    Verify Blood Glucose Unit Is Changed    mmol/L
    Verify Weight Unit Is Changed    lb
    [Teardown]    Run Keywords    Modify Blood Glucose Unit    mg/dL
    ...                    AND    Modify Weight Unit    kg