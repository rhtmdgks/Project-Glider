import 'package:flutter/material.dart';

import '../layout/responsive_layout.dart';
import '../router/safe_navigation.dart';
import '../stitch/stitch_assets.dart';
import '../theme/app_colors.dart';

/// 주문 상세 정보
class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text('주문 상세'),
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  StitchAssets.orderDetail0,
                  width: 100,
                  height: 100,
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
                      style: t.titleMedium?.copyWith(fontWeight: FontWeight.w800),
                    ),
                    Text(
                      '주문번호 20250310-001',
                      style: t.bodySmall?.copyWith(color: AppColors.onSurfaceVariant),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(StitchAssets.orderDetail1, height: 140, fit: BoxFit.cover),
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(StitchAssets.orderDetail2, height: 140, fit: BoxFit.cover),
          ),
          const SizedBox(height: 24),
          _kv('결제 금액', '30,900원', t),
          _kv('결제 수단', '현대카드 (**** 1234)', t),
          _kv('배송지', '서울 강남구 …', t),
        ],
          ),
        ),
      ),
    );
  }

  Widget _kv(String k, String v, TextTheme t) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              k,
              style: t.bodyMedium?.copyWith(color: AppColors.onSurfaceVariant),
            ),
          ),
          Expanded(child: Text(v, style: t.bodyMedium)),
        ],
      ),
    );
  }
}
