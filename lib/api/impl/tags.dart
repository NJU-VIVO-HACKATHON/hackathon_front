import 'package:hackathon_front/api/abstract/index.dart';

class TagsApiImpl extends TagsApi {
  @override
  Future<Tag> addTag(Tag tag) {
    // TODO: implement addTag
    throw UnimplementedError();
  }

  @override
  Future<List<Tag>> getAllBasicTags(PageInfo pageInfo) {
    // TODO: implement getAllBasicTags
    throw UnimplementedError();
  }

  @override
  Future<List<Tag>> queryTags(
      {required String query, required PageInfo pageInfo}) {
    // TODO: implement queryTags
    throw UnimplementedError();
  }

  @override
  Future<void> updateUserInitialTags(List<Tag> tags) {
    // TODO: implement updateUserInitialTags
    throw UnimplementedError();
  }
}
