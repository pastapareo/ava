library ava.infrastructure.core.api;

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:ava/domain/core/exceptions.dart';
import 'package:ava/infrastructure/ffdc/account_balance_dto.dart';
import 'package:ava/infrastructure/ffdc/payment_request.dart';
import 'package:ava/infrastructure/vision/models/ocr_response.dart';
import 'package:ava/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:xml/xml.dart' as xml;

part 'api/api_base.dart';
part 'api/api_endpoint_base.dart';
part 'api/ava_api_client.dart';
part 'api/vision.dart';
part 'api/voice.dart';
part 'api/ffdc.dart';
