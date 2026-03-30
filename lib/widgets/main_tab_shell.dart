import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_colors.dart';
import 'korean_main_bottom_nav.dart';

/// [StatefulShellRoute]용: 본문 + 하단 탭.
///
/// **바깥에 [Scaffold]를 쓰지 않습니다.** 각 탭 화면이 이미 [Scaffold]인데 셸까지 Scaffold면
/// 중첩되어 iOS 등에서 AppBar/본문 높이 배분이 깨져 본문이 안 보일 수 있습니다.
/// 대신 [Column] + [Expanded]로 Navigator 영역에 남은 세로 공간을 모두 넘깁니다.
class MainTabShell extends StatelessWidget {
  const MainTabShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: navigationShell),
          KoreanMainBottomNav(navigationShell: navigationShell),
        ],
      ),
    );
  }
}
