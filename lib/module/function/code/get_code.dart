import 'package:flutter/material.dart';
import 'package:flutter_use/app/typedef/function.dart';

class GetCode extends StatelessWidget {
  const GetCode(
      {Key? key,
      required this.text,
      required this.onTap,
      required this.isValidated,
      this.textColor})
      : super(key: key);

  final String text;

  final ParamVoidCallback onTap;

  /// 是否已经通过上一步验证, 通过验证为true,即可触发onTap的点击事件.
  final bool isValidated;

  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Text(
          text,
          style: TextStyle(
            color: textColor ?? Color(0xff24DEF5),
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      onTap: isValidated ? onTap : null,
    );
  }
}
