import 'package:dio/dio.dart';
import 'package:hackathon_front/api/abstract/index.dart';

class PostsApiImpl extends PostsApi {
  final Dio dio;
  PostsApiImpl(this.dio);
  @override
  Future<void> bookmarkPost(int pid, BookmarkType type) async {
    await dio.post('/posts/$pid/bookmark/${type.name}');
  }

  @override
  Future<void> cancelBookmarkPost(int pid, BookmarkType type) {
    // TODO: implement cancelBookmarkPost
    throw UnimplementedError();
  }

  @override
  Future<Post> createPost(
      {required String title,
      required String content,
      required String cover}) async {
    final resp = await dio.post('/posts', data: {
      'title': title,
      'content': content,
      'cover': cover,
    });
    return Post.fromJson(resp.data);
  }

  @override
  Future<void> deletePost(int pid) async {
    await dio.delete('/posts/$pid');
  }

  @override
  Future<Post> editPost(
      {required int pid,
      required String title,
      required String content,
      required String cover}) {
    // TODO: implement editPost
    throw UnimplementedError();
  }

  @override
  Future<Post> getPost(int pid) async {
    final resp = await dio.get('/posts/$pid');
    return Post.fromJson(resp.data);
  }

  @override
  Future<List<Post>> getPostComments(
      {required int pid, required PageInfo pageInfo}) {
    // TODO: implement getPostComments
    throw UnimplementedError();
  }

  @override
  Future<List<Post>> listPosts({int? tagId}) async {
    final resp = await dio.get('/posts', queryParameters: {
      if (tagId != null) 'tag': tagId,
    });
    return resp.data.map((e) => Post.fromJson(e));
  }

  @override
  Future<List<Post>> searchPosts(
      {required String query, required PageInfo pageInfo}) async {
    final resp = await dio.get('/posts', queryParameters: {
      'q': query,
      'page': pageInfo.pageNum,
      'pageSize': pageInfo.pageSize,
    });
    return resp.data.map((e) => Post.fromJson(e));
  }
}
