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
