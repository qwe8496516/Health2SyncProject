# Appium Robot Framework Automation Testing Project

This project uses Appium and Robot Framework for mobile application automation testing.

## Requirements

- Python 3.7+
- Appium Desktop (includes Appium Server and Inspector)
- Android SDK (for Android testing)
- Xcode (for iOS testing, macOS only)
- VS Code Extensions:
  - Robot Framework Language Server (Robot Code)
  - Robot Framework Intellisense

## Installation Steps

1. Install Python dependencies:
```bash
pip install -r requirements.txt
```

2. Install Appium Inspector:
   - Download Appium Inspector from [Appium Inspector releases](https://github.com/appium/appium-inspector/releases)
   - Install the downloaded package
   - Appium Inspector is used for inspecting elements and getting their locators

3. Install Appium Server:
   - Download the latest version from [Appium releases](https://github.com/appium/appium/releases)

4. Configure Android SDK:
   - Install Android Studio
   - Set up ANDROID_HOME & JAVA_HOME environment variable In Appium Server
   - Add platform-tools to your PATH

5. Install VS Code Extensions:
   - Open VS Code
   - Go to Extensions (Ctrl+Shift+X)
   - Search and install:
     - "Robot Framework Language Server" (Robot Code)
     - "Robot Framework Intellisense"

## Project Structure

```
.
├── requirements.txt
├── README.md
├── tests/
│   └── test_cases/
│       └── sample_test.robot
└── resources/
    ├── keywords/
    │   └── common_keywords.robot
    └── variables/
        └── app_config.robot
```

## Running Tests

1. Start Appium Server:
   - Open Appium Inspector
   - Click "Start Server"

2. Run the test

## Notes

- Make sure Appium Server is running before executing tests
- Use Appium Inspector to inspect elements and get their locators
- Ensure test device (emulator or physical device) is connected and properly configured
- Check if the configuration in app_config.robot matches your environment