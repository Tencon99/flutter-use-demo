import 'package:flutter/material.dart';
import 'package:flutter_use/module/function/appbar/state.dart';
import 'package:flutter_use/module/function/message/view.dart';
import 'package:flutter_use/module/function/profile/profile_page.dart';
import 'package:flutter_use/module/function/qr_code/qr_code_page.dart';
import 'package:get/get.dart';

class AppBarLogic extends GetxController {
  final state = AppBarState();

  @override
  void onInit() {
    print('onInit${Get.currentRoute}');
    super.onInit();
  }

  @override
  void onReady() {
    print('onReady');
    super.onReady();
  }

  @override
  void onClose() {
    print('关闭${Get.currentRoute}');
    super.onClose();
  }

  onTapItem(int index) {
    print('点击了第$index 个tabbar');
    state.selectedIndex = index;
    update();
  }

  onDoublueIcon(int index) {
    if (state.selectedIndex == index) {
      print('双击了第$index图标');
    }
    update();
  }

  toSerach() {
    print('前往搜索界面');
  }

  toQrCode() {
    print('前往二维码界面');
    Get.to(QrCodePage());
  }

  Widget pages() {
    Widget curPage;
    switch (state.selectedIndex) {
      case 0:
        print('消息页面');
        curPage = MessagePage();
        break;
      case 3:
        curPage = ProfilePage();
        break;
      default:
        curPage = Center(
          child: Text(
              '${state.barListItem[state.selectedIndex]['tag']}页面${state.selectedIndex}'),
        );
    }
    return curPage;
  }
}
