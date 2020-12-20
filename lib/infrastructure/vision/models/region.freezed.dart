// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'region.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

Region _$RegionFromJson(Map<String, dynamic> json) {
  return _Region.fromJson(json);
}

mixin _$Region {
  String get boundingBox;
  List<Line> get lines;

  Region copyWith({String boundingBox, List<Line> lines});

  Map<String, dynamic> toJson();
}

class _$RegionTearOff {
  const _$RegionTearOff();

  _Region call({@required String boundingBox, @required List<Line> lines}) {
    return _Region(
      boundingBox: boundingBox,
      lines: lines,
    );
  }
}

const $Region = _$RegionTearOff();

@JsonSerializable()
class _$_Region implements _Region {
  const _$_Region({@required this.boundingBox, @required this.lines})
      : assert(boundingBox != null),
        assert(lines != null);

  factory _$_Region.fromJson(Map<String, dynamic> json) =>
      _$_$_RegionFromJson(json);

  @override
  final String boundingBox;
  @override
  final List<Line> lines;

  @override
  String toString() {
    return 'Region(boundingBox: $boundingBox, lines: $lines)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Region &&
            (identical(other.boundingBox, boundingBox) ||
                const DeepCollectionEquality()
                    .equals(other.boundingBox, boundingBox)) &&
            (identical(other.lines, lines) ||
                const DeepCollectionEquality().equals(other.lines, lines)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(boundingBox) ^
      const DeepCollectionEquality().hash(lines);

  @override
  _$_Region copyWith({
    Object boundingBox = freezed,
    Object lines = freezed,
  }) {
    return _$_Region(
      boundingBox:
          boundingBox == freezed ? this.boundingBox : boundingBox as String,
      lines: lines == freezed ? this.lines : lines as List<Line>,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RegionToJson(this);
  }
}

abstract class _Region implements Region {
  const factory _Region(
      {@required String boundingBox, @required List<Line> lines}) = _$_Region;

  factory _Region.fromJson(Map<String, dynamic> json) = _$_Region.fromJson;

  @override
  String get boundingBox;
  @override
  List<Line> get lines;

  @override
  _Region copyWith({String boundingBox, List<Line> lines});
}
