import 'package:dio/dio.dart';
import 'package:hackathon_front/api/abstract/index.dart';
import 'package:hackathon_front/global/index.dart';

final _log = GlobalObjects.logger;

class SessionApiImpl extends SessionApi {
  final Dio dio;
  SessionApiImpl(this.dio);

  @override
  Future<String> getAuthToken({
    required AuthMode mode,
    required AuthInfo info,
  }) async {
    _log.d('getAuthToken: $mode, $info');
    final resp = await dio.post('/session', data: {
      'mode': mode.name,
      'auth': info.toJson(),
    });
    _log.d('getAuthToken: $resp');
    return resp.data['token'];
  }

  @override
  Future<void> requestAuthCode({
    required AuthMode mode,
    required AuthInfo info,
  }) async {
    final resp = await dio.post(
      '/session/authcode',
      data: {
        'mode': mode.toString(),
        'auth': info.toJson(),
      },
    );
    return resp.data['message'];
  }
}
