import 'package:flutter/material.dart';

import '../layout/responsive_layout.dart';
import '../router/safe_navigation.dart';
import '../stitch/stitch_assets.dart';
import '../theme/app_colors.dart';

/// AI 대화 기록
class AiChatHistoryScreen extends StatelessWidget {
  const AiChatHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final thumbs = [
      StitchAssets.aiHistory0,
      StitchAssets.aiHistory1,
      StitchAssets.aiHistory2,
      StitchAssets.aiHistory3,
    ];
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text('AI 대화 기록'),
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
          child: ListView.builder(
        padding: EdgeInsets.all(ResponsiveLayout.horizontalPadding(context)),
        itemCount: 8,
        itemBuilder: (context, i) {
          final thumb = thumbs[i % thumbs.length];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(thumb, width: 48, height: 48, fit: BoxFit.cover),
              ),
              title: Text(
                '애플망고 재주문 요청',
                style: t.titleSmall?.copyWith(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                '3월 ${i + 1}일 · B마트',
                style: t.bodySmall?.copyWith(color: AppColors.onSurfaceVariant),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
          );
        },
          ),
        ),
      ),
    );
  }
}
