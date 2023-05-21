import 'package:dio/dio.dart';
import 'package:hackathon_front/api/abstract/index.dart';
import 'package:hackathon_front/api/impl/session.dart';
import 'package:hackathon_front/api/impl/users.dart';

abstract class ApiProvider {
  UsersApi get user;
  TagsApi get tag;
  PostsApi get post;
  AttachmentApi get attachment;
  SessionApi get session;
}

class ApiProviderImpl extends ApiProvider {
  final Dio dio;
  ApiProviderImpl(this.dio);
  @override
  // TODO: implement attachment
  AttachmentApi get attachment => throw UnimplementedError();

  @override
  // TODO: implement post
  PostsApi get post => throw UnimplementedError();

  @override
  SessionApi get session => SessionApiImpl(dio);

  @override
  // TODO: implement tag
  TagsApi get tag => throw UnimplementedError();

  @override
  UsersApi get user => UsersApiImpl(dio);
}

class ApiProviderMock extends ApiProvider {
  @override
  UsersApi get user => throw UnimplementedError();

  @override
  TagsApi get tag => throw UnimplementedError();

  @override
  PostsApi get post => throw UnimplementedError();

  @override
  AttachmentApi get attachment => throw UnimplementedError();

  @override
  SessionApi get session => throw UnimplementedError();
}
