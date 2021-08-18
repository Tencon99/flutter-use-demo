import 'dart:async';

import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class MessageState {
  late String title;
  late List<AssetEntity> assets;

  late String text;
  late Timer timer;
  late int curentTimer = 60;
  MessageState() {
    text = '获取验证码';
  }
}
