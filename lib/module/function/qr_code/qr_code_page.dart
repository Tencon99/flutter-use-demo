import 'package:flutter/material.dart';
import 'package:flutter_use/app/base/base_scaffold.dart';
import 'package:flutter_use/module/function/qr_code/qr_code_logic.dart';
import 'package:flutter_use/module/function/qr_code/qr_code_state.dart';
import 'package:get/get.dart';
import 'package:scan/scan.dart';

class QrCodePage extends StatelessWidget {
  final QrCodeLogic logic = Get.put(QrCodeLogic());
  final QrCodeState state = Get.find<QrCodeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QrCodeLogic>(builder: (_) {
      return BaseScaffold(
        appBar: AppBar(),
        body: Container(
          width: 250, // custom wrap size
          height: 250,
          child: ScanView(
            controller: state.controller,
// custom scan area, if set to 1.0, will scan full area
            scanAreaScale: .7,
            scanLineColor: Colors.green.shade400,
            onCapture: (data) {
              // use data do something
            },
          ),
        ),
      );
    });
  }
}
