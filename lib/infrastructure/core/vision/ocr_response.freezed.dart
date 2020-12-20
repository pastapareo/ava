// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'ocr_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

OcrResponse _$OcrResponseFromJson(Map<String, dynamic> json) {
  return _OcrResponse.fromJson(json);
}

mixin _$OcrResponse {
  String get language;
  double get textAngle;
  String get orientation;
  List<Region> get regions;

  OcrResponse copyWith(
      {String language,
      double textAngle,
      String orientation,
      List<Region> regions});

  Map<String, dynamic> toJson();
}

class _$OcrResponseTearOff {
  const _$OcrResponseTearOff();

  _OcrResponse call(
      {@required String language,
      @required double textAngle,
      @required String orientation,
      @required List<Region> regions}) {
    return _OcrResponse(
      language: language,
      textAngle: textAngle,
      orientation: orientation,
      regions: regions,
    );
  }
}

const $OcrResponse = _$OcrResponseTearOff();

@JsonSerializable()
class _$_OcrResponse implements _OcrResponse {
  const _$_OcrResponse(
      {@required this.language,
      @required this.textAngle,
      @required this.orientation,
      @required this.regions})
      : assert(language != null),
        assert(textAngle != null),
        assert(orientation != null),
        assert(regions != null);

  factory _$_OcrResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_OcrResponseFromJson(json);

  @override
  final String language;
  @override
  final double textAngle;
  @override
  final String orientation;
  @override
  final List<Region> regions;

  @override
  String toString() {
    return 'OcrResponse(language: $language, textAngle: $textAngle, orientation: $orientation, regions: $regions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OcrResponse &&
            (identical(other.language, language) ||
                const DeepCollectionEquality()
                    .equals(other.language, language)) &&
            (identical(other.textAngle, textAngle) ||
                const DeepCollectionEquality()
                    .equals(other.textAngle, textAngle)) &&
            (identical(other.orientation, orientation) ||
                const DeepCollectionEquality()
                    .equals(other.orientation, orientation)) &&
            (identical(other.regions, regions) ||
                const DeepCollectionEquality().equals(other.regions, regions)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(language) ^
      const DeepCollectionEquality().hash(textAngle) ^
      const DeepCollectionEquality().hash(orientation) ^
      const DeepCollectionEquality().hash(regions);

  @override
  _$_OcrResponse copyWith({
    Object language = freezed,
    Object textAngle = freezed,
    Object orientation = freezed,
    Object regions = freezed,
  }) {
    return _$_OcrResponse(
      language: language == freezed ? this.language : language as String,
      textAngle: textAngle == freezed ? this.textAngle : textAngle as double,
      orientation:
          orientation == freezed ? this.orientation : orientation as String,
      regions: regions == freezed ? this.regions : regions as List<Region>,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_OcrResponseToJson(this);
  }
}

abstract class _OcrResponse implements OcrResponse {
  const factory _OcrResponse(
      {@required String language,
      @required double textAngle,
      @required String orientation,
      @required List<Region> regions}) = _$_OcrResponse;

  factory _OcrResponse.fromJson(Map<String, dynamic> json) =
      _$_OcrResponse.fromJson;

  @override
  String get language;
  @override
  double get textAngle;
  @override
  String get orientation;
  @override
  List<Region> get regions;

  @override
  _OcrResponse copyWith(
      {String language,
      double textAngle,
      String orientation,
      List<Region> regions});
}
