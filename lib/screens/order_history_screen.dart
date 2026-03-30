import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../layout/responsive_layout.dart';
import '../router/app_routes.dart';
import '../router/safe_navigation.dart';
import '../stitch/stitch_assets.dart';
import '../theme/app_colors.dart';

/// 구매 내역
class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key, this.inMainShell = false});

  final bool inMainShell;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final imgs = [
      StitchAssets.orderHistory0,
      StitchAssets.orderHistory1,
      StitchAssets.orderHistory2,
      StitchAssets.orderHistory3,
      StitchAssets.orderHistory4,
    ];
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text('구매 내역'),
        automaticallyImplyLeading: !inMainShell,
        leading: inMainShell
            ? null
            : IconButton(
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
          child: ListView.separated(
              padding: EdgeInsets.all(
                ResponsiveLayout.horizontalPadding(context),
              ),
              itemCount: 5,
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 12),
              itemBuilder: (context, i) {
                return Material(
                  color: AppColors.surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(16),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () => context.push(AppRoutes.orderDetail),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              imgs[i],
                              width: 72,
                              height: 72,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '주문 #202503${10 + i}',
                                  style: t.titleSmall?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  '3월 ${10 + i}일 · 결제완료',
                                  style: t.bodySmall?.copyWith(
                                    color: AppColors.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.chevron_right),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
    );
  }
}
