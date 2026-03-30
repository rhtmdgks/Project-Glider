import 'dart:math' as math;

import 'package:flutter/material.dart';

/// 폴드·태블릿·와이드 화면까지 고려한 레이아웃 상수.
abstract final class ResponsiveLayout {
  static const double compact = 600;
  static const double medium = 840;
  static const double expanded = 1200;

  static double widthOf(BuildContext context) => MediaQuery.sizeOf(context).width;

  static double shortestSideOf(BuildContext context) =>
      MediaQuery.sizeOf(context).shortestSide;

  static bool isCompact(BuildContext context) => widthOf(context) < compact;

  static bool isTabletOrWider(BuildContext context) =>
      shortestSideOf(context) >= compact;

  /// 스크롤 본문·폼 등 가운데 묶을 때 상한 (폰은 사실상 화면 폭).
  static double contentMaxWidth(BuildContext context) {
    final w = widthOf(context);
    if (w < compact) return w;
    if (w < medium) return math.min(w * 0.92, 640);
    if (w < expanded) return math.min(w * 0.9, 800);
    return 960;
  }

  /// [MainTabShell]처럼 탭 전체 폭을 살짝만 제한 (태블릿에서 과도한 가로 확장 방지).
  static double shellContentMaxWidth(BuildContext context) {
    final w = widthOf(context);
    if (w < compact) return w;
    return math.min(w, 720);
  }

  /// B Mart 등 좁은 컬럼 UI.
  static double narrowColumnMaxWidth(BuildContext context) {
    final w = widthOf(context);
    if (w < compact) return w;
    return math.min(560, w * 0.82);
  }

  /// 채팅 말풍선 등.
  static double bubbleMaxWidth(BuildContext context) {
    final cap = contentMaxWidth(context);
    return math.min(420, cap * 0.92);
  }

  static double micOrbOuterSize(BuildContext context) {
    final cap = contentMaxWidth(context);
    return (cap * 0.42).clamp(160.0, 240.0);
  }

  static double micOrbInnerSize(BuildContext context) =>
      micOrbOuterSize(context) * (128 / 192);

  static double micIconSize(BuildContext context) =>
      micOrbOuterSize(context) * (56 / 192);

  /// 가로 패딩 (와이드일수록 넓게).
  static double horizontalPadding(BuildContext context) {
    final w = widthOf(context);
    if (w < compact) return 20;
    if (w < medium) return 28;
    return 40;
  }

  static EdgeInsets symmetricPagePadding(BuildContext context) {
    final h = horizontalPadding(context);
    return EdgeInsets.symmetric(horizontal: h);
  }
}

/// 상단 정렬 + 최대 너비 제한. [SingleChildScrollView] / [ListView] 안쪽에 두고 씀.
class ResponsiveConstrainedBox extends StatelessWidget {
  const ResponsiveConstrainedBox({
    super.key,
    required this.child,
    this.maxWidth,
    this.alignment = Alignment.topCenter,
  });

  final Widget child;
  final double? maxWidth;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    final m = maxWidth ?? ResponsiveLayout.contentMaxWidth(context);
    return Align(
      alignment: alignment,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: m),
        child: child,
      ),
    );
  }
}
