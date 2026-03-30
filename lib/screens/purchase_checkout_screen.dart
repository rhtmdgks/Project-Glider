import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../layout/responsive_layout.dart';
import '../router/app_routes.dart';
import '../router/safe_navigation.dart';
import '../stitch/stitch_assets.dart';
import '../theme/app_colors.dart';

/// 구매 확인 및 결제
class PurchaseCheckoutScreen extends StatelessWidget {
  const PurchaseCheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.onSurface,
        elevation: 0,
        title: const Text('주문 확인'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => safePopOrMain(context),
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: ResponsiveLayout.contentMaxWidth(context),
          ),
          child: ListView(
        padding: EdgeInsets.all(ResponsiveLayout.horizontalPadding(context)),
        children: [
          Text(
            '배송지 · 결제 요약',
            style: t.titleLarge?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  StitchAssets.checkout0,
                  width: 96,
                  height: 96,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '애플망고 2입',
                      style: t.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'B마트 강남점',
                      style: t.bodySmall?.copyWith(color: AppColors.onSurfaceVariant),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(height: 40),
          _RowKV('상품 금액', '32,900원', t),
          _RowKV('배송비', '0원', t),
          _RowKV('할인', '-2,000원', t),
          const SizedBox(height: 12),
          _RowKV('결제 예정 금액', '30,900원', t, emphasize: true),
          const SizedBox(height: 24),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              StitchAssets.checkout1,
              fit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              StitchAssets.checkout2,
              fit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(height: 32),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.primaryContainer,
              minimumSize: const Size(double.infinity, 56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: () => context.push(AppRoutes.paymentComplete),
            child: const Text('30,900원 결제하기'),
          ),
        ],
          ),
        ),
      ),
    );
  }
}

class _RowKV extends StatelessWidget {
  const _RowKV(this.k, this.v, this.t, {this.emphasize = false});

  final String k;
  final String v;
  final TextTheme t;
  final bool emphasize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            k,
            style: t.bodyMedium?.copyWith(
              color: AppColors.onSurfaceVariant,
              fontWeight: emphasize ? FontWeight.w700 : null,
            ),
          ),
          Text(
            v,
            style: t.titleMedium?.copyWith(
              fontWeight: emphasize ? FontWeight.w900 : FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
