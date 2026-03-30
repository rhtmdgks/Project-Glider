import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../layout/responsive_layout.dart';
import '../router/app_routes.dart';
import '../stitch/stitch_assets.dart';
import '../theme/app_colors.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: ResponsiveLayout.symmetricPagePadding(context).copyWith(
            top: 48,
            bottom: 32,
          ),
          child: ResponsiveConstrainedBox(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '더 큐레이터',
                style: t.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                  letterSpacing: -1,
                  color: AppColors.onSurface,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                '더 사람다운 쇼핑을 경험해 보세요. 말로만 주문하면 디지털 컨시어지가 나머지를 처리합니다.',
                style: t.bodyLarge?.copyWith(
                  color: AppColors.onSurfaceVariant,
                  height: 1.45,
                ),
              ),
              const SizedBox(height: 32),
              _DemoCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainerLowest,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: AppColors.outlineVariant.withValues(alpha: 0.1),
                        ),
                      ),
                      child: Text(
                        '“B마트에서 애플망고 사줘”',
                        style: t.titleMedium?.copyWith(
                          fontStyle: FontStyle.italic,
                          color: AppColors.onSurface,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '음성 입력 감지됨',
                      style: t.labelSmall?.copyWith(
                        color: AppColors.onSurfaceVariant,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.primaryContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.auto_awesome, color: Colors.white),
                        const SizedBox(width: 12),
                        Text(
                          '요청을 정리하는 중…',
                          style: t.titleMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            StitchAssets.onboardingProduct,
                            width: 64,
                            height: 64,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '프리미엄 애플망고',
                                style: t.titleSmall?.copyWith(color: Colors.white),
                              ),
                              Text(
                                '₩12,800',
                                style: t.titleMedium?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              _FeatureTile(
                icon: Icons.mic,
                title: '자연스러운 음성',
                subtitle:
                    '고정된 명령어 없이, 마치 개인 쇼퍼에게 말하듯 이용하세요.',
              ),
              const SizedBox(height: 12),
              _FeatureTile(
                icon: Icons.verified_user_outlined,
                title: '안전한 결제',
                subtitle: '큐레이션된 구매는 생체 인증으로 한 번 더 확인합니다.',
              ),
              const SizedBox(height: 12),
              _FeatureTile(
                icon: Icons.auto_fix_high,
                title: '스마트 학습',
                subtitle: '취향과 식단 정보가 시간이 지날수록 더 정확해집니다.',
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  TextButton(
                    onPressed: () => context.go(AppRoutes.login),
                    child: const Text('건너뛰기'),
                  ),
                  const Spacer(),
                  FilledButton.icon(
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.primaryContainer,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 18,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                    onPressed: () => context.push(AppRoutes.permissions),
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text('시작하기'),
                  ),
                ],
              ),
            ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DemoCard extends StatelessWidget {
  const _DemoCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }
}

class _FeatureTile extends StatelessWidget {
  const _FeatureTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFE8E8E8),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.primaryContainer, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: t.titleSmall?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: t.bodySmall?.copyWith(
                    color: AppColors.onSurfaceVariant,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
