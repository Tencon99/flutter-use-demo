import 'package:flutter/material.dart';
import 'package:flutter_use/module/function/message/logic.dart';
import 'package:flutter_use/module/function/message/state.dart';
import 'package:get/get.dart';

class MessagePage extends StatelessWidget {
  final MessageLogic logic = Get.put(MessageLogic());
  final MessageState state = Get.find<MessageLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('当前页面为：${state.title}'),
          TextButton(
            onPressed: logic.toProfile,
            child: Text('跳转到我的'),
          ),
          TextButton(
            onPressed: () {
              logic.toImagePicker(context);
            },
            child: Text('图片选择器'),
          ),
        ],
      ),
      color: Colors.teal[300],
    );
  }
}
