*** Settings ***
Resource         ../../resources/keywords/dashboard_information_keywords.robot
Resource         ./dashboard_variable.robot

Suite Setup    Launch Application
Suite Teardown    Shutdown Application

*** Test Cases ***
Verify Dashboard Section Is Displayed Correctly
    [Documentation]    Dashboard Can Be Successfully Displayed
    Click Dashboard Menu
    FOR    ${section}    IN    @{DASHBOARD_SECTIONS}
        Scroll Until Text Element Is Visible    ${section}
        IF    '${section}' == '${CGM_TITLE}'
            ${section} =    Get Date With Dashboard Section Name    ${section}
        END
        Verify Dashboard Section Is Displayed    ${section}
    END