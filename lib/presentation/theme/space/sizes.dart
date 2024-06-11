import 'package:flutter/material.dart';

enum Glutter {
  px0,
  px2,
  px3,
  px4,
  px5,
  px6,
  px8,
  px9,
  px10,
  px12,
  px14,
  px16,
  px20,
  px24,
  px28,
  px30,
  px32,
  px36,
  px40,
  px44,
  px48,
  px52,
  px56,
  px110,
  px220,
}

extension GlutterEx on Glutter {
  int get toInt => int.tryParse(name.substring(2))!;
  double get toDouble => double.tryParse(name.substring(2))!;
}

class AppEdgeInset extends EdgeInsets {
  AppEdgeInset.horizontal({Glutter value = Glutter.px16})
      : super.symmetric(horizontal: value.toDouble);
  AppEdgeInset.vertical({Glutter value = Glutter.px16})
      : super.symmetric(vertical: value.toDouble);
  AppEdgeInset.symmetric(
      {Glutter horizontal = Glutter.px16, Glutter vertical = Glutter.px16})
      : super.symmetric(
            horizontal: horizontal.toDouble, vertical: vertical.toDouble);
  AppEdgeInset.all({Glutter value = Glutter.px16}) : super.all(value.toDouble);
  AppEdgeInset.only({
    Glutter left = Glutter.px0,
    Glutter top = Glutter.px0,
    Glutter right = Glutter.px0,
    Glutter bottom = Glutter.px0,
  }) : super.only(
          left: left.toDouble,
          top: top.toDouble,
          right: right.toDouble,
          bottom: bottom.toDouble,
        );
}

class AppBorderRadius extends BorderRadius {
  AppBorderRadius.all(Glutter value)
      : super.all(Radius.circular(value.toDouble));

  AppBorderRadius.only({
    Glutter topLeft = Glutter.px0,
    Glutter topRight = Glutter.px0,
    Glutter bottomLeft = Glutter.px0,
    Glutter bottomRight = Glutter.px0,
  }) : super.only(
          topLeft: Radius.circular(topLeft.toDouble),
          topRight: Radius.circular(topRight.toDouble),
          bottomLeft: Radius.circular(bottomLeft.toDouble),
          bottomRight: Radius.circular(bottomRight.toDouble),
        );

  AppBorderRadius.top(Glutter value)
      : super.only(
          topLeft: Radius.circular(value.toDouble),
          topRight: Radius.circular(value.toDouble),
        );

  AppBorderRadius.bottom(Glutter value)
      : super.only(
          bottomLeft: Radius.circular(value.toDouble),
          bottomRight: Radius.circular(value.toDouble),
        );

  AppBorderRadius.left(Glutter value)
      : super.only(
          topLeft: Radius.circular(value.toDouble),
          bottomLeft: Radius.circular(value.toDouble),
        );

  AppBorderRadius.right(Glutter value)
      : super.only(
          topRight: Radius.circular(value.toDouble),
          bottomRight: Radius.circular(value.toDouble),
        );
}
