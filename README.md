# Assignment 2

## Description

This Flutter application is designed to handle user authentication through phone number verification. It consists of two main screens: a login screen where users enter their phone number, and an OTP screen where they input the OTP received on their mobile device. Once the OTP is verified, users are redirected to a success screen confirming successful verification.

## Demo Video

[Demo](https://drive.google.com/file/d/1Act-cc-bVMAZCDXooV-JqqlihGJAY3wS/view?usp=sharing)

## Features

- **Phone Number Input**: Users can input their phone numbers in the login screen.
- **OTP Verification**: Users receive an OTP to verify their phone number.
- **Validation**: Includes validation for Indian mobile numbers to ensure they follow the correct format.
- **User Feedback**: Displays success messages and provides feedback on the OTP verification process.

## Getting Started

### Prerequisites

- **Flutter SDK**: Ensure you have Flutter installed on your machine. Follow the instructions on the [official Flutter website](https://flutter.dev/docs/get-started/install) to set it up.

### Installation

1. **Clone the Repository**:
   ```bash
   git clone <repository-url>
   cd assignment_2
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
   - Implemented a login screen with phone number input.
   - Added OTP verification screen with validation for OTP input.
   - Created a success screen to notify users of successful verification.
   - Added validation for Indian mobile numbers in the login screen.
   - Integrated navigation between login, OTP, and success screens.
