import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../routes/router.gr.dart';
import 'app_theme.dart';

void main() {
  runApp(Ava());
}

class Ava extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.buildLightTheme(),
      builder: ExtendedNavigator<Router>(
        router: Router(),
        initialRoute: '/',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
