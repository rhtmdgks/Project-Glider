import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../layout/responsive_layout.dart';
import '../router/app_routes.dart';
import '../stitch/stitch_assets.dart';
import '../theme/app_colors.dart';

class WelcomeLoginScreen extends StatelessWidget {
  const WelcomeLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: ResponsiveLayout.symmetricPagePadding(context).copyWith(
            top: 24,
            bottom: 24,
          ),
          child: ResponsiveConstrainedBox(
            child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AspectRatio(
                  aspectRatio: 4 / 5,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        StitchAssets.loginHero,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        left: 16,
                        right: 16,
                        bottom: 16,
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: AppColors.surfaceContainerLowest
                                .withValues(alpha: 0.85),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color:
                                  AppColors.outlineVariant.withValues(alpha: 0.15),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '더 큐레이터',
                                style: t.headlineSmall?.copyWith(
                                  color: AppColors.primaryContainer,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '말만 하면 장바구니까지, 당신만의 AI 구매 컨시어지입니다.',
                                style: t.bodyMedium?.copyWith(
                                  color: AppColors.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                '다시 오신 것을 환영합니다',
                style: t.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              Text(
                '계속하려면 원하는 방법을 선택하세요',
                style: t.bodyMedium?.copyWith(color: AppColors.onSurfaceVariant),
              ),
              const SizedBox(height: 24),
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.primaryContainer,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
                onPressed: () => context.go(AppRoutes.mainHome),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.smartphone),
                    const SizedBox(width: 12),
                    Text('휴대전화로 계속하기', style: t.titleMedium),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _SmallAuth(
                      icon: Icons.mail_outline,
                      label: '이메일',
                      onTap: () => context.go(AppRoutes.mainHome),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _SmallAuth(
                      icon: Icons.account_circle_outlined,
                      label: '소셜',
                      onTap: () => context.go(AppRoutes.mainHome),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: AppColors.primaryContainer.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.auto_awesome,
                      color: AppColors.primaryContainer,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        style: t.bodySmall?.copyWith(
                          color: AppColors.onSurfaceVariant,
                          height: 1.5,
                        ),
                        children: [
                          const TextSpan(text: '계속하면 '),
                          TextSpan(
                            text: '이용약관',
                            style: TextStyle(
                              color: AppColors.primaryContainer,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const TextSpan(text: ' 및 '),
                          TextSpan(
                            text: '개인정보 처리방침',
                            style: TextStyle(
                              color: AppColors.primaryContainer,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const TextSpan(text: '에 동의하는 것으로 간주됩니다.'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => context.push(AppRoutes.onboarding),
                child: const Text('처음 시작하기 · 온보딩'),
              ),
              if (kDebugMode)
                TextButton(
                  onPressed: () => context.push(AppRoutes.debugScreens),
                  child: Text(
                    '화면 목록 (개발)',
                    style: t.labelSmall?.copyWith(
                      color: AppColors.onSurfaceVariant,
                    ),
                  ),
                ),
            ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SmallAuth extends StatelessWidget {
  const _SmallAuth({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFF3F3F3),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          height: 112,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 36, color: AppColors.onSurfaceVariant),
              const SizedBox(height: 8),
              Text(
                label,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
