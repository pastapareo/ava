// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../eye/eye_screen.dart';

class Routes {
  static const String eyeScreen = '/';
  static const all = <String>{
    eyeScreen,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.eyeScreen, page: EyeScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    EyeScreen: (data) {
      final args = data.getArgs<EyeScreenArguments>(
        orElse: () => EyeScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => EyeScreen(key: args.key),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// EyeScreen arguments holder class
class EyeScreenArguments {
  final Key key;
  EyeScreenArguments({this.key});
}
