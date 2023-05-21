import 'package:dio/dio.dart';
import 'package:hackathon_front/api/abstract/index.dart';

class UsersApiImpl extends UsersApi {
  final Dio dio;
  UsersApiImpl(this.dio);

  @override
  Future<List<String>> getUserFootprint({
    required FootprintType type,
    required PageInfo pageInfo,
  }) {
    // TODO: implement getUserFootprint
    throw UnimplementedError();
  }

  @override
  Future<UserInfo> getUserInfo(int uid) async {
    final res = await dio.get('/users/$uid/info');
    return UserInfo.fromJson(res.data);
  }

  @override
  Future<void> updateUserInfo(UserInfo info) async {
    await dio.post(
      '/users/${info.uid}/info',
      data: info.toJson(),
    );
  }
}
