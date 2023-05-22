import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackathon_front/api/abstract/index.dart';
import 'package:hackathon_front/global/index.dart';
import 'package:hackathon_front/pages/index/index.dart';
import 'package:hackathon_front/pages/login/index.dart';
import 'package:hackathon_front/pages/login/interested.dart';

final _log = GlobalObjects.logger;

class App extends StatelessWidget {
  const App({super.key});

  Widget buildWidgetWithKeyboardListener(Widget child) {
    return KeyboardListener(
      onKeyEvent: (event) {
        if (event is KeyUpEvent &&
            LogicalKeyboardKey.escape == event.logicalKey) {
          _log.d('松开返回键');
          // if (ctx != null && Navigator.canPop(ctx)) {
          //   Navigator.pop(ctx);
          // }
        }
      },
      focusNode: FocusNode(),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final app = MaterialApp(
      title: 'Hackathon Front',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: () {
        final userStorage = GlobalObjects.storageProvider.user;
        if (userStorage.uid == null) {
          return const LoginModeSelectorPage();
        } else {
          return const IndexPage();
        }
      }(),
      builder: EasyLoading.init(),
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.trackpad,
          PointerDeviceKind.unknown
        },
      ),
    );
    return ScreenUtilInit(builder: (BuildContext content, Widget? widget) {
      return buildWidgetWithKeyboardListener(app);
    });
  }
}
