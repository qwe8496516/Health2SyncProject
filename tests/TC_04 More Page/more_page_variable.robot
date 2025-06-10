*** Variables ***
${EMPTY_STRING} =
${RANDOM_EMAIL} =    noceur58@gmail.com
&{BLOOD_GLUCOSE_GOAL_NORMAL} =    low=99    high=100
&{BLOOD_GLUCOSE_GOAL_HIGH} =    low=98    high=99
&{BLOOD_GLUCOSE_GOAL_LOW} =    low=101    high=102
&{BLOOD_GLUCOSE_GOAL_LOW_EQUAL_TO_HIGH} =    low=100    high=100
&{BLOOD_GLUCOSE_GOAL_LOW_HIGHER_THAN_HIGH} =    low=101    high=100

&{TIME_ROUTINE_MIN} =    hour=0    minute=0
&{TIME_ROUTINE_MID} =    hour=12    minute=30
&{TIME_ROUTINE_MAX} =    hour=23    minute=59

${DISPLAY_MINIMUM_TIME} =    00:00
${DISPLAY_MIDDLE_TIME} =    12:30
${DISPLAY_MAXIMUM_TIME} =    23:59

&{TIME_ROUTINE_MID+1HOUR} =    hour=13    minute=30