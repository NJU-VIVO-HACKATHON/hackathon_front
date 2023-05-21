import 'package:flutter_test/flutter_test.dart';
import 'package:hackathon_front/api/abstract/index.dart';
import 'package:hackathon_front/global/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  SharedPreferences.setMockInitialValues({});
  await GlobalObjects.init();

  test('test user', () async {
    final api = GlobalObjects.apiProvider;
    final session = api.session;
    await session.getAuthToken(
      mode: AuthMode.sms,
      info: const AuthInfo(sms: '123'),
    );
  });

  test('test get user info', () async {
    final api = GlobalObjects.apiProvider;
    final user = api.user;
    await user.getUserInfo(1);
  });

  test('test update user info', () async {
    final api = GlobalObjects.apiProvider;
    final user = api.user;
    await user.updateUserInfo(UserInfo(
      uid: 1,
      nickname: 'test1',
      avatar: "avatar1",
    ));
  });
}
