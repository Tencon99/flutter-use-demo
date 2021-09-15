import 'package:flutter/material.dart';
import 'package:flutter_use/app/base/base_scaffold.dart';
import 'package:get/get.dart';

import 'group_chat_logic.dart';
import 'group_chat_state.dart';
import 'widget/custom_rrect_tab_indicator.dart';

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
          backgroundColor: Colors.white,
          bottom: TabBar(
            isScrollable: true,
            labelPadding: EdgeInsets.symmetric(horizontal: 8),
            indicator: CustomRRecTabIndicator(
                radius: 14.75, color: Color(0xffffe7e7), width: 120),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 0,
            labelColor: Color(0xffef3454),
            labelStyle: TextStyle(
                fontSize: 15,
                color: Color(0xffef3454),
                fontWeight: FontWeight.w700),
            unselectedLabelColor: Color(0xffcccccc),
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
