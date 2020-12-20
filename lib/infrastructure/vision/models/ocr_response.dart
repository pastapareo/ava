import 'package:freezed_annotation/freezed_annotation.dart';

import 'region.dart';

part 'ocr_response.freezed.dart';
part 'ocr_response.g.dart';

@freezed
abstract class OcrResponse with _$OcrResponse {
  const factory OcrResponse({
    @required String language,
    @required double textAngle,
    @required String orientation,
    @required List<Region> regions,
  }) = _OcrResponse;

  factory OcrResponse.fromJson(Map<String, dynamic> json) => _$OcrResponseFromJson(json);
}
