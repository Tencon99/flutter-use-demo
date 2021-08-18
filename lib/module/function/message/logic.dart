import 'dart:async';

import 'package:flutter_use/module/function/appbar/logic.dart';
import 'package:flutter_use/module/function/appbar/state.dart';
import 'package:flutter_use/module/function/message/state.dart';
import 'package:get/get.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class MessageLogic extends GetxController {
  final state = MessageState();
  final AppBarState _appBarState = Get.find<AppBarLogic>().state;

  @override
  void onInit() {
    print('当前索引:${_appBarState.selectedIndex}');
    state.title = _appBarState.barListItem[_appBarState.selectedIndex]['tag'];
    update();
    super.onInit();
  }

  @override
  void onClose() {
    // if()
    super.onClose();
  }

  void getCode() {
    // 调用获取验证码接口
    // 开启倒计时器
    if (state.text == '获取验证码') {
      print('开始执行验证码倒计时');
      state.text = '${state.curentTimer} s';
      update();
      // 间隔1s 循环执行
      state.timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
        // 定时任务
        state.curentTimer--;
        state.text = '${state.curentTimer} s';
        if (state.curentTimer < 1) {
          state.timer.cancel();
          state.curentTimer = 60;
          state.text = '重新获取验证码';
          update();
        }
        update();
      });
    }
  }

  toImagePicker(context) async {
    state.assets = (await AssetPicker.pickAssets(context))!;
  }

  toProfile() {
    final AppBarLogic logic = Get.find<AppBarLogic>();
    logic.onTapItem(3);
    // _appBarState.selectedIndex = 3;
    print('当前索引:${_appBarState.selectedIndex}');
    update();
  }
}
