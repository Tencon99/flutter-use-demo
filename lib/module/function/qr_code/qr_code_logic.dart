import 'package:flutter_use/module/function/qr_code/qr_code_state.dart';
import 'package:get/get.dart';
import 'package:scan/scan.dart';

class QrCodeLogic extends GetxController {
  final state = QrCodeState();

  @override
  void onInit() {
    state.controller = ScanController();
    super.onInit();
  }
}
