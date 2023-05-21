import 'package:hackathon_front/api/abstract/index.dart';

abstract class ApiProvider {
  UsersApi get user;
  TagsApi get tag;
  PostsApi get post;
  AttachmentApi get attachment;
  SessionApi get session;
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
