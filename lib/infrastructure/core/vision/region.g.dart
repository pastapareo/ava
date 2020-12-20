// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Region _$_$_RegionFromJson(Map<String, dynamic> json) {
  return _$_Region(
    boundingBox: json['boundingBox'] as String,
    lines: (json['lines'] as List)
        ?.map(
            (e) => e == null ? null : Line.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_RegionToJson(_$_Region instance) => <String, dynamic>{
      'boundingBox': instance.boundingBox,
      'lines': instance.lines,
    };
