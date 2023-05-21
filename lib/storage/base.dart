import 'package:shared_preferences/shared_preferences.dart';

class StorageImplBase {
  /// 父命名空间
  final String parentNamespace;

  /// 当前命名空间, 注意不包含父命名空间
  final String namespace;

  /// SharedPreferences对象
  final SharedPreferences prefs;

  StorageImplBase({
    required this.parentNamespace,
    required this.namespace,
    required this.prefs,
  });

  /// 获取完整的命名空间
  String get fullNamespace => '$parentNamespace/$namespace';
}
