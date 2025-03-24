// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drawer_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrawerConfig _$DrawerConfigFromJson(Map<String, dynamic> json) => DrawerConfig(
      header: HeaderConfig.fromJson(json['header'] as Map<String, dynamic>),
      sections: (json['sections'] as List<dynamic>)
          .map((e) => SectionConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DrawerConfigToJson(DrawerConfig instance) =>
    <String, dynamic>{
      'header': instance.header,
      'sections': instance.sections,
    };
