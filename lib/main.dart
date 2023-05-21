import 'package:flutter/material.dart';
import 'package:hackathon_front/global/index.dart';
import 'package:hackathon_front/mock_server/index.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  serve();
  await GlobalObjects.init();

  runApp(const App());
}
