import 'package:flutter/material.dart';

import '../utility/const.dart';
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


class StackContent extends StatelessWidget {
  const StackContent({
    Key? key,
    required this.color,
    required this.name,
  }) : super(key: key);

  final Color color;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 45.0,
          child: Text(
            name.trim().split(' ').map((e) => e[0]).take(2).join(),
            style: kCharDetailsStyle,
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(0.0),
          child: CircleAvatar(
            radius: 16.0,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.male,
              color: Colors.black,
              size: 14,
            ),
          ),
        ),
      ],
    );
  }
}