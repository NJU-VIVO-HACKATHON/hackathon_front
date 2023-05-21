import 'package:hackathon_front/api/abstract/index.dart';

class PostsApiImpl extends PostsApi {
  @override
  void bookmarkPost(int pid, BookmarkType type) {
    // TODO: implement bookmarkPost
  }

  @override
  void cancelBookmarkPost(int pid, BookmarkType type) {
    // TODO: implement cancelBookmarkPost
  }

  @override
  Post createPost({
    required String title,
    required String content,
    required String cover,
  }) {
    // TODO: implement createPost
    throw UnimplementedError();
  }

  @override
  void deletePost(int pid) {
    // TODO: implement deletePost
  }

  @override
  Post editPost(
      {required int pid,
      required String title,
      required String content,
      required String cover}) {
    // TODO: implement editPost
    throw UnimplementedError();
  }

  @override
  Post getPost(int pid) {
    // TODO: implement getPost
    throw UnimplementedError();
  }

  @override
  List<Post> getPostComments({required int pid, required PageInfo pageInfo}) {
    // TODO: implement getPostComments
    throw UnimplementedError();
  }

  @override
  List<Post> listPosts({int? tagId}) {
    // TODO: implement listPosts
    throw UnimplementedError();
  }

  @override
  List<Post> searchPosts({required String query, required PageInfo pageInfo}) {
    // TODO: implement searchPosts
    throw UnimplementedError();
  }
}
