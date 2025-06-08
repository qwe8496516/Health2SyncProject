*** Settings ***
Resource         ../../resources/keywords/add_user_health_data_keywords.robot
Suite Setup    Launch Application
Suite Teardown    Shutdown Application

*** Variables ***
${HOUR_MAX}              9
${HOUR_MIN}              0
${MINUTE_MAX}            55
${MINUTE_MIN}            0
${VALID_MINUTE_STEPS}    0    5    10    15    20    25    30    35    40    45    50    55

# 運動分類
@{LOW_INTENSITY_EXERCISES}      Stretching    Yoga    Dancing (slow)    Walking
@{MODERATE_INTENSITY_EXERCISES} Strength Training    Biking (Slow)    Ping Pong    Golf    Baseball/Softball    Swimming
@{HIGH_INTENSITY_EXERCISES}     Basketball    Jogging    Soccer/Football    Tennis    Aerobics    Biking (Fast)



*** Test Cases ***
# Verify New Exercise Entry Can Be Successfully Added To The Diary Page
#     [Documentation]    Exercise Entry Can Be Successfully Added To The Diary Page

#     ${entry1}=    Create Dictionary    type=Tennis   hour=1   minute=5
#     ${entry2}=    Create Dictionary    type=Stretching   hour=2    minute=0
#     ${entry3}=    Create Dictionary    type=Biking (Slow)   hour=0    minute=15
#     ${entries}=    Create List    ${entry1}    ${entry2}    ${entry3}
#     Create Exercise Diary   ${entries}    current    Before Breakfast
#     Verify Exercise Is Correct    ${entries}
#     [Teardown]    Delete Diary

# 測試合法的最小值
Verify Exercise Entry With Minimum Hour Values
    [Documentation]    Verify that exercise entry with minimum values (${HOUR_MIN} hour ) is successfully added.
    ${entry}=    Create Dictionary    type=Stretching    hour=${HOUR_MIN}    minute=5
    ${entries}=    Create List    ${entry}
    Create Exercise Diary    ${entries}    current    Before Breakfast
    Verify Exercise Is Correct    ${entries}
    [Teardown]    Delete Diary

Verify Exercise Entry With Minimum Minute Values
    [Documentation]    Verify that exercise entry with minimum values (${HOUR_MIN} hour and ${VALID_MINUTE_STEPS[1]} minute) is successfully added.
    ${entry}=    Create Dictionary    type=Stretching    hour=2    minute=${MINUTE_MIN} 
    ${entries}=    Create List    ${entry}
    Create Exercise Diary    ${entries}    current    Before Breakfast
    Verify Exercise Is Correct    ${entries}
    [Teardown]    Delete Diary

# 測試合法的最大值
Verify Exercise Entry With Maximum Values
    [Documentation]    Verify that exercise entry with maximum values (${HOUR_MAX} hour and ${MINUTE_MAX} minute) is successfully added.
    ${entry}=    Create Dictionary    type=Basketball    hour=${HOUR_MAX}    minute=${MINUTE_MAX}
    ${entries}=    Create List    ${entry}
    Create Exercise Diary    ${entries}    past    After Dinner
    Verify Exercise Is Correct    ${entries}
    [Teardown]    Delete Diary

# 測試不合法的情況
Verify Exercise Entry With Invalid Low Values
    [Documentation]    Verify that exercise entry with invalid low values (${HOUR_MIN} hour and ${MINUTE_MIN} minute) is rejected.
    ${entry}=    Create Dictionary    type=Tennis    hour=${HOUR_MIN}    minute=${MINUTE_MIN}
    ${entries}=    Create List    ${entry}
    Create Exercise Diary    ${entries}    current    Before Breakfast
    Click Cancel Button
    Verify Exercise Diary Is Not Present    ${entries}

Verify Exercise Entry With Invalid Minute Steps
    [Documentation]    Verify that exercise entry with invalid minute steps (e.g., 3 minutes) is rejected.
    ${entry}=    Create Dictionary    type=Badminton    hour=1    minute=3
    ${entries}=    Create List    ${entry}
    Run Keyword And Expect Error    *    Create Exercise Diary    ${entries}    current    Before Breakfast
    Click Cancel Button
    Verify Exercise Diary Is Not Present    ${entries}

Verify Exercise Entry With Invalid High Values
    [Documentation]    Verify that exercise entry with invalid high values (${HOUR_MAX + 1} hour or ${MINUTE_MAX + 1} minute) is rejected.
    ${entry}=    Create Dictionary    type=Aerobics    hour=10    minute=-1
    ${entries}=    Create List    ${entry}
    Run Keyword And Expect Error    *    Create Exercise Diary    ${entries}    past    After Dinner
    Click Cancel Button
    Verify Exercise Diary Is Not Present    ${entries}

Verify Exercise Entry With Invalid Exercise Name
    [Documentation]    Verify that exercise entry with an invalid exercise name (not listed in intensity categories) is rejected.
    ${entry}=    Create Dictionary    type=Skydiving    hour=1    minute=30
    ${entries}=    Create List    ${entry}
    Run Keyword And Expect Error    *   Create Exercise Diary    ${entries}    current    Wake-up
    Click Cancel Choose Button
    Click Cancel Button
    Verify Exercise Diary Is Not Present    ${entries}


# 測試不同運動類型的組合
Verify Exercise Entry With Low-Intensity Exercises
    [Documentation]    Verify that low-intensity exercise entry is successfully added.
    ${entry}=    Create Dictionary    type=Yoga    hour=2    minute=30
    ${entries}=    Create List    ${entry}
    Create Exercise Diary    ${entries}    current    Bedtime
    Verify Exercise Is Correct    ${entries}
    [Teardown]    Delete Diary

Verify Exercise Entry With Moderate-Intensity Exercises
    [Documentation]    Verify that moderate-intensity exercise entry is successfully added.
    ${entry}=    Create Dictionary    type=Swimming    hour=1    minute=45
    ${entries}=    Create List    ${entry}
    Create Exercise Diary    ${entries}    current    After Snack
    Verify Exercise Is Correct    ${entries}
    [Teardown]    Delete Diary

Verify Exercise Entry With High-Intensity Exercises
    [Documentation]    Verify that high-intensity exercise entry is successfully added.
    ${entry}=    Create Dictionary    type=Soccer/Football    hour=3    minute=15
    ${entries}=    Create List    ${entry}
    Create Exercise Diary    ${entries}    past    Morning Snack
    Verify Exercise Is Correct    ${entries}
    [Teardown]    Delete Diary


Verify Low-Intensity Exercise Group Combinations
    [Documentation]    Verify that multiple low-intensity exercises can be added successfully.
    ${entry1}=    Create Dictionary    type=Stretching    hour=0    minute=30    
    ${entry2}=    Create Dictionary    type=Yoga          hour=1    minute=15    
    ${entries}=    Create List    ${entry1}    ${entry2}
    Create Exercise Diary    ${entries}     current    Before Breakfast
    Verify Exercise Is Correct    ${entries}
    [Teardown]    Delete Diary


Verify Moderate-Intensity Exercise Group Combinations
    [Documentation]    Verify that multiple moderate-intensity exercises can be added successfully.
    # 測試多個運動組合
    ${entry1}=    Create Dictionary    type=Strength Training    hour=1    minute=10    
    ${entry2}=    Create Dictionary    type=Swimming            hour=0    minute=45    
    ${entries}=    Create List    ${entry1}    ${entry2}
    Create Exercise Diary    ${entries}     current    After Lunch
    Verify Exercise Is Correct    ${entries}
    [Teardown]    Delete Diary


Verify High-Intensity Exercise Group Combinations
    [Documentation]    Verify that multiple high-intensity exercises can be added successfully.
    # 測試多個運動組合
    ${entry1}=    Create Dictionary    type=Basketball    hour=2    minute=15    
    ${entry2}=    Create Dictionary    type=Jogging       hour=1    minute=45    
    ${entries}=    Create List    ${entry1}    ${entry2}
    Create Exercise Diary    ${entries}     past    After Dinner
    Verify Exercise Is Correct    ${entries}
    [Teardown]    Delete Diary


Verify Cross-Group Exercise Combinations
    [Documentation]    Verify that exercises from different intensity groups can be combined successfully
    # 測試低強度 + 中強度 + 高強度
    ${entry1}=    Create Dictionary    type=Walking       hour=1    minute=10    
    ${entry2}=    Create Dictionary    type=Golf          hour=2    minute=25    
    ${entry3}=    Create Dictionary    type=Aerobics      hour=3    minute=50    
    ${entries}=    Create List    ${entry1}    ${entry2}    ${entry3}
    Create Exercise Diary    ${entries}     current    Before Snack
    Verify Exercise Is Correct    ${entries}
    [Teardown]    Delete Diary
