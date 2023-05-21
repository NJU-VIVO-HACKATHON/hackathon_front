import 'package:hackathon_front/api/abstract/index.dart';

class UsersApiImpl extends UsersApi {
  @override
  Future<List<String>> getUserFootprint({
    required FootprintType type,
    required PageInfo pageInfo,
  }) {
    // TODO: implement getUserFootprint
    throw UnimplementedError();
  }

  @override
  Future<UserInfo> getUserInfo() {
    // TODO: implement getUserInfo
    throw UnimplementedError();
  }

  @override
  Future<void> updateUserInfo(UserInfo info) {
    // TODO: implement updateUserInfo
    throw UnimplementedError();
  }
}
