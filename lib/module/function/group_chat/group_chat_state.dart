import 'package:flutter/material.dart';

/// @description:
/// @author
/// @date: 2021/09/15 22:26:21
class GroupChatState {
  List tabs = ["新闻", "历史", "图片"];

  TabController? controller;

  int currentIndex = 0;

  GroupChatState() {
    ///Initialize variables
  }
}
