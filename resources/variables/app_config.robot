*** Variables ***
# Appium Server URL
${REMOTE_URL}                http://localhost:4723/wd/hub

# Android Configuration
${PLATFORM_NAME}             Android
${PLATFORM_VERSION}          11.0    # Change this to match your device's Android version
${DEVICE_NAME}               Android Emulator    # Change this to your device name
${NO_RESET}                  True    # Set to False if you want to clear app data before each test
${AUTOMATION_NAME}           UiAutomator2

# Application Configuration
${APP_PACKAGE}               com.example.app    # Change this to your app's package name
${APP_ACTIVITY}              com.example.app.MainActivity    # Change this to your app's main activity
