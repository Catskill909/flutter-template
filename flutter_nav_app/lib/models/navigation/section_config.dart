import 'package:json_annotation/json_annotation.dart';
import 'menu_item.dart';

part 'section_config.g.dart';

@JsonSerializable()
class SectionConfig {
  final String name;
  final List<MenuItem> items;

  const SectionConfig({
    required this.name,
    required this.items,
  });

  factory SectionConfig.fromJson(Map<String, dynamic> json) =>
      _$SectionConfigFromJson(json);

  Map<String, dynamic> toJson() => _$SectionConfigToJson(this);

  @override
  String toString() => 'SectionConfig(name: $name, items: $items)';
}
