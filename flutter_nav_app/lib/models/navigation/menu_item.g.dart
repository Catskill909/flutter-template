// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuItem _$MenuItemFromJson(Map<String, dynamic> json) => MenuItem(
      title: json['title'] as String,
      icon: json['icon'] as String,
      type: $enumDecode(_$MenuItemTypeEnumMap, json['type']),
      route: (json['route'] as num?)?.toInt(),
      url: json['url'] as String?,
    );

Map<String, dynamic> _$MenuItemToJson(MenuItem instance) => <String, dynamic>{
      'title': instance.title,
      'icon': instance.icon,
      'type': _$MenuItemTypeEnumMap[instance.type]!,
      'route': instance.route,
      'url': instance.url,
    };

const _$MenuItemTypeEnumMap = {
  MenuItemType.internal: 'internal',
  MenuItemType.external: 'external',
};
