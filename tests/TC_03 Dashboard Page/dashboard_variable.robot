*** Variables ***
# Dashboard Section Titles
${BLOOD_GLUCOSE_TITLE}    Blood Glucose
${BLOOD_PRESSURE_TITLE}    Blood Pressure
${WEIGHT_TITLE}    Weight
${DIET_TITLE}    Diet
${EXERCISE_TITLE}    Exercise
${STEPS_TITLE}    Steps
${CGM_TITLE}    CGM
${HBA1C_TITLE}    A1C
@{DASHBOARD_SECTIONS}    ${BLOOD_GLUCOSE_TITLE}    ${BLOOD_PRESSURE_TITLE}    ${WEIGHT_TITLE}    ${DIET_TITLE}    ${EXERCISE_TITLE}    ${STEPS_TITLE}    ${CGM_TITLE}    ${HBA1C_TITLE}

# Dashboard
${EXERCISE_DASHBOARD}    exercise
${STEPS_DASHBOARD}    steps
${GLUCOSE_DASHBOARD}    glucose
${PRESSURE_DASHBOARD}    pressure
${DIET_DASHBOARD}    diet

# Glucose Diary
&{GLUCOSE_DIARY}    glucose=100    time=now    period=After Snack

# Glucose Partition
&{BLOOD_GLUCOSE_GOAL_NORMAL}    low=99    high=100
&{BLOOD_GLUCOSE_GOAL_HIGH}    low=98    high=99
&{BLOOD_GLUCOSE_GOAL_LOW}    low=101    high=102
&{BLOOD_GLUCOSE_GOAL_LOW_EQUAL_TO_HIGH}    low=100    high=100
&{BLOOD_GLUCOSE_GOAL_LOW_HIGHER_THAN_HIGH}    low=101    high=100
&{BLOOD_GLUCOSE_NORMAL_GOOD_DISTRIBUTION}    good=1    high=-    low=-    total=1
&{BLOOD_GLUCOSE_NORMAL_HIGH_DISTRIBUTION}    good=-    high=1    low=-    total=1
&{BLOOD_GLUCOSE_NORMAL_LOW_DISTRIBUTION}    good=-    high=-    low=1    total=1

# Pressure Diary
&{PRESSURE_DIARY}    systolic=120    diastolic=80    pulse=100    time=now    period=After Snack

# Pressure Partition
&{SYSTOLIC_GOAL_NORMAL}    low=119    high=120
&{SYSTOLIC_GOAL_LOW_EQUAL_TO_HIGH}    low=120    high=120
&{SYSTOLIC_GOAL_LOW_HIGHER_THAN_HIGH}    low=121    high=120
&{DIASTOLIC_GOAL_NORMAL_GOOD}    low=79    high=80
&{DIASTOLIC_GOAL_NORMAL_HIGH}    low=78    high=79
&{DIASTOLIC_GOAL_NORMAL_LOW}    low=81    high=82
&{DIASTOLIC_GOAL_LOW_EQUAL_TO_HIGH}    low=80    high=80
&{DIASTOLIC_GOAL_LOW_HIGHER_THAN_HIGH}    low=81    high=80
&{PULSE_GOAL_NORMAL}    low=99    high=100
&{PULSE_GOAL_LOW_EQUAL_TO_HIGH}    low=100    high=100
&{PULSE_GOAL_LOW_HIGHER_THAN_HIGH}    low=101    high=100
&{PRESSURE_NORMAL_GOOD_DISTRIBUTION}    good=1    high=-    low=-    total=1
&{PRESSURE_NORMAL_HIGH_DISTRIBUTION}    good=-    high=1    low=-    total=1
&{PRESSURE_NORMAL_LOW_DISTRIBUTION}    good=-    high=-    low=1    total=1

# Exercise Partition
${EXERCISE_MIN_MIN}    0
${EXERCISE_MIN_MIN_RESULT}    Tap to enter
${EXERCISE_MIN_MAX}    9999
${EXERCISE_MIN_NORMAL}    300
# ${EXERCISE_MIN_EXCEED_LIMIT}    10000
# ${EXERCISE_MIN_EXCEED_LIMIT_RESULT}    1000
${EXERCISE_STEPS_MIN}    0
${EXERCISE_STEPS_MIN_RESULT}    Tap to enter
${EXERCISE_STEPS_MAX}    99999
${EXERCISE_STEPS_NORMAL}    10000
${EXERCISE_STEPS_EXCEED_LIMIT}    100000
${EXERCISE_STEPS_EXCEED_LIMIT_RESULT}    10000

# Add Daily Diet Entry
&{foodIndex}    Bread=1    Meat=2    Pasta=3    Fish=4    Rice=5    Seafood=6    StarchyVeggies=7    Eggs=8    OtherGrains=9    OtherProteins=10    Vegetables=11    Fruits=12    Dairy=13    Oils=14    Juice=15    Alcohol=16    SoftDrinks=17    Coffe/Tea=18