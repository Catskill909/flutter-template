# Flutter Template

A modern Flutter application template featuring a consistent dark theme, platform-specific webview implementation, and robust navigation system.

## Features

### Dark Mode Implementation
- Consistent dark theme across all screens using `ThemeMode.dark`
- Custom color scheme with proper contrast ratios
- Theme-aware components:
  - App bars with surface colors
  - Bottom navigation with primary/surface colors
  - Drawer menu with themed list items
  - WebView with dark mode support
- Text colors using `colorScheme.onSurface`

### Navigation Architecture
1. **Bottom Navigation Bar**
   - Home (0): Main content view
   - Explore (1): Discovery section
   - Notifications (2): Updates center
   - Profile (3): User settings
   - Uses `IndexedStack` for view management

2. **Side Drawer Menu**
   - Matches bottom tab navigation order
   - External links with WebView integration
   - Dark-themed design with proper contrast
   - Custom styled list items with icons

### WebView Features
- **Platform-Specific Implementation**:
  - iOS/Android: Native in-app browser (`webview_flutter`)
  - Web: External browser tabs (`url_launcher`)
- **Enhanced Functionality**:
  - Loading indicators with themed colors
  - Native share sheet integration
  - Back navigation with state preservation
  - Error handling for failed URL launches
  - URL sanitization and validation

### Dependencies
```yaml
dependencies:
  webview_flutter: ^4.10.0
  webview_flutter_web: ^0.2.3+4
  url_launcher: ^6.2.5
  share_plus: ^10.1.4
  provider: ^6.1.2
  cupertino_icons: ^1.0.8
```

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
   # Debug mode
   flutter run
   
   # Release mode
   flutter run --release
   ```

## Platform Support
- ✅ iOS (Tested on latest devices)
- ✅ Android
- ✅ Web (Progressive enhancement)

## Development Notes
- Uses Flutter SDK: '>=3.2.3 <4.0.0'
- Implements platform-specific behavior detection
- Follows Material Design 3 guidelines
- Maintains consistent theming across all platforms

## Contributing
Contributions are welcome! Please feel free to submit a Pull Request.

## License
This project is licensed under the MIT License.
