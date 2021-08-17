import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_use/app/base/base_scaffold.dart';
import 'package:flutter_use/module/function/profile/profile_logic.dart';
import 'package:flutter_use/module/function/profile/profile_state.dart';
import 'package:flutter_use/module/function/profile/widget/film_content.dart';
import 'package:get/get.dart';
import 'dart:developer' as developer;

class ProfilePage extends GetView {
  final ProfileLogic logic = Get.put(ProfileLogic());
  final ProfileState state = Get.find<ProfileLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileLogic>(builder: (_) {
      return BaseScaffold(
        // body: CustomScrollView(
        //   slivers: <Widget>[
        //     SliverAppBar(
        //       pinned: true,
        //       expandedHeight: 250,
        //       flexibleSpace: FlexibleSpaceBar(
        //         title: Text('页面标题'),
        //         centerTitle: true,
        //         background: Image.network(
        //           'https://img.zcool.cn/community/01c6615d3ae047a8012187f447cfef.jpg@1280w_1l_2o_100sh.jpg',
        //           fit: BoxFit.cover,
        //         ),
        //       ),
        //     ),
        //     // FilmContent(),
        //     SliverFillRemaining(
        //       // 剩余补充内容TabBarView
        //       child: Container(
        //         height: Get.height * 2,
        //         color: Colors.green,
        //         child: Center(
        //           child: Text('Content of Home'),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverCustomHeaderDelegate(
                title: '哪吒之魔童降世',
                collapsedHeight: 40,
                expandedHeight: 300,
                paddingTop:
                    Get.statusBarHeight, //MediaQuery.of(context).padding.top
                coverImgUrl:
                    'https://img.zcool.cn/community/01c6615d3ae047a8012187f447cfef.jpg@1280w_1l_2o_100sh.jpg',
                changeOffset: (shrinkOffset) {
                  developer.log('shrinkOffset:$shrinkOffset', name: '测试页面');
                  WidgetsBinding.instance!.addPostFrameCallback((_) {
                    if (shrinkOffset >= 250) {
                      state.isHeaderTop = 1;
                    } else {
                      state.isHeaderTop = 0;
                    }
                  });
                },
              ),
            ),
            SliverFillRemaining(
              child: FilmContent(),
            )
          ],
        ),
      );
    });
  }
}

class SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double? collapsedHeight;
  final double? expandedHeight;
  final double? paddingTop;
  final String? coverImgUrl;
  final String? title;
  final void Function(dynamic shrinkOffset)? changeOffset;
  String statusBarMode = 'dark';

  SliverCustomHeaderDelegate({
    this.collapsedHeight,
    this.expandedHeight,
    this.paddingTop,
    this.coverImgUrl,
    this.title,
    this.changeOffset,
  });

  @override
  double get minExtent => this.collapsedHeight! + this.paddingTop!;

  @override
  double get maxExtent => this.expandedHeight!;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  void updateStatusBarBrightness(context, shrinkOffset) {
    if (shrinkOffset > 10 && this.statusBarMode == 'dark') {
      this.statusBarMode = 'light';

      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ));
    } else if (shrinkOffset <= 10 && this.statusBarMode == 'light') {
      this.statusBarMode = 'dark';
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ));
    }
  }

  Color makeStickyHeaderBgColor(shrinkOffset) {
    final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255)
        .clamp(0, 255)
        .toInt();
    return Color.fromARGB(alpha, 255, 255, 255);
  }

  Color makeStickyHeaderTextColor(shrinkOffset, isIcon) {
    if (shrinkOffset <= 10) {
      return isIcon ? Colors.white : Colors.white;
    } else {
      final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255)
          .clamp(0, 255)
          .toInt();
      return Color.fromARGB(alpha, 0, 0, 0);
    }
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    this.updateStatusBarBrightness(context, shrinkOffset);
    this.changeOffset!(shrinkOffset);
    return Container(
      height: this.maxExtent,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(child: Image.network(this.coverImgUrl!, fit: BoxFit.cover)),
          Positioned(
            left: 0,
            top: this.maxExtent / 2,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x00000000),
                    Color(0x90000000),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              color: this.makeStickyHeaderBgColor(shrinkOffset),
              child: SafeArea(
                bottom: false,
                child: Container(
                  height: this.collapsedHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: this
                              .makeStickyHeaderTextColor(shrinkOffset, true),
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Text(
                        this.title!,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: this
                              .makeStickyHeaderTextColor(shrinkOffset, false),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.share,
                          color: this
                              .makeStickyHeaderTextColor(shrinkOffset, true),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
