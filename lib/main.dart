import 'package:flutter/material.dart';

import 'injection.dart';
import 'presentation/core/ava_app.dart';

void main() {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Ava());
}
