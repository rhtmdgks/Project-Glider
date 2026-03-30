import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/accessibility_settings_screen.dart';
import '../screens/ai_chat_history_screen.dart';
import '../screens/b_mart_purchase_screen.dart';
import '../screens/debug_screens_menu_screen.dart';
import '../screens/delivery_tracking_screen.dart';
import '../screens/home_voice_assistant_screen.dart';
import '../screens/onboarding_screen.dart';
import '../screens/order_detail_screen.dart';
import '../screens/order_history_screen.dart';
import '../screens/payment_complete_screen.dart';
import '../screens/payment_methods_screen.dart';
import '../screens/permissions_mic_notification_screen.dart';
import '../screens/profile_setup_complete_screen.dart';
import '../screens/profile_settings_screen.dart';
import '../screens/purchase_checkout_screen.dart';
import '../screens/settings_management_screen.dart';
import '../screens/welcome_login_screen.dart';
import '../widgets/main_tab_shell.dart';
import 'app_routes.dart';

/// 루트 네비게이터 — 탭 바 위에 결제·상세 등 풀스크린을 올릴 때 사용.
final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

/// 앱 시작: 로그인. 온보딩·권한은 로그인에서 이동하거나 온보딩 플로우로 진입.
final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: AppRoutes.login,
  redirect: (context, state) {
    final p = state.uri.path;
    if (p == '/home') return AppRoutes.mainHome;
    if (p == '/orders') return AppRoutes.mainOrders;
    if (p == '/profile') return AppRoutes.mainProfile;
    if (p == '/b-mart-purchase') return AppRoutes.mainShop;
    return null;
  },
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('경로를 찾을 수 없습니다: ${state.uri}'),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => context.go(AppRoutes.mainHome),
              child: const Text('홈으로'),
            ),
          ],
        ),
      ),
    ),
  ),
  routes: <RouteBase>[
    GoRoute(
      path: AppRoutes.debugScreens,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) => const DebugScreensMenuScreen(),
    ),
    GoRoute(
      path: AppRoutes.onboarding,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: AppRoutes.permissions,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) => const PermissionsMicNotificationScreen(),
    ),
    GoRoute(
      path: AppRoutes.login,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) => const WelcomeLoginScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainTabShell(navigationShell: navigationShell);
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: AppRoutes.mainShop,
              builder: (context, state) =>
                  const BMartPurchaseScreen(embedInMainShell: true),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: AppRoutes.mainHome,
              builder: (context, state) => const HomeVoiceAssistantScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: AppRoutes.mainOrders,
              builder: (context, state) =>
                  const OrderHistoryScreen(inMainShell: true),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: AppRoutes.mainProfile,
              builder: (context, state) =>
                  const ProfileSettingsScreen(inMainShell: true),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: AppRoutes.checkout,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) => const PurchaseCheckoutScreen(),
    ),
    GoRoute(
      path: AppRoutes.orderDetail,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) => const OrderDetailScreen(),
    ),
    GoRoute(
      path: AppRoutes.accessibility,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) => const AccessibilitySettingsScreen(),
    ),
    GoRoute(
      path: AppRoutes.paymentComplete,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) => const PaymentCompleteScreen(),
    ),
    GoRoute(
      path: AppRoutes.aiHistory,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) => const AiChatHistoryScreen(),
    ),
    GoRoute(
      path: AppRoutes.delivery,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) => const DeliveryTrackingScreen(),
    ),
    GoRoute(
      path: AppRoutes.settingsMgmt,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) => const SettingsManagementScreen(),
    ),
    GoRoute(
      path: AppRoutes.profileSetupComplete,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) => const ProfileSetupCompleteScreen(),
    ),
    GoRoute(
      path: AppRoutes.paymentMethods,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) => const PaymentMethodsScreen(),
    ),
  ],
);
