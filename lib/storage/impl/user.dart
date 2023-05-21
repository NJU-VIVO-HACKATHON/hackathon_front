import 'package:hackathon_front/util/kv_storage.dart';

import '../abstract/index.dart';

class UserStorageImpl implements UserStorageBase {
  static const _jwtTokenKey = 'jwtToken';
  static const _uidKey = 'uid';
  KvStorage kv;

  UserStorageImpl(this.kv);

  @override
  String? get jwtToken => kv.get<String>(_jwtTokenKey);
  @override
  set jwtToken(String? value) => kv.set(_jwtTokenKey, value);

  @override
  int? get uid => kv.get<int>(_uidKey);
  @override
  set uid(int? value) => kv.set(_uidKey, value);
}
