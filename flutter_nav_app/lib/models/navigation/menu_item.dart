import 'package:json_annotation/json_annotation.dart';

part 'menu_item.g.dart';

enum MenuItemType {
  @JsonValue('internal')
  internal,
  @JsonValue('external')
  external,
}

@JsonSerializable()
class MenuItem {
  final String title;
  final String icon;
  final MenuItemType type;
  final int? route;
  final String? url;

  const MenuItem({
    required this.title,
    required this.icon,
    required this.type,
    this.route,
    this.url,
  }) : assert(
          (type == MenuItemType.internal && route != null) ||
              (type == MenuItemType.external && url != null),
          'Internal items must have a route, external items must have a URL',
        );

  factory MenuItem.fromJson(Map<String, dynamic> json) =>
      _$MenuItemFromJson(json);

  Map<String, dynamic> toJson() => _$MenuItemToJson(this);

  @override
  String toString() =>
      'MenuItem(title: $title, icon: $icon, type: $type, route: $route, url: $url)';
}
