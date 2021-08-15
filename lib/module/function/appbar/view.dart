import 'package:flutter/material.dart';
import 'package:flutter_use/app/base/base_scaffold.dart';
import 'package:flutter_use/module/function/appbar/logic.dart';
import 'package:flutter_use/module/function/appbar/state.dart';
import 'bottomNavigationBar/bottom_navigation_bar.dart' as prefix;
import 'package:get/get.dart';

class AppbarPage extends StatelessWidget {
  final AppBarLogic logic = Get.put(AppBarLogic());
  final AppBarState state = Get.find<AppBarLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppBarLogic>(builder: (login) {
      return BaseScaffold(
        appBar: AppBar(
          title: Text(state.barListItem[state.selectedIndex]['tag']),
          centerTitle: true,
          actions: <Widget>[
            state.selectedIndex == 0
                ? IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: logic.toSerach,
                  )
                : Container(),
            state.selectedIndex == 3
                ? IconButton(
                    icon: const Icon(Icons.qr_code),
                    onPressed: logic.toQrCode,
                  )
                : Container(),
          ],
        ),
        bottomNavigationBar: prefix.BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.email), label: state.barListItem[0]['tag']),
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: state.barListItem[1]['tag']),
            BottomNavigationBarItem(
                icon: Icon(Icons.perm_contact_cal),
                label: state.barListItem[2]['tag']),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: state.barListItem[3]['tag']),
          ],
          currentIndex: state.selectedIndex,
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.grey,
          fixedColor: Colors.lightBlue[600],
          showUnselectedLabels: true,
          onTap: logic.onTapItem,
          type: prefix.BottomNavigationBarType.fixed,
          onDoubleTap: logic.onDoublueIcon,
          elevation: 1.0,
        ),
        backgroundColor: Colors.white, //默认页面背景
        body: logic.pages(),
      );
    });
  }
}
