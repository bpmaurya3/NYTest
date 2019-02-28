# NYTest
#  App Name : NYTimes

This project contains the similar functionality as given in the assignment for REA mobile development, but with more enhanced coding standard.

# Build and Runtime Requirements
Xcode Version 10.0 or later
iOS 12.1
macOS 10.14 or later

# Language Used
This application is written in Swift language.

# Application Architecture
This application's architecture follows the Model-View-ViewModel (MVVM) design pattern and uses modern app development practices including Storyboards and Auto Layout.

# Key Point
- As the code was not maintainable, I have used MVVM as the design pattern to restructure the project and have segregated the code instead of keeping everything in single code file.
- If we observe here, we can see few groups (Folders) under NYTimes:
    > Utilities
    > Cells
    > Data Source
    > Networking
    > Controller
    > View Models
    > Models
- This increases the readability of the code, and helps to maintain for future purpose.
- Reason for choosing MVVM is, as it provides better decoupling of the UI and business logic. This decoupling results in thin, flexible, and easy-to-read view controller classes in iOS.
- Normally we choose design pattern for the reason to make life easier of the developer. I would rather say that these are the reusable solutions to common problems in software design. To support my point, I have used TableViewDataSource.swift to reuse the logic.
- Refer file name => mvvm Block diagram.png
- Completed the Manual Testing thoroughly added Unit test.

# Additional Functionality
- Added new functionality Time to "Departs In"
- Added new functionality to see the tram information, user can click any cell to get more info for the tram.

# Unit Tests
- Executed few Unit Tests. Unit testing done for API calls.
