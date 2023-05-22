import 'package:dio/dio.dart';
import 'package:hackathon_front/global/index.dart';

final dio = GlobalObjects.dio;

enum GenMode {
  text,
  image,
}

Future<String> generateContentByAI(String prompt, GenMode mode) async {
  final resp = await Dio().post(
    'http://139.196.48.244:2023/aigc/${mode == GenMode.text ? 'chat' : 'image'}',
    data: {
      'prompt': prompt,
    },
  );
  return resp.data;
}
