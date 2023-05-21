import 'package:dio/dio.dart';
import 'package:hackathon_front/api/index.dart';
import 'package:hackathon_front/storage/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config.dart';
import 'dio.dart';

export 'config.dart';

class GlobalObjects {
  static final Dio dio = getDioClient();

  static final ApiProvider apiProvider = () {
    return GlobalConfig.isMock ? ApiProviderMock() : ApiProviderImpl(dio);
  }();

  static final StorageProvider storageProvider = () {
    return StorageProviderImpl(prefs: prefs);
  }();

  static late SharedPreferences prefs;
}
