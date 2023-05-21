import '../abstract/index.dart';
import '../base.dart';

class UserStorageImpl extends StorageImplBase implements UserStorageBase {
  late final String _jwtTokenKey = '$fullNamespace/jwtToken';
  late final String _uidKey = '$fullNamespace/uid';

  UserStorageImpl({
    required super.parentNamespace,
    required super.prefs,
  }) : super(namespace: 'user');

  @override
  String? get jwtToken => prefs.getString(_jwtTokenKey);
  @override
  set jwtToken(String? value) {
    if (value == null) {
      prefs.remove(_jwtTokenKey);
    } else {
      prefs.setString(_jwtTokenKey, value);
    }
  }

  @override
  int? get uid => prefs.getInt(_uidKey);

  @override
  set uid(int? value) {
    if (value == null) {
      prefs.remove(_uidKey);
    } else {
      prefs.setInt(_uidKey, value);
    }
  }
}
