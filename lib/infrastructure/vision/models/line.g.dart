// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'line.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Line _$_$_LineFromJson(Map<String, dynamic> json) {
  return _$_Line(
    boundingBox: json['boundingBox'] as String,
    words: (json['words'] as List)
        ?.map(
            (e) => e == null ? null : Word.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_LineToJson(_$_Line instance) => <String, dynamic>{
      'boundingBox': instance.boundingBox,
      'words': instance.words,
    };
