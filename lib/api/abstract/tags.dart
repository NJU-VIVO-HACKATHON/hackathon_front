import 'package:hackathon_front/api/abstract/page_util.dart';

class Tag {
  final int tid;
  final String name;
  final String? cover;

  const Tag({
    required this.tid,
    required this.name,
    this.cover,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      tid: json['tid'],
      name: json['name'],
      cover: json['cover'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tid': tid,
      'name': name,
      if (cover != null) 'cover': cover,
    };
  }
}

abstract class TagsApi {
  /// 添加标签
  Future<Tag> addTag(Tag tag);

  /// 检索标签
  Future<List<Tag>> queryTags({
    required String query,
    required PageInfo pageInfo,
  });

  /// 获取所有Basic标签
  Future<List<Tag>> getAllBasicTags(PageInfo pageInfo);

  /// 更新用户初始感兴趣的标签
  Future<void> updateUserInitialTags(List<Tag> tags);
}
