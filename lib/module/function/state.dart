import 'package:flutter_use/app/config/image_config.dart';
import 'package:flutter_use/app/config/tag_config.dart';
import 'package:flutter_use/bean/common/btn_info.dart';

class FunctionState {
  late List<BtnInfo> items;

  FunctionState() {
    //初始化item
    items = [
      BtnInfo(
        title: '代码规范',
        tag: FunctionConfig.himalaya,
        bg: ImageHimalayaConfig.logo,
        selected: false,
      ),
      BtnInfo(
        title: 'SmartDialog',
        tag: FunctionConfig.smartDialog,
        bg: ImageFunctionConfig.functionBgOne,
      ),
      //暂不需要
      BtnInfo(
        title: '弹窗控件',
        tag: FunctionConfig.dialog,
        bg: ImageFunctionConfig.functionBgTwo,
      ),
      BtnInfo(
        title: 'appbar测试',
        tag: FunctionConfig.appbar,
        bg: ImageFunctionConfig.functionBgThree,
      ),
      BtnInfo(
        title: 'tab测试',
        tag: FunctionConfig.tabbar,
        bg: ImageFunctionConfig.functionBgFour,
      ),
      BtnInfo(
        title: '测试',
        tag: FunctionConfig.test,
        bg: ImageFunctionConfig.functionBgFive,
      ),
    ];
  }
}
