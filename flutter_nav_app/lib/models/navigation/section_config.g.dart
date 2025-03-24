// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectionConfig _$SectionConfigFromJson(Map<String, dynamic> json) =>
    SectionConfig(
      name: json['name'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => MenuItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SectionConfigToJson(SectionConfig instance) =>
    <String, dynamic>{
      'name': instance.name,
      'items': instance.items,
    };
