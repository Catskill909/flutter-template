# Flutter Template

A modern Flutter application template featuring a consistent dark theme, platform-specific webview implementation, and robust navigation system.

## Features

### Dark Mode
- Consistent dark theme across all screens
- Custom color scheme with proper contrast ratios
- Themed components including:
  - App bars and navigation elements
  - Bottom navigation bar
  - Drawer menu
  - WebView interface

### Navigation System
1. **Bottom Navigation Bar**
   - Home screen with main content
   - Explore section
   - Notifications center
   - User profile

2. **Side Drawer Menu**
   - Quick access to main sections
   - External links with WebView integration
   - Modern dark-themed design
   - Custom styled list items

### WebView Implementation
- **Platform-Specific Approach**:
  - Mobile (iOS/Android): Native in-app browser using `webview_flutter`
  - Web: External browser tabs using `url_launcher`
- **Features**:
  - Loading indicators with themed colors
  - Native share functionality
  - Back navigation
  - Error handling for failed URL launches

### Dependencies
- `webview_flutter`: ^4.10.0
- `webview_flutter_web`: ^0.2.3+4
- `url_launcher`: ^6.2.5
- `share_plus`: ^7.2.2
- `provider`: State management

## Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/flutter-template.git
   ```

2. Navigate to the project directory:
   ```bash
   cd flutter-template/flutter_nav_app
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Run the app:
   ```bash
   flutter run
   ```

## Platform Support
- ✅ iOS
- ✅ Android
- ✅ Web

## Contributing
Contributions are welcome! Please feel free to submit a Pull Request.

## License
This project is licensed under the MIT License.
