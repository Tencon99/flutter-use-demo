import 'package:flutter_use/module/function/profile/profile_state.dart';
import 'package:get/get.dart';
import 'dart:developer' as developer;

class ProfileLogic extends GetxController {
  final state = ProfileState();

  @override
  void onInit() {
    // 监听滚动事件
    state.scrollController.addListener(() {
      print('offset:${state.scrollController.offset}');
      developer.log('offset:${state.scrollController.offset}', name: '个人中心页面');
      if (state.scrollController.offset <= 0) {
        state.isHeaderTop = 0;
      } else {
        state.isHeaderTop = 1;
      }
      update();
    });
    super.onInit();
  }
}
