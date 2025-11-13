# Sandwich Shop App

A Flutter mobile application that allows users to create and customize sandwich orders with ease. This app demonstrates fundamental Flutter concepts including state management, UI components, and user interaction handling.

## Features

- **Sandwich Size Selection**: Toggle between Footlong and Six-inch sandwich options
- **Quantity Management**: Add or remove sandwiches from your order with intuitive buttons
- **Order Notes**: Add special requests and customization notes (e.g., "no onions", "extra pickles")
- **Visual Feedback**: Real-time order summary with emoji representation of sandwich quantities
- **Smart Button States**: Disabled buttons provide clear feedback when limits are reached
- **User-Friendly UI**: Clean, intuitive interface with color-coded buttons (teal for Add, red for Remove)

## Prerequisites

Before you begin, ensure you have the following installed:

- **Flutter SDK** (version 3.0 or higher)
  - Download from: https://flutter.dev/docs/get-started/install
- **Dart** (comes bundled with Flutter)
- **IDE**: Android Studio, Visual Studio Code, or any Flutter-compatible IDE
- **Mobile Emulator** or physical device for testing
  - Android: Android Emulator or Android device with USB debugging enabled
  - iOS: iOS Simulator or physical iPhone/iPad (macOS required)

## Installation and Setup

### 1. Clone the Repository

```bash
git clone <repository-url>
cd sandwich_shop
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Run the App

#### On Android Emulator or Device:
```bash
flutter run
```

#### On iOS Simulator (macOS only):
```bash
flutter run -d "iPhone 14"
```

#### For Web:
```bash
flutter run -d chrome
```

## Usage Instructions

### Main Features

1. **Select Sandwich Size**
   - Tap the "Footlong" or "Six-inch" toggle button at the top
   - Your selection is immediately reflected in the order summary

2. **Set Quantity**
   - Press the **Add** button (teal) to increase the sandwich quantity
   - Press the **Remove** button (red) to decrease the quantity
   - The maximum quantity is 5 sandwiches per order
   - Buttons automatically disable at limits to prevent invalid orders

3. **Add Special Requests**
   - Use the text field labeled "Add a note..." to enter custom requests
   - Examples: "no onions", "extra pickles", "toasted bread"
   - Your notes will appear in the order summary below the sandwich count

4. **View Order Summary**
   - The order display shows:
     - Current quantity
     - Selected sandwich size
     - Visual emoji representation (🥪)
     - Any special notes you've added

### User Flow Example

1. Open the app
2. Choose your sandwich size (Footlong or Six-inch)
3. Add special requests in the notes field (optional)
4. Use Add/Remove buttons to set your desired quantity
5. View your complete order in the summary display

## Project Structure

```
sandwich_shop/
├── lib/
│   └── main.dart              # Main application file containing all widgets
├── pubspec.yaml               # Flutter project configuration and dependencies
├── README.md                  # This file
└── .gitignore                 # Git ignore rules
```

## Technologies and Dependencies

- **Flutter Framework**: UI toolkit for building cross-platform apps
- **Dart**: Programming language used by Flutter
- **Material Design**: Google's design system for modern, intuitive UIs
- **State Management**: StatefulWidget for managing app state

### Key Packages

- `flutter/material.dart`: Material Design components and theming

## Code Overview

### Main Components

1. **App (StatelessWidget)**
   - Root widget that initializes the MaterialApp
   - Sets up the theme and navigation

2. **OrderScreen (StatefulWidget)**
   - Main order interface
   - Manages sandwich size selection, quantity, and notes
   - Handles button logic and state updates

3. **_OrderScreenState**
   - Maintains state for quantity, sandwich size, and order notes
   - Methods: `_increaseQuantity()`, `_decreaseQuantity()`
   - Uses TextEditingController for notes input

4. **OrderItemDisplay (StatelessWidget)**
   - Displays the current order summary
   - Shows quantity, sandwich type, emoji visualization, and notes

## Known Issues and Limitations

### Current Limitations

- Maximum order quantity is fixed at 5 sandwiches per order
- Notes field has no character limit (could add validation if needed)
- No persistence of orders (data is lost when app closes)
- No order history or saved orders feature

### Future Improvements

- [ ] Add order history and persistence using local database (Hive/SQLite)
- [ ] Implement multiple sandwich types (not just Footlong/Six-inch)
- [ ] Add pricing calculation based on size and quantity
- [ ] Create a cart system for multiple orders
- [ ] Add order confirmation and receipt screen
- [ ] Implement payment integration
- [ ] Add unit and widget tests
- [ ] Dark mode support
- [ ] Localization for multiple languages

### Testing

Currently, the app uses print statements for debugging. To run tests in the future:

```bash
flutter test
```

(Test files to be added)

## Development Notes

- This app uses basic Flutter state management (setState)
- For larger applications, consider using Provider, Riverpod, or BLoC for state management
- The TextEditingController for notes should be properly disposed to avoid memory leaks
- Button styling uses ElevatedButton.styleFrom for customization

## Contact and Support

**Developer**: [Your Name]  
**Email**: [Your Email]  
**GitHub**: [Your GitHub Profile]  
**LinkedIn**: [Your LinkedIn Profile]

### Contributing

For bug reports, feature requests, or contributions, please feel free to reach out or submit an issue.

---

**Last Updated**: 2024  
**Version**: 1.0.0
