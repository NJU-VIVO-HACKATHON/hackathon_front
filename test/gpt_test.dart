import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('test gpt', () async {
    final dio = Dio();
    final resp = await dio.post(
      'http://139.196.48.244:2023/aigc/image',
      data: {
        'prompt': '你好',
      },
    );
    print(resp.data);
  });
}
