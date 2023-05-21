import 'dart:io';

import 'package:dio/dio.dart';

import 'index.dart';

class JwtAuthInterceptor extends Interceptor {
  String? Function() tokenGetter;

  JwtAuthInterceptor({required this.tokenGetter});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final jwtToken = tokenGetter();
    if (jwtToken != null) {
      options.headers['Authorization'] = 'Bearer $jwtToken';
    }
    super.onRequest(options, handler);
  }
}

class MyHttpOverrides extends HttpOverrides {
  final String? proxy;
  MyHttpOverrides(this.proxy);
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    final client = super.createHttpClient(context);
    client.findProxy = (url) {
      if (proxy == null) {
        return 'DIRECT';
      }
      return 'PROXY $proxy';
    };
    return client;
  }
}

Dio getDioClient() {
  HttpOverrides.global = MyHttpOverrides(GlobalConfig.proxy);
  final dio = Dio(BaseOptions(
    baseUrl: GlobalConfig.baseUrl,
    connectTimeout: GlobalConfig.connectTimeout,
    receiveTimeout: GlobalConfig.receiveTimeout,
    sendTimeout: GlobalConfig.sendTimeout,
  ));
  dio.interceptors.add(JwtAuthInterceptor(
      tokenGetter: () => GlobalObjects.storageProvider.user.jwtToken));
  return dio;
}
