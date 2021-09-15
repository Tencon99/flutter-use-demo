import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sticky_headers/sticky_headers.dart';

import 'tabbar_logic.dart';
import 'tabbar_state.dart';

/// @description:
/// @author
/// @date: 2021/08/26 20:45:41
class TabbarPage extends StatelessWidget {
  final TabbarLogic logic = Get.put(TabbarLogic());
  final TabbarState state = Get.find<TabbarLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('标题'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return StickyHeader(
              header: Container(
                height: 50.0,
                color: Colors.blueGrey[700],
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Header #$index',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              content: Container(
                child: Column(
                  children: <Widget>[
                    Text('testtest'),
                    Image.network(imageForIndex(index),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 200.0)
                  ],
                ),
              ),
            );
          }),
    );
  }

  String imageForIndex(int index) {
    List<String> list = [
      'https://img.iplaysoft.com/wp-content/uploads/2019/free-images/free_stock_photo.jpg',
      'https://img95.699pic.com/photo/50046/5562.jpg_wh300.jpg',
      // 'data:image/jpeg;base64,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',
      'https://up.enterdesk.com/edpic_360_360/27/8f/93/278f938be4b460a57962d542eee989f6.jpg',
      'https://lh3.googleusercontent.com/proxy/386yRGenTMr4pwAm6WWrEH4oSEmm_hKY5X-uLjZ7zCXAmHt-wir2dHQ--6plmp3b9uK9Cu2HDxOgLn6jcUG28e45WijZG5bVHpvWDMHk7iFQH2L2',
      'https://img95.699pic.com/photo/50080/9588.jpg_wh300.jpg',
    ];
    return list[index];
  }
}
