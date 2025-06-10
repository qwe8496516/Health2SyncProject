*** Settings ***
Resource         ../../resources/keywords/add_user_health_data_keywords.robot
Suite Setup      Launch Application
Suite Teardown   Shutdown Application

*** Variables ***
${BASELINE_EXERCISE}  Stretching
${BASELINE_HOUR}      2
${BASELINE_MINUTE}    5
${BASELINE_TIME}      now
${BASELINE_PERIOD}    Wake-up

${TIMES}         past    current
${PERIODS}       Morning    Noon    Afternoon    Evening    Night    Other
${MORNING_PERIODS}    Wake-up    Before Breakfast    After Breakfast
${NOON_PERIODS}       Before Lunch    After Lunch
${AFTERNOON_PERIODS}  Before Snack    After Snack
${EVENING_PERIODS}    Before Dinner    After Dinner    Before Exercise    After Exercise
${NIGHT_PERIODS}      Bedtime    Midnight
${OTHER_PERIODS}      Other

${LOW_INTENSITY_EXERCISES}      Stretching    Yoga    Dancing (Slow)    Walking     
${MODERATE_INTENSITY_EXERCISES}      Strength Training    Biking (Slow)    Ping Pong    Golf    Baseball/Softball   Swimming     Martial Arts   Badminton       Dancing (fast)
${HIGH_INTENSITY_EXERCISES}      Basketball    Jogging    Soccer/Football    Tennis      Aerobics      Biking (Fast)

@{HOUR_VALUES}         0    5    9
@{MINUTE_VALUES}       0    5    55

*** Test Cases ***

Verify Exercise Entry With Different Times
    FOR    ${time}    IN    ${TIMES}
        ${entry}=    Create Dictionary    type=${BASELINE_EXERCISE}    hour=${BASELINE_HOUR}    minute=${BASELINE_MINUTE}
        ${entries}=    Create List    ${entry}
        Create Exercise Diary    ${entries}    ${time}    ${BASELINE_PERIOD}
        Verify Exercise Is Correct    ${entries}
        Delete Diary
    END


Verify Exercise Entry With Different Periods
    ${PERIOD_GROUPS}=    Create List    ${MORNING_PERIODS}    ${NOON_PERIODS}    ${AFTERNOON_PERIODS}    ${EVENING_PERIODS}    ${NIGHT_PERIODS}    ${OTHER_PERIODS}
    FOR    ${group}    IN    ${PERIOD_GROUPS}
        ${period}=    Evaluate    random.choice(${group})
        ${entry}=    Create Dictionary    type=${BASELINE_EXERCISE}    hour=${BASELINE_HOUR}    minute=${BASELINE_MINUTE}
        ${entries}=    Create List    ${entry}
        Create Exercise Diary    ${entries}    ${BASELINE_TIME}    ${period}
        Verify Exercise Is Correct    ${entries}
        Delete Diary
    END


Verify Exercise Entry With different Exercise Types
    ${low_exercise}=    Evaluate    random.choice(["Stretching", "Yoga", "Walking"])
    Log    Selected low-intensity exercise: ${low_exercise}
    ${entry}=    Create Dictionary    type=${low_exercise}    hour=${BASELINE_HOUR}    minute=${BASELINE_MINUTE}
    ${entries}=    Create List    ${entry}
    Create Exercise Diary    ${entries}    ${BASELINE_TIME}    ${BASELINE_PERIOD}
    Verify Exercise Is Correct    ${entries}
    Delete Diary

    ${medium_exercise}=    Evaluate    random.choice(["Strength Training", "Biking (Slow)", "Ping Pong", "Golf", "Baseball/Softball", "Swimming", "Martial Arts", "Badminton", "Dancing (fast)"])
    Log    Selected medium-intensity exercise: ${medium_exercise}
    ${entry}=    Create Dictionary    type=${medium_exercise}    hour=${BASELINE_HOUR}    minute=${BASELINE_MINUTE}
    ${entries}=    Create List    ${entry}
    Create Exercise Diary    ${entries}    ${BASELINE_TIME}    ${BASELINE_PERIOD}
    Verify Exercise Is Correct    ${entries}
    Delete Diary

    ${high_exercise}=    Evaluate    random.choice(["Basketball", "Jogging", "Soccer/Football", "Tennis", "Aerobics", "Biking (Fast)"])
    Log    Selected high-intensity exercise: ${high_exercise}
    ${entry}=    Create Dictionary    type=${high_exercise}    hour=${BASELINE_HOUR}    minute=${BASELINE_MINUTE}
    ${entries}=    Create List    ${entry}
    Create Exercise Diary    ${entries}    ${BASELINE_TIME}    ${BASELINE_PERIOD}
    Verify Exercise Is Correct    ${entries}
    Delete Diary



Verify Exercise Entry With Different Hour Durations
    FOR    ${hour}    IN    @{HOUR_VALUES}
        ${entry}=    Create Dictionary    type=${BASELINE_EXERCISE}    hour=${hour}    minute=${BASELINE_MINUTE}
        ${entries}=    Create List    ${entry}
        Create Exercise Diary    ${entries}    ${BASELINE_TIME}    ${BASELINE_PERIOD}
        Verify Exercise Is Correct    ${entries}
        Delete Diary
    END


Verify Exercise Entry With Different Minute Durations
    FOR    ${minute}    IN    @{MINUTE_VALUES}
        ${entry}=    Create Dictionary    type=${BASELINE_EXERCISE}    hour=${BASELINE_HOUR}    minute=${minute}
        ${entries}=    Create List    ${entry}
        Create Exercise Diary    ${entries}    ${BASELINE_TIME}    ${BASELINE_PERIOD}
        Verify Exercise Is Correct    ${entries}
        Delete Diary
    END

Verify Exercise Entry With Same Group Combinations
    ${entry1}=    Create Dictionary    type=Stretching    hour=0    minute=30    
    ${entry2}=    Create Dictionary    type=Yoga          hour=1    minute=15    
    ${entries}=    Create List    ${entry1}    ${entry2}
    Create Exercise Diary    ${entries}     ${BASELINE_TIME}    ${BASELINE_PERIOD}
    Verify Exercise Is Correct    ${entries}
    Delete Diary

    ${entry1}=    Create Dictionary    type=Strength Training    hour=1    minute=10    
    ${entry2}=    Create Dictionary    type=Swimming            hour=0    minute=45    
    ${entries}=    Create List    ${entry1}    ${entry2}
    Create Exercise Diary    ${entries}     ${BASELINE_TIME}    ${BASELINE_PERIOD}
    Verify Exercise Is Correct    ${entries}
    Delete Diary

    ${entry1}=    Create Dictionary    type=Basketball    hour=2    minute=15    
    ${entry2}=    Create Dictionary    type=Jogging       hour=1    minute=45    
    ${entries}=    Create List    ${entry1}    ${entry2}
    Create Exercise Diary    ${entries}     ${BASELINE_TIME}    ${BASELINE_PERIOD}
    Verify Exercise Is Correct    ${entries}
    Delete Diary

Verify Exercise Entry With Cross-Group Combinations
    ${entry1}=    Create Dictionary    type=Walking       hour=1    minute=10    
    ${entry2}=    Create Dictionary    type=Golf          hour=2    minute=25    
    ${entry3}=    Create Dictionary    type=Aerobics      hour=3    minute=50    
    ${entries}=    Create List    ${entry1}    ${entry2}    ${entry3}
    Create Exercise Diary    ${entries}     ${BASELINE_TIME}    ${BASELINE_PERIOD}
    Verify Exercise Is Correct    ${entries}
    Delete Diary

