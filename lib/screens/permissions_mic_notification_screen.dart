import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../layout/responsive_layout.dart';
import '../router/app_routes.dart';
import '../stitch/stitch_assets.dart';
import '../theme/app_colors.dart';

/// 권한 설정: 마이크 및 알림
class PermissionsMicNotificationScreen extends StatelessWidget {
  const PermissionsMicNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: ResponsiveConstrainedBox(
            child: Padding(
              padding: ResponsiveLayout.symmetricPagePadding(context).copyWith(
                top: 24,
                bottom: 24,
              ),
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  StitchAssets.permissionsHero,
                  height: 220,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                '더 나은 음성 쇼핑을 위해',
                style: t.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 8),
              Text(
                '마이크로 명령을 듣고, 알림으로 배송을 안내해 드려요.',
                style: t.bodyLarge?.copyWith(color: AppColors.onSurfaceVariant),
              ),
              const SizedBox(height: 32),
              _PermCard(
                icon: Icons.mic,
                title: '마이크',
                subtitle: '음성 주문 인식에 사용됩니다.',
              ),
              const SizedBox(height: 12),
              _PermCard(
                icon: Icons.notifications_outlined,
                title: '알림',
                subtitle: '배송·프로모션 알림을 보냅니다.',
              ),
              const Spacer(),
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.primaryContainer,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () => context.push(AppRoutes.login),
                child: const Text('허용하고 계속'),
              ),
              TextButton(
                onPressed: () => context.push(AppRoutes.login),
                child: const Text('나중에'),
              ),
            ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PermCard extends StatelessWidget {
  const _PermCard({
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
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.outlineVariant.withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.primaryContainer.withValues(alpha: 0.12),
            child: Icon(icon, color: AppColors.primaryContainer),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: t.titleSmall?.copyWith(fontWeight: FontWeight.w700)),
                Text(
                  subtitle,
                  style: t.bodySmall?.copyWith(color: AppColors.onSurfaceVariant),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
