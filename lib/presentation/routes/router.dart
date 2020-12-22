import 'package:auto_route/auto_route_annotations.dart';
import 'package:ava/presentation/eye/ava_vision_screen.dart';
import 'package:ava/presentation/eye/widgets/bottom_bar.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: AvaVisionScreen, initial: true),
  ],
)
class $Router {}
