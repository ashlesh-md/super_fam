# Assignment 1

## Description

This Flutter application is designed to manage key-value pairs using a local SQLite database. The app features a home screen where users can view, add, and manage key-value pairs. Users can input a key and value through a bottom sheet, which is then saved to the database and displayed in a list. The app uses `sqflite` for database operations.

## Demo Video

[Demo](https://drive.google.com/file/d/1QP-_7c1ql7UUQkuvKXUknBK-wUKmIgNx/view?usp=sharing)

## Features

- **Add Key-Value Pairs**: Users can add new key-value pairs through a bottom sheet.
- **View Key-Value Pairs**: Display a list of saved key-value pairs.
- **Local Storage**: Uses SQLite database for local data persistence.
- **Responsive UI**: The app adjusts to different screen sizes and orientations.

## Getting Started

### Prerequisites

- **Flutter SDK**: Ensure you have Flutter installed on your machine. Follow the instructions on the [official Flutter website](https://flutter.dev/docs/get-started/install) to set it up.

### Installation

1. **Clone the Repository**:
   ```bash
   git clone <repository-url>
   cd assignment_1
   ```
2. **Install Dependencies**:
   ```bash
   flutter pub get
   ```
3. **Run the Application**:
   ```bash
   flutter run
   ```

### Completed Tasks History
   - Created a HomeScreen to display and manage key-value pairs.
   - Implemented a DBHelper class to handle SQLite database operations.
   - Added functionality to insert and retrieve key-value pairs from the database.
   - Designed a bottom sheet for adding new key-value pairs.
   - Configured MaterialApp with a custom theme and home screen.

