import 'package:flutter/material.dart';
import '../models/navigation/navigation_config.dart';
import '../models/navigation/menu_item.dart';
import '../services/config_service.dart';

class NavigationProvider with ChangeNotifier {
  final NavigationConfigService _configService;
  NavigationConfig? _config;
  int _currentIndex = 0;
  ConfigError? _error;
  bool _isLoading = true;

  NavigationProvider({NavigationConfigService? configService})
      : _configService = configService ?? NavigationConfigService() {
    _loadConfig();
  }

  int get currentIndex => _currentIndex;
  NavigationConfig? get config => _config;
  ConfigError? get error => _error;
  bool get isLoading => _isLoading;

  Future<void> _loadConfig() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await _configService.loadConfig();

    if (result.isSuccess) {
      _config = result.data;
      _error = null;
    } else {
      _config = NavigationConfig.defaultConfig();
      _error = result.error;
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> reloadConfig() => _loadConfig();

  void setIndex(int index) {
    if (index != _currentIndex) {
      _currentIndex = index;
      notifyListeners();
    }
  }

  List<MenuItem> get currentSectionItems {
    if (_config == null ||
        _currentIndex < 0 ||
        _config!.drawer.sections.isEmpty) {
      return [];
    }

    final sections = _config!.drawer.sections;
    for (final section in sections) {
      final internalItems = section.items
          .where((item) => item.type == MenuItemType.internal)
          .toList();

      for (final item in internalItems) {
        if (item.route == _currentIndex) {
          return section.items;
        }
      }
    }

    return sections.first.items;
  }

  String getCurrentTitle() {
    if (_config == null) return '';

    for (final section in _config!.drawer.sections) {
      final item = section.items.firstWhere(
        (item) =>
            item.type == MenuItemType.internal && item.route == _currentIndex,
        orElse: () => MenuItem(
          title: 'Unknown',
          icon: 'error',
          type: MenuItemType.internal,
          route: -1,
        ),
      );

      if (item.route != -1) return item.title;
    }

    return 'Unknown';
  }
}
