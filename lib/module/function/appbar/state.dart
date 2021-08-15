import 'package:flutter/material.dart';

class AppBarState {
  late int selectedIndex;

  final List<dynamic> barListItem = [
    {'icon': Icons.message, 'tag': '消息'},
    {'icon': Icons.group, 'tag': '群聊'},
    {'icon': Icons.contact_page, 'tag': '联系人'},
    {'icon': Icons.school, 'tag': '我的'},
  ];

  final List<Widget> pages = [];

  AppBarState() {
    selectedIndex = 0;
  }
}
