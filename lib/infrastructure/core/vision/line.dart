import 'package:freezed_annotation/freezed_annotation.dart';

import 'word.dart';

part 'line.freezed.dart';
part 'line.g.dart';

@freezed
abstract class Line with _$Line {
  const factory Line({
    @required String boundingBox,
    @required List<Word> words,
  }) = _Line;

  factory Line.fromJson(Map<String, dynamic> json) => _$LineFromJson(json);
}
