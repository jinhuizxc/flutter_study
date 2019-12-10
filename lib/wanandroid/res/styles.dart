// 定义装饰器
import 'package:flutter/material.dart';
import 'package:flutter_study/wanandroid/res/dimens.dart';
import 'package:flutter_study/wanandroid/utils/theme_util.dart';

class Decorations{
  static Decoration bottom = new BoxDecoration(
      border: Border(
        bottom: BorderSide(
          width: 0.5,
          color: ThemeUtils.getThemeData().dividerColor
        )
      )
  );
}

/// 组件间的间隔
class Gaps{
  /// 水平间隔
  static Widget hGaps = new SizedBox(width: Dimens.gap_dp5,);
  static Widget hGap10 = new SizedBox(width: Dimens.gap_dp10);
  static Widget hGap15 = new SizedBox(width: Dimens.gap_dp15);

  /// 垂直间隔
  static Widget vGap5 = new SizedBox(height: Dimens.gap_dp5);
  static Widget vGap10 = new SizedBox(height: Dimens.gap_dp10);
  static Widget vGap15 = new SizedBox(height: Dimens.gap_dp15);
}