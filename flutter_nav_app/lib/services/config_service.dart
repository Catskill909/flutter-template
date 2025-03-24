import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/navigation/navigation_config.dart';
import '../models/navigation/menu_item.dart';

enum ConfigErrorType {
  fileNotFound,
  invalidJson,
  validationError,
  missingRequired,
  invalidValue,
  unknown
}

class ConfigError {
  final ConfigErrorType type;
  final String message;
  final String? field;
  final dynamic details;
  final StackTrace? stackTrace;

  ConfigError({
    required this.type,
    required this.message,
    this.field,
    this.details,
    this.stackTrace,
  });

  @override
  String toString() =>
      'ConfigError: $message${field != null ? ' (field: $field)' : ''}';
}

class Result<T> {
  final T? data;
  final ConfigError? error;

  Result.success(this.data) : error = null;
  Result.failure(this.error) : data = null;

  bool get isSuccess => error == null;
  bool get isFailure => error != null;
}

class NavigationConfigService {
  static const String _configPath = 'assets/config/navigation_config.json';

  /// Loads and validates the navigation configuration
  Future<Result<NavigationConfig>> loadConfig() async {
    try {
      // Load the configuration file
      final jsonString = await rootBundle.loadString(_configPath);

      // Parse JSON
      final json = jsonDecode(jsonString);

      // Create config object
      final config = NavigationConfig.fromJson(json);

      // Validate the configuration
      final validationResult = _validateConfig(config);
      if (validationResult != null) {
        return Result.failure(validationResult);
      }

      return Result.success(config);
    } on FormatException catch (e, stackTrace) {
      return Result.failure(
        ConfigError(
          type: ConfigErrorType.invalidJson,
          message: 'Invalid JSON format: ${e.message}',
          stackTrace: stackTrace,
        ),
      );
    } on Exception catch (e, stackTrace) {
      return Result.failure(
        ConfigError(
          type: ConfigErrorType.unknown,
          message: e.toString(),
          stackTrace: stackTrace,
        ),
      );
    }
  }

  /// Validates the configuration and returns an error if invalid
  ConfigError? _validateConfig(NavigationConfig config) {
    // Validate header
    if (config.drawer.header.title.isEmpty) {
      return ConfigError(
        type: ConfigErrorType.missingRequired,
        message: 'Header title cannot be empty',
        field: 'header.title',
      );
    }

    if (!_isValidHexColor(config.drawer.header.backgroundColor)) {
      return ConfigError(
        type: ConfigErrorType.invalidValue,
        message: 'Invalid header background color format',
        field: 'header.backgroundColor',
      );
    }

    // Validate sections
    if (config.drawer.sections.isEmpty) {
      return ConfigError(
        type: ConfigErrorType.missingRequired,
        message: 'At least one section is required',
        field: 'sections',
      );
    }

    // Validate menu items
    final Set<int> routes = {};
    for (final section in config.drawer.sections) {
      if (section.name.isEmpty) {
        return ConfigError(
          type: ConfigErrorType.missingRequired,
          message: 'Section name cannot be empty',
          field: 'section.name',
        );
      }

      if (section.items.isEmpty) {
        return ConfigError(
          type: ConfigErrorType.missingRequired,
          message: 'Section must contain at least one item',
          field: 'section.items',
        );
      }

      for (final item in section.items) {
        if (item.title.isEmpty) {
          return ConfigError(
            type: ConfigErrorType.missingRequired,
            message: 'Menu item title cannot be empty',
            field: 'item.title',
          );
        }

        if (item.type == MenuItemType.internal) {
          if (item.route == null) {
            return ConfigError(
              type: ConfigErrorType.missingRequired,
              message: 'Internal menu item must have a route',
              field: 'item.route',
            );
          }

          if (routes.contains(item.route)) {
            return ConfigError(
              type: ConfigErrorType.invalidValue,
              message: 'Duplicate route found: ${item.route}',
              field: 'item.route',
            );
          }
          routes.add(item.route!);
        } else if (item.type == MenuItemType.external) {
          if (item.url == null || !_isValidUrl(item.url!)) {
            return ConfigError(
              type: ConfigErrorType.invalidValue,
              message: 'External menu item must have a valid URL',
              field: 'item.url',
            );
          }
        }
      }
    }

    return null;
  }

  bool _isValidHexColor(String color) {
    return RegExp(r'^#[0-9A-Fa-f]{6}$').hasMatch(color);
  }

  bool _isValidUrl(String url) {
    try {
      final uri = Uri.parse(url);
      return uri.scheme.isNotEmpty && uri.host.isNotEmpty;
    } on FormatException {
      return false;
    }
  }
}
