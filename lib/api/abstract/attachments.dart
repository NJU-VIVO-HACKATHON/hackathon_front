import 'package:dio/dio.dart';

abstract class AttachmentApi {
  Future<String> uploadAttachment();
}
