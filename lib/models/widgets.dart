import 'package:flutter/material.dart';
class CircleAvatarBody extends StatelessWidget {
  const CircleAvatarBody(
      {Key? key,
        required this.colors,
        required this.widget,
        required this.raduisSize})
      : super(key: key);

  final Color colors;

  final double raduisSize;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: colors,
      radius: raduisSize,
      child: widget,
    );
  }
}