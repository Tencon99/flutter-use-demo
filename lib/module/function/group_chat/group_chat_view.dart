import 'package:flutter/material.dart';
import 'package:flutter_use/app/base/base_scaffold.dart';
import 'package:get/get.dart';

import 'group_chat_logic.dart';
import 'group_chat_state.dart';

/// @description:
/// @author
/// @date: 2021/09/15 22:26:21
class GroupChatPage extends StatelessWidget {
  final GroupChatLogic logic = Get.put(GroupChatLogic());
  final GroupChatState state = Get.find<GroupChatLogic>().state;

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: state.tabs.length,
      child: BaseScaffold(
        appBar: AppBar(
          bottom: TabBar(
            controller: state.controller,
            tabs: state.tabs.map((e) => Tab(text: e)).toList(),
          ),
        ),
        body: new TabBarView(
          controller: state.controller,
          children: state.tabs.map((e) {
            return Center(
              child: Text(e, textScaleFactor: 5),
            );
          }).toList(),
        ),
      ),
    );
  }
}
