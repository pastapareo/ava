import 'package:auto_route/auto_route_annotations.dart';
import 'package:ava/presentation/eye/eye_screen.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: EyeScreen, initial: true),
  ],
)
class $Router {}
