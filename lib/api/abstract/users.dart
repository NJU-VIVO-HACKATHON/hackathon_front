import 'package:hackathon_front/api/abstract/page_util.dart';

class UserInfo {
  final int? uid;
  final String? email;
  final String nickname;
  final String avatar;
  final String phone;

  const UserInfo({
    this.uid,
    this.email,
    required this.nickname,
    required this.avatar,
    required this.phone,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      uid: json['uid'],
      email: json['email'],
      nickname: json['nickname'],
      avatar: json['avatar'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (uid != null) 'uid': uid,
      if (email != null) 'email': email,
      'nickname': nickname,
      'avatar': avatar,
      'phone': phone,
    };
  }
}

class UserFootprint {
  final int pid;
  final String title;
  final String cover;
  final String nickname;
  final String avatar;

  const UserFootprint({
    required this.pid,
    required this.title,
    required this.cover,
    required this.nickname,
    required this.avatar,
  });

  factory UserFootprint.fromJson(Map<String, dynamic> json) {
    return UserFootprint(
      pid: json['pid'],
      title: json['title'],
      cover: json['cover'],
      nickname: json['nickname'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pid': pid,
      'title': title,
      'cover': cover,
      'nickname': nickname,
      'avatar': avatar,
    };
  }
}

enum FootprintType {
  my,
  like,
  favorite,
}

abstract class UsersApi {
  /// 获取用户信息
  Future<UserInfo> getUserInfo();

  /// 更新用户信息
  Future<void> updateUserInfo(UserInfo info);

  /// 获取用户的足迹
  Future<List<String>> getUserFootprint({
    required FootprintType type,
    required PageInfo pageInfo,
  });
}
