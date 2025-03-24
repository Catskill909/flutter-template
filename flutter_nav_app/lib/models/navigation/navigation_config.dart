import 'package:json_annotation/json_annotation.dart';
import 'drawer_config.dart';
import 'header_config.dart';
import 'section_config.dart';
import 'menu_item.dart';

part 'navigation_config.g.dart';

@JsonSerializable()
class NavigationConfig {
  final DrawerConfig drawer;

  const NavigationConfig({
    required this.drawer,
  });

  factory NavigationConfig.fromJson(Map<String, dynamic> json) =>
      _$NavigationConfigFromJson(json);

  Map<String, dynamic> toJson() => _$NavigationConfigToJson(this);

  @override
  String toString() => 'NavigationConfig(drawer: $drawer)';

  /// Creates a default navigation configuration
  static NavigationConfig defaultConfig() {
    return NavigationConfig(
      drawer: DrawerConfig(
        header: HeaderConfig(
          title: 'Navigation Menu',
          icon: 'menu',
          backgroundColor: '#1E2530',
        ),
        sections: [
          SectionConfig(
            name: 'Main Navigation',
            items: [
              MenuItem(
                title: 'Home',
                icon: 'home',
                type: MenuItemType.internal,
                route: 0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
