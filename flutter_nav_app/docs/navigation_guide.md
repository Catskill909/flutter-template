# Navigation Configuration Guide

## Overview
The app's navigation drawer can be easily customized by modifying the configuration file located at `assets/config/navigation_config.json`. This guide explains how to customize the navigation menu structure and appearance.

## Configuration Structure

The navigation configuration uses the following JSON structure:

```json
{
  "drawer": {
    "header": {
      "title": "Navigation Menu",
      "icon": "person",
      "backgroundColor": "#1E2530"
    },
    "sections": [
      {
        "name": "Main Navigation",
        "items": [
          {
            "title": "Home",
            "icon": "home",
            "type": "internal",
            "route": 0
          }
        ]
      },
      {
        "name": "External Links",
        "items": [
          {
            "title": "Website",
            "icon": "web",
            "type": "external",
            "url": "https://example.com"
          }
        ]
      }
    ]
  }
}
```

## Configuration Options

### Header Configuration
- `title`: The text displayed at the top of the navigation drawer
- `icon`: Material icon name to use for the header avatar
- `backgroundColor`: Hex color code for the header background (e.g., "#1E2530")

### Sections
Each section represents a group of navigation items and contains:
- `name`: Section name (displayed as a header above the items)
- `items`: Array of menu items

### Menu Items
Two types of menu items are supported:

1. Internal Navigation Items
```json
{
  "title": "Home",
  "icon": "home",
  "type": "internal",
  "route": 0
}
```
- `title`: Display text
- `icon`: Material icon name
- `type`: Must be "internal"
- `route`: Screen index (must be unique for internal routes)

2. External Link Items
```json
{
  "title": "Website",
  "icon": "web",
  "type": "external",
  "url": "https://example.com"
}
```
- `title`: Display text
- `icon`: Material icon name
- `type`: Must be "external"
- `url`: Valid URL to open in WebView

## Available Icons
The following Material icons are supported:
- home
- explore
- notifications
- person
- menu
- music_note
- web
- live_tv
- stream

Additional icons can be added by updating the `_getIconData` method in `CustomDrawer`.

## Validation Rules

The configuration must follow these rules:

1. Header Requirements:
   - Title cannot be empty
   - Background color must be a valid hex color code (#RRGGBB)
   - Icon must be a valid Material icon name

2. Section Requirements:
   - At least one section is required
   - Section name cannot be empty
   - Each section must have at least one item

3. Menu Item Requirements:
   - Title cannot be empty
   - Icon must be a valid Material icon name
   - Internal items must have a unique route number
   - External items must have a valid URL

## Example Configurations

1. Simple Navigation
```json
{
  "drawer": {
    "header": {
      "title": "My App",
      "icon": "menu",
      "backgroundColor": "#1E2530"
    },
    "sections": [
      {
        "name": "Navigation",
        "items": [
          {
            "title": "Home",
            "icon": "home",
            "type": "internal",
            "route": 0
          },
          {
            "title": "Profile",
            "icon": "person",
            "type": "internal",
            "route": 1
          }
        ]
      }
    ]
  }
}
```

2. Multiple Sections
```json
{
  "drawer": {
    "header": {
      "title": "My App",
      "icon": "menu",
      "backgroundColor": "#1E2530"
    },
    "sections": [
      {
        "name": "Main",
        "items": [
          {
            "title": "Home",
            "icon": "home",
            "type": "internal",
            "route": 0
          }
        ]
      },
      {
        "name": "Links",
        "items": [
          {
            "title": "Documentation",
            "icon": "web",
            "type": "external",
            "url": "https://docs.example.com"
          }
        ]
      }
    ]
  }
}
```

## Error Handling

If the configuration file is invalid:
1. The app will display a warning message in the drawer
2. It will fall back to a default configuration
3. Check the console logs for detailed error messages

## Updating the Configuration

1. Modify the `assets/config/navigation_config.json` file
2. Ensure the JSON is valid
3. Restart the app to apply changes

The navigation drawer will automatically update to reflect your changes.