import 'dart:async';
import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_front/api/abstract/index.dart';
import 'package:hackathon_front/global/index.dart';
import 'package:hackathon_front/pages/index/index.dart';
import 'package:hackathon_front/pages/login/interested.dart';
import 'package:hackathon_front/util/flash.dart';
import 'package:hackathon_front/util/launch.dart';

final _log = GlobalObjects.logger;

class LoginModeSelectorPage extends StatelessWidget {
  const LoginModeSelectorPage({Key? key}) : super(key: key);

  Widget buildLoginModeButton(IconData icon, String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            child: Icon(icon, size: 30),
          ),
          const SizedBox(height: 10),
          Text(text),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Hackathon',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildLoginModeButton(Icons.email, '邮箱登录', () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LoginPage(
                      mode: AuthMode.email,
                    ),
                  ));
                }),
                buildLoginModeButton(Icons.phone, '手机登录', () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LoginPage(
                      mode: AuthMode.sms,
                    ),
                  ));
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AuthCodeButton extends StatefulWidget {
  final ValueGetter<Future<void>>? sendAuthCode;
  const AuthCodeButton({Key? key, this.sendAuthCode}) : super(key: key);

  @override
  State<AuthCodeButton> createState() => _AuthCodeButtonState();
}

class _AuthCodeButtonState extends State<AuthCodeButton> {
  Timer? timer;
  int remainingSeconds = 0;

  @override
  Widget build(BuildContext context) {
    if (remainingSeconds > 0) {
      return TextButton(
        onPressed: null,
        child: Text('$remainingSeconds 秒后重试'),
      );
    } else {
      return TextButton(
        onPressed: () async {
          if (remainingSeconds > 0) return;
          setState(() {
            remainingSeconds = 3;
          });
          await widget.sendAuthCode?.call();
          timer = Timer.periodic(const Duration(seconds: 1), (timer) {
            if (!mounted) return;
            setState(() {
              remainingSeconds -= 1;
            });
            if (remainingSeconds == 0) {
              timer.cancel();
            }
          });
        },
        child: const Text('获取验证码'),
      );
    }
  }
}

class LoginPage extends StatefulWidget {
  final AuthMode mode;
  const LoginPage({
    Key? key,
    required this.mode,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _inputController = TextEditingController();
  final TextEditingController _authCodeController = TextEditingController();

  // State
  bool isPasswordClear = false;
  bool isLicenseAccepted = false;
  bool disableLoginButton = false;

  /// 用户点击登录按钮后
  Future<void> onLogin() async {
    if (!isLicenseAccepted) {
      showBasicFlash(context, const Text('请勾选用户协议'));
      return;
    }

    setState(() {
      disableLoginButton = true;
    });
    try {
      if (!mounted) return;
      final api = GlobalObjects.apiProvider;
      final authInfo = AuthInfo(
        sms: widget.mode == AuthMode.sms ? _inputController.text : null,
        email: widget.mode == AuthMode.email ? _inputController.text : null,
        code: _authCodeController.text,
      );
      String token = await api.session.getAuthToken(
        mode: widget.mode,
        info: authInfo,
      );
      _log.d('jwt token: $token');
      if (!mounted) return;
      showBasicFlash(context, const Text('登录成功'));
      GlobalObjects.storageProvider.user.jwtToken = token;
      final profile = String.fromCharCodes(base64Decode(token.split('.')[1]));
      _log.d('profile: $profile');
      final profileMap = jsonDecode(profile);
      GlobalObjects.storageProvider.user.uid = profileMap['uid'];
      await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return const InterestedPage();
      }));
      if (!mounted) return;
      await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const IndexPage(),
      ));
    } catch (e) {
      _log.d('$e');
      showBasicFlash(context, Text('登录异常: ${e.toString().split('\n')[0]}'));
      setState(() {
        disableLoginButton = false;
      });
    }
  }

  static void onOpenUserLicense() {
    // launchInBrowser(Backend.license);
  }

  Widget buildTitleLine() {
    return Container(
      alignment: Alignment.centerLeft,
      child: const Text(
        '欢迎登录',
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildLoginForm() {
    return Column(
      children: [
        TextFormField(
          controller: _inputController,
          autofocus: true,
          decoration: InputDecoration(
            labelText: {
              AuthMode.email: '请输入您的邮箱',
              AuthMode.sms: '请输入您的手机号',
            }[widget.mode]!,
            hintText: {
              AuthMode.email: '输入你的邮箱',
              AuthMode.sms: '输入你的手机号',
            }[widget.mode]!,
            icon: const Icon(Icons.person),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _authCodeController,
                autofocus: true,
                decoration: const InputDecoration(
                  labelText: '请输入接收到的验证码',
                  hintText: '输入你的校验信息',
                  icon: Icon(Icons.lock),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: Colors.grey),
                color: Colors.white,
              ),
              child: AuthCodeButton(
                sendAuthCode: () async {
                  final api = GlobalObjects.apiProvider;
                  final authInfo = AuthInfo(
                    sms: widget.mode == AuthMode.sms
                        ? _inputController.text
                        : null,
                    email: widget.mode == AuthMode.email
                        ? _inputController.text
                        : null,
                  );
                  api.session.requestAuthCode(
                    mode: widget.mode,
                    info: authInfo,
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildUserLicenseCheckbox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          value: isLicenseAccepted,
          onChanged: (e) {
            setState(() => isLicenseAccepted = e!);
          },
        ),
        Expanded(
          child: Wrap(
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(text: '未注册用户登录后将自动注册，请确认您已阅读并同意'),
                    TextSpan(
                      text: '《用户协议》',
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = onOpenUserLicense,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildLoginButton() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 40,
          child: ElevatedButton(
            onPressed: disableLoginButton ? null : onLogin,
            child: const Text('进入首页'),
          ),
        ),
        TextButton(
          child: const Text(
            '遇到问题?',
            style: TextStyle(color: Colors.grey),
          ),
          onPressed: () =>
              launchInBrowser('https://support.qq.com/products/377648'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              width: screenWidth,
              padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title field.
                  buildTitleLine(),
                  const Padding(padding: EdgeInsets.only(top: 40.0)),
                  // Form field: username and password.
                  buildLoginForm(),
                  const SizedBox(height: 10),
                  // User license check box.
                  buildUserLicenseCheckbox(),
                  const SizedBox(height: 25),
                  // Login button.
                  buildLoginButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
