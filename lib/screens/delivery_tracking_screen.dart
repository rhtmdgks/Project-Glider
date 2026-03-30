import 'package:flutter/material.dart';

import '../layout/responsive_layout.dart';
import '../router/safe_navigation.dart';
import '../stitch/stitch_assets.dart';
import '../theme/app_colors.dart';

/// 배송 조회
class DeliveryTrackingScreen extends StatelessWidget {
  const DeliveryTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text('배송 조회'),
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
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              StitchAssets.delivery0,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    StitchAssets.delivery1,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    StitchAssets.delivery2,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              StitchAssets.delivery3,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            '배송 진행',
            style: t.titleMedium?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 16),
          const _StepTile(
            title: '주문 접수',
            subtitle: '오늘 14:32',
            done: true,
          ),
          const _StepTile(
            title: '상품 준비',
            subtitle: '오늘 15:10',
            done: true,
          ),
          const _StepTile(
            title: '배송 출발',
            subtitle: '예정 · 오후 6시 전',
            done: false,
          ),
        ],
          ),
        ),
      ),
    );
  }
}

class _StepTile extends StatelessWidget {
  const _StepTile({
    required this.title,
    required this.subtitle,
    required this.done,
  });

  final String title;
  final String subtitle;
  final bool done;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            done ? Icons.check_circle : Icons.radio_button_unchecked,
            color: done ? AppColors.primaryContainer : AppColors.outlineVariant,
          ),
          const SizedBox(width: 12),
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
