import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_use/app/base/base_scaffold.dart';
import 'package:get/get.dart';

import 'image_preview_logic.dart';
import 'image_preview_state.dart';

/// @description:
/// @author
/// @date: 2021/09/14 22:33:19
class ImagePreviewPage extends StatelessWidget {
  final ImagePreviewLogic logic = Get.put(ImagePreviewLogic());
  final ImagePreviewState state = Get.find<ImagePreviewLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: BaseScaffold(
        body: Center(
          child: Hero(
            child: ExtendedImage.network(
              state.url,
              fit: BoxFit.fill,
              // shape: BoxShape.circle,
              // saveNetworkImageToPhoto:,
            ),
            tag: state.url,
          ),
        ),
      ),
    );
  }
}
