import 'page_util.dart';

class Post {
  final int pid;
  final String title;
  final String cover;
  final String nickname;
  final String avatar;
  final String? content;

  const Post({
    required this.pid,
    required this.title,
    required this.cover,
    required this.nickname,
    required this.avatar,
    this.content,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      pid: json['pid'],
      title: json['title'],
      cover: json['cover'],
      nickname: json['nickname'],
      avatar: json['avatar'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pid': pid,
      'title': title,
      'cover': cover,
      'nickname': nickname,
      'avatar': avatar,
      if (content != null) 'content': content,
    };
  }
}

enum BookmarkType {
  like,
  favorite,
}

abstract class PostsApi {
  /// 根据标签获取推荐的文章列表
  List<Post> listPosts({
    int? tagId,
  });

  /// 搜索文章
  List<Post> searchPosts({
    required String query,
    required PageInfo pageInfo,
  });

  /// 获取文章内容
  Post getPost(int pid);

  /// 获取文章评论
  List<Post> getPostComments({
    required int pid,
    required PageInfo pageInfo,
  });

  /// 创建文章，根据标题、内容、封面
  Post createPost({
    required String title,
    required String content,
    required String cover,
  });

  /// 编辑文章，根据文章id
  Post editPost({
    required int pid,
    required String title,
    required String content,
    required String cover,
  });

  /// 删除文章，根据文章id
  void deletePost(int pid);

  /// 点赞文章，根据文章id
  void bookmarkPost(
    int pid,
    BookmarkType type,
  );

  /// 取消点赞文章，根据文章id
  void cancelBookmarkPost(
    int pid,
    BookmarkType type,
  );
}
