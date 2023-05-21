import 'dart:io';

import 'package:hackathon_front/global/index.dart';

final _log = GlobalObjects.logger;

Future<void> serve() async {
  final server = await HttpServer.bind(
    InternetAddress.loopbackIPv4,
    53090,
    shared: true,
  );
  await for (final request in server) {
    _log.d('收到请求：${request.uri}');
    if (request.uri.path == '/login') {
      request.response
        ..headers.contentType = ContentType.json
        ..write('{"code": 0, "msg": "ok"}');
    } else {
      request.response
        ..headers.contentType = ContentType.json
        ..write('{"code": 1, "msg": "not found"}');
    }
    await request.response.close();
  }
}
