# Flutter Parking Space Finder App

A mobile application built with Flutter that helps users find available parking spaces in their area.

## Project Structure

\`\`\`
lib/
├── main.dart                 # App entry point
├── models/                   # Data models
│   ├── parking_space.dart   # ParkingSpace model
│   └── user.dart            # User model
├── views/                   # Screen/Page widgets
│   ├── home_view.dart       # Main home screen
│   ├── parking_list_view.dart # Parking spaces list
│   ├── parking_grid_view.dart # Parking spaces grid (using third-party package)
│   └── profile_view.dart    # User profile screen
├── widgets/                 # Reusable UI components
│   ├── custom_button.dart   # Custom button widget
│   └── parking_card.dart    # Parking space card widget
└── services/                # Business logic and API calls
    ├── parking_service.dart # Parking data service
    └── preferences_service.dart # Local storage service
\`\`\`

## Features

- **Hello World Implementation**: Both StatelessWidget and StatefulWidget examples
- **Custom Reusable Widgets**: CustomButton widget used across multiple screens
- **Material & Cupertino Design**: Profile screen supports both design systems
- **Navigation**: Drawer navigation between different screens
- **State Management**: Counter functionality demonstrating StatefulWidget
- **Mock Data Service**: Simulated API calls for parking space data
- **Third-party Packages**: Staggered grid view and persistent storage
- **Data Persistence**: Counter and preferences saved locally

## Third-Party Packages Used

1. **flutter_staggered_grid_view**: Creates beautiful staggered grid layouts for parking spaces
2. **shared_preferences**: Persists user preferences and counter values locally
3. **http**: Ready for future API integration
4. **cupertino_icons**: iOS-style icons for Cupertino design

## Architecture Decisions

### Folder Structure Rationale

1. **models/**: Contains data classes that represent the core entities of our app (ParkingSpace, User). This separation makes it easy to modify data structures without affecting UI code.

2. **views/**: Contains the main screens/pages of the app. Each view represents a complete screen that users can navigate to.

3. **widgets/**: Houses reusable UI components that can be used across multiple views. This promotes code reusability and consistency.

4. **services/**: Contains business logic and data access code. This layer abstracts API calls and data manipulation from the UI layer.

### Widget Hierarchy

\`\`\`
ParkingFinderApp (MaterialApp)
└── HomeView (Scaffold)
    ├── AppBar
    ├── Drawer
    │   └── ListView (Navigation items)
    └── Body
        └── Column
            ├── Text widgets
            └── CustomButton widgets
                ├── Find Parking Spaces → ParkingListView
                ├── View Grid Layout → ParkingGridView (MasonryGridView)
                └── View Profile → ProfileView
\`\`\`

## Getting Started in FlutLab

1. Create a new Flutter project in FlutLab
2. Replace the default `pubspec.yaml` with the provided version
3. Replace the default `lib/main.dart` with the provided code
4. Create the folder structure: `models/`, `views/`, `widgets/`, `services/`
5. Add each `.dart` file to its respective folder
6. Run `flutter pub get` to install dependencies (FlutLab should do this automatically)
7. Run the app using the play button in FlutLab

## Hands-On Tasks Completed

1. ✅ Project structure organized into models, views, widgets, and services
2. ✅ Hello World app using StatelessWidget (HomeView)
3. ✅ StatefulWidget with counter (ProfileView with persistent storage)
4. ✅ Custom reusable button widget (CustomButton used in 3+ screens)
5. ✅ Material Design and Cupertino Widgets (ProfileView with toggle)
6. ✅ Navigation with Drawer between multiple screens
7. ✅ Widget tree hierarchy documented above
8. ✅ Refactored into smaller reusable widgets (ParkingCard, CustomButton)
9. ✅ Third-party packages implemented (flutter_staggered_grid_view, shared_preferences)
10. ✅ Complete README.md documentation with architecture explanations

## Widget Tree Diagram

\`\`\`
MaterialApp
└── HomeView (StatelessWidget)
    ├── Scaffold
    │   ├── AppBar
    │   ├── Drawer
    │   │   └── ListView
    │   │       ├── DrawerHeader
    │   │       └── ListTile[] (Navigation items)
    │   └── Body
    │       └── Center
    │           └── Column
    │               ├── Text (Hello World)
    │               ├── Text (Welcome message)
    │               └── CustomButton[] (Reusable widgets)
    │
    ├── ParkingListView (StatefulWidget)
    │   └── ListView.builder
    │       └── ParkingCard[] (Custom widgets)
    │
    ├── ParkingGridView (StatefulWidget)
    │   └── MasonryGridView (Third-party package)
    │       └── ParkingCard[] (Reused widgets)
    │
    └── ProfileView (StatefulWidget)
        ├── Material Design Branch
        │   └── Scaffold → Column → CustomButton[]
        └── Cupertino Design Branch
            └── CupertinoPageScaffold → Column → CupertinoButton[]
\`\`\`

## Next Steps

- Implement real API integration using the http package
- Add map functionality for parking location visualization
- Implement user authentication and booking features
- Add more third-party packages like maps, animations, or state management
