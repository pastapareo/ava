import 'package:freezed_annotation/freezed_annotation.dart';

import 'line.dart';

part 'region.freezed.dart';
part 'region.g.dart';

@freezed
abstract class Region with _$Region {
  const factory Region({
    @required String boundingBox,
    @required List<Line> lines,
  }) = _Region;

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);
}
