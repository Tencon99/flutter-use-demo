import 'package:get/get.dart';

import 'image_preview_state.dart';

/// @description:
/// @author
/// @date: 2021/09/14 22:33:19
class ImagePreviewLogic extends GetxController {
  final state = ImagePreviewState();

  @override
  void onInit() {
    state.url = Get.arguments;
    super.onInit();
  }
}
