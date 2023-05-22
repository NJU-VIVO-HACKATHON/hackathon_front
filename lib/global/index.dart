import 'package:dio/dio.dart';
import 'package:hackathon_front/api/index.dart';
import 'package:hackathon_front/backend.dart';
import 'package:hackathon_front/storage/index.dart';
import 'package:hackathon_front/util/kv_storage.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config.dart';
import 'dio.dart';

export 'config.dart';

class GlobalObjects {
  static final Dio dio = getDioClient();

  static final ApiProvider apiProvider =
      GlobalConfig.isMock ? ApiProviderMock() : ApiProviderImpl(dio);

  static final StorageProvider storageProvider = StorageProviderImpl(kvStorage);
  static final BackendProvider backendProvider = BackendProviderImpl();
  static late KvStorage kvStorage;

  static Logger logger = Logger();

  static Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    kvStorage = KvStorageLogWrapper(
      source: KvStoragePreferenceImpl(prefs),
      logger: logger,
    );
  }
}
