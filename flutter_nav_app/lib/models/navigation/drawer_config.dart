import 'package:json_annotation/json_annotation.dart';
import 'header_config.dart';
import 'section_config.dart';

part 'drawer_config.g.dart';

@JsonSerializable()
class DrawerConfig {
  final HeaderConfig header;
  final List<SectionConfig> sections;

  const DrawerConfig({
    required this.header,
    required this.sections,
  });

  factory DrawerConfig.fromJson(Map<String, dynamic> json) =>
      _$DrawerConfigFromJson(json);

  Map<String, dynamic> toJson() => _$DrawerConfigToJson(this);

  @override
  String toString() => 'DrawerConfig(header: $header, sections: $sections)';
}
