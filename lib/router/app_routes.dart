/// Named paths for [GoRouter] (kebab-case).
abstract final class AppRoutes {
  static const String debugScreens = '/debug/screens';

  /// 온보딩 플로우 (전체 화면)
  static const String onboarding = '/onboarding';
  static const String permissions = '/permissions';
  static const String login = '/login';

  /// 메인 탭 ([StatefulShellRoute] — 하단 네비 공유)
  static const String mainHome = '/main/home';
  static const String mainShop = '/main/shop';
  static const String mainOrders = '/main/orders';
  static const String mainProfile = '/main/profile';

  /// 풀스크린(탭 위에 표시)
  static const String checkout = '/checkout';
  static const String orderDetail = '/order-detail';
  static const String accessibility = '/accessibility';
  static const String paymentComplete = '/payment-complete';
  static const String aiHistory = '/ai-history';
  static const String delivery = '/delivery';
  static const String settingsMgmt = '/settings-management';
  static const String profileSetupComplete = '/profile-setup-complete';
  static const String paymentMethods = '/payment-methods';
}
