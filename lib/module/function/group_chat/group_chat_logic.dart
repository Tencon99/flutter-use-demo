import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'group_chat_state.dart';

/// @description:
/// @author
/// @date: 2021/09/15 22:26:21
class GroupChatLogic extends GetxController with SingleGetTickerProviderMixin {
  final state = GroupChatState();

  @override
  void onInit() {
    super.onInit();
    state.controller = TabController(length: state.tabs.length, vsync: this);
    state.controller!.addListener(() => _onTabChanged());
  }

  @override
  void onClose() {
    state.controller?.dispose();
    super.onClose();
  }

  _onTabChanged() {
    if (state.controller!.index.toDouble() ==
        state.controller!.animation!.value) {
      //赋值 并更新数据
      state.currentIndex = state.controller!.index;
      update();
      // getDetail();
    }
  }
}
