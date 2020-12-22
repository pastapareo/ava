// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../eye/ava_vision_screen.dart';

class Routes {
  static const String avaVisionScreen = '/';
  static const all = <String>{
    avaVisionScreen,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.avaVisionScreen, page: AvaVisionScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    AvaVisionScreen: (data) {
      final args = data.getArgs<AvaVisionScreenArguments>(
        orElse: () => AvaVisionScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => AvaVisionScreen(key: args.key),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// AvaVisionScreen arguments holder class
class AvaVisionScreenArguments {
  final Key key;
  AvaVisionScreenArguments({this.key});
}
