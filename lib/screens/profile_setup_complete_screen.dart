import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../layout/responsive_layout.dart';
import '../router/app_routes.dart';
import '../theme/app_colors.dart';

/// 프로필 설정 완료
class ProfileSetupCompleteScreen extends StatelessWidget {
  const ProfileSetupCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: ResponsiveConstrainedBox(
            child: Padding(
              padding: ResponsiveLayout.symmetricPagePadding(context).copyWith(
                top: 24,
                bottom: 24,
              ),
              child: Column(
            children: [
              const Spacer(),
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: AppColors.primaryContainer.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.verified,
                  size: 64,
                  color: AppColors.primaryContainer,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                '프로필 설정이 완료되었습니다',
                style: t.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                '맞춤 추천과 배송 안내를 위해 정보를 안전하게 보관합니다.',
                style: t.bodyLarge?.copyWith(color: AppColors.onSurfaceVariant),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.primaryContainer,
                  minimumSize: const Size(double.infinity, 52),
                ),
                onPressed: () => context.go(AppRoutes.mainHome),
                child: const Text('시작하기'),
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
