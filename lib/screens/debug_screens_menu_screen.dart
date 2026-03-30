import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../layout/responsive_layout.dart';
import '../router/app_routes.dart';

/// 개발용: 모든 화면으로 이동 (배포 전 제거하거나 kDebugMode만 사용).
class DebugScreensMenuScreen extends StatelessWidget {
  const DebugScreensMenuScreen({super.key});

  static const _routes = <({String path, String label})>[
    (path: AppRoutes.onboarding, label: '온보딩'),
    (path: AppRoutes.permissions, label: '권한 (마이크·알림)'),
    (path: AppRoutes.login, label: '환영 / 로그인'),
    (path: AppRoutes.mainHome, label: '탭: 홈 · 음성 어시스턴트'),
    (path: AppRoutes.mainShop, label: '탭: 쇼핑 (B Mart)'),
    (path: AppRoutes.mainOrders, label: '탭: 구매 내역'),
    (path: AppRoutes.mainProfile, label: '탭: 프로필'),
    (path: AppRoutes.checkout, label: '구매 확인 및 결제'),
    (path: AppRoutes.orderDetail, label: '주문 상세'),
    (path: AppRoutes.accessibility, label: '접근성 설정'),
    (path: AppRoutes.paymentComplete, label: '결제 완료'),
    (path: AppRoutes.aiHistory, label: 'AI 대화 기록'),
    (path: AppRoutes.delivery, label: '배송 조회'),
    (path: AppRoutes.settingsMgmt, label: '설정 및 관리'),
    (path: AppRoutes.profileSetupComplete, label: '프로필 설정 완료'),
    (path: AppRoutes.paymentMethods, label: '결제 수단 관리'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('화면 목록 (디버그)'),
      ),
      body: kDebugMode
          ? Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: ResponsiveLayout.contentMaxWidth(context),
                ),
                child: ListView.separated(
                  itemCount: _routes.length + 1,
                  separatorBuilder: (context, index) =>
                      const Divider(height: 1),
                  itemBuilder: (context, i) {
                    if (i == 0) {
                      return const ListTile(
                        title: Text(
                          '로그인 후 메인은 ${AppRoutes.mainHome} (StatefulShellRoute 탭).',
                          style: TextStyle(fontSize: 12),
                        ),
                      );
                    }
                    final r = _routes[i - 1];
                    return ListTile(
                      title: Text(r.label),
                      subtitle: Text(r.path),
                      onTap: () => context.push(r.path),
                    );
                  },
                ),
              ),
            )
          : const Center(
              child: Text('릴리스 빌드에서는 사용할 수 없습니다.'),
            ),
    );
  }
}
