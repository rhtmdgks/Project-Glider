import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../layout/responsive_layout.dart';
import '../router/app_routes.dart';
import '../stitch/stitch_assets.dart';
import '../theme/app_colors.dart';

/// 결제 완료
class PaymentCompleteScreen extends StatelessWidget {
  const PaymentCompleteScreen({super.key});

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
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  StitchAssets.paymentComplete0,
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 24),
              Icon(
                Icons.check_circle,
                size: 72,
                color: AppColors.primaryContainer,
              ),
              const SizedBox(height: 16),
              Text(
                '결제가 완료되었습니다',
                style: t.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                '주문 내역에서 배송 상태를 확인하세요.',
                style: t.bodyLarge?.copyWith(color: AppColors.onSurfaceVariant),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  StitchAssets.paymentComplete1,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const Spacer(),
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.primaryContainer,
                  minimumSize: const Size(double.infinity, 52),
                ),
                onPressed: () => context.go(AppRoutes.mainOrders),
                child: const Text('주문 내역 보기'),
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: () => context.go(AppRoutes.mainHome),
                child: const Text('홈으로'),
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
