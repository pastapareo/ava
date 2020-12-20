// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'word.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

Word _$WordFromJson(Map<String, dynamic> json) {
  return _Word.fromJson(json);
}

mixin _$Word {
  String get boundingBox;
  String get text;

  Word copyWith({String boundingBox, String text});

  Map<String, dynamic> toJson();
}

class _$WordTearOff {
  const _$WordTearOff();

  _Word call({@required String boundingBox, @required String text}) {
    return _Word(
      boundingBox: boundingBox,
      text: text,
    );
  }
}

const $Word = _$WordTearOff();

@JsonSerializable()
class _$_Word implements _Word {
  const _$_Word({@required this.boundingBox, @required this.text})
      : assert(boundingBox != null),
        assert(text != null);

  factory _$_Word.fromJson(Map<String, dynamic> json) =>
      _$_$_WordFromJson(json);

  @override
  final String boundingBox;
  @override
  final String text;

  @override
  String toString() {
    return 'Word(boundingBox: $boundingBox, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Word &&
            (identical(other.boundingBox, boundingBox) ||
                const DeepCollectionEquality()
                    .equals(other.boundingBox, boundingBox)) &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(boundingBox) ^
      const DeepCollectionEquality().hash(text);

  @override
  _$_Word copyWith({
    Object boundingBox = freezed,
    Object text = freezed,
  }) {
    return _$_Word(
      boundingBox:
          boundingBox == freezed ? this.boundingBox : boundingBox as String,
      text: text == freezed ? this.text : text as String,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_WordToJson(this);
  }
}

abstract class _Word implements Word {
  const factory _Word({@required String boundingBox, @required String text}) =
      _$_Word;

  factory _Word.fromJson(Map<String, dynamic> json) = _$_Word.fromJson;

  @override
  String get boundingBox;
  @override
  String get text;

  @override
  _Word copyWith({String boundingBox, String text});
}
