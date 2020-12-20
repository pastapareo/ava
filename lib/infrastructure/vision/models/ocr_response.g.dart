// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ocr_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OcrResponse _$_$_OcrResponseFromJson(Map<String, dynamic> json) {
  return _$_OcrResponse(
    language: json['language'] as String,
    textAngle: (json['textAngle'] as num)?.toDouble(),
    orientation: json['orientation'] as String,
    regions: (json['regions'] as List)
        ?.map((e) =>
            e == null ? null : Region.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_OcrResponseToJson(_$_OcrResponse instance) =>
    <String, dynamic>{
      'language': instance.language,
      'textAngle': instance.textAngle,
      'orientation': instance.orientation,
      'regions': instance.regions,
    };
