library ava.infrastructure.voice.api;

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:ava/domain/core/exceptions.dart';
import 'package:ava/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:xml/xml.dart' as xml;

part 'api/voice_api_base.dart';
part 'api/voice_api_client.dart';
part 'api/voice_api_endpoint_base.dart';
part 'api/tts.dart';
