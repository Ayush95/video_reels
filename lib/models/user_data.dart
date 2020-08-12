import 'package:flutter/material.dart';

class UserData {
  final String url;
  final String commentCount;
  final String likeCount;
  final String shareCount;
  final String title;
  List<UserInfo> userInfo;

  UserData({
    @required this.url,
    @required this.commentCount,
    @required this.likeCount,
    @required this.shareCount,
    @required this.title,
    @required this.userInfo,
  });
}

class UserInfo {
  final String name;
  final String headshot;

  UserInfo({
    @required this.name,
    @required this.headshot,
  });
}
