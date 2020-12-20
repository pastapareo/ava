// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'line.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

Line _$LineFromJson(Map<String, dynamic> json) {
  return _Line.fromJson(json);
}

mixin _$Line {
  String get boundingBox;
  List<Word> get words;

  Line copyWith({String boundingBox, List<Word> words});

  Map<String, dynamic> toJson();
}

class _$LineTearOff {
  const _$LineTearOff();

  _Line call({@required String boundingBox, @required List<Word> words}) {
    return _Line(
      boundingBox: boundingBox,
      words: words,
    );
  }
}

const $Line = _$LineTearOff();

@JsonSerializable()
class _$_Line implements _Line {
  const _$_Line({@required this.boundingBox, @required this.words})
      : assert(boundingBox != null),
        assert(words != null);

  factory _$_Line.fromJson(Map<String, dynamic> json) =>
      _$_$_LineFromJson(json);

  @override
  final String boundingBox;
  @override
  final List<Word> words;

  @override
  String toString() {
    return 'Line(boundingBox: $boundingBox, words: $words)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Line &&
            (identical(other.boundingBox, boundingBox) ||
                const DeepCollectionEquality()
                    .equals(other.boundingBox, boundingBox)) &&
            (identical(other.words, words) ||
                const DeepCollectionEquality().equals(other.words, words)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(boundingBox) ^
      const DeepCollectionEquality().hash(words);

  @override
  _$_Line copyWith({
    Object boundingBox = freezed,
    Object words = freezed,
  }) {
    return _$_Line(
      boundingBox:
          boundingBox == freezed ? this.boundingBox : boundingBox as String,
      words: words == freezed ? this.words : words as List<Word>,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LineToJson(this);
  }
}

abstract class _Line implements Line {
  const factory _Line(
      {@required String boundingBox, @required List<Word> words}) = _$_Line;

  factory _Line.fromJson(Map<String, dynamic> json) = _$_Line.fromJson;

  @override
  String get boundingBox;
  @override
  List<Word> get words;

  @override
  _Line copyWith({String boundingBox, List<Word> words});
}
