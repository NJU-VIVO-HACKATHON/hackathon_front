import 'package:flutter/material.dart';
import 'package:hackathon_front/global/index.dart';

import 'app.dart';

Future<void> main() async {
  await GlobalObjects.init();
  runApp(const App());
}
