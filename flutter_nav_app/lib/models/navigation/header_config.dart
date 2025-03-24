import 'package:json_annotation/json_annotation.dart';

part 'header_config.g.dart';

@JsonSerializable()
class HeaderConfig {
  final String title;
  final String icon;
  @JsonKey(name: 'backgroundColor')
  final String backgroundColor;

  const HeaderConfig({
    required this.title,
    required this.icon,
    required this.backgroundColor,
  });

  factory HeaderConfig.fromJson(Map<String, dynamic> json) =>
      _$HeaderConfigFromJson(json);

  Map<String, dynamic> toJson() => _$HeaderConfigToJson(this);

  @override
  String toString() =>
      'HeaderConfig(title: $title, icon: $icon, backgroundColor: $backgroundColor)';
}
