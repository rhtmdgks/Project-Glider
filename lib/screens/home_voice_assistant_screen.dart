import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../layout/responsive_layout.dart';
import '../router/app_routes.dart';
import '../stitch/stitch_assets.dart';
import '../theme/app_colors.dart';

/// 홈 / 음성 어시스턴트 탭.
class HomeVoiceAssistantScreen extends StatelessWidget {
  const HomeVoiceAssistantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final hPad = ResponsiveLayout.horizontalPadding(context);
    final bubbleW = ResponsiveLayout.bubbleMaxWidth(context);
    final orb = ResponsiveLayout.micOrbOuterSize(context);
    final orbIn = ResponsiveLayout.micOrbInnerSize(context);
    final micIcon = ResponsiveLayout.micIconSize(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(hPad, 12, hPad, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.menu),
                        color: AppColors.primaryContainer,
                      ),
                      Image.asset(StitchAssets.homeLogo, height: 32),
                    ],
                  ),
                  ClipOval(
                    child: Image.asset(
                      StitchAssets.homeProfile,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(hPad, 8, hPad, 24),
                child: ResponsiveConstrainedBox(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          constraints: BoxConstraints(maxWidth: bubbleW),
                          decoration: const BoxDecoration(
                            color: Color(0xFFF3F3F3),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                              bottomLeft: Radius.circular(16),
                            ),
                          ),
                          child: Text(
                            '"B마트에서 저번에 구매했던 애플망고 사줘."',
                            style: t.titleMedium,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: const EdgeInsets.all(18),
                          constraints: BoxConstraints(maxWidth: bubbleW),
                          decoration: BoxDecoration(
                            color: AppColors.surfaceContainerLowest,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                            ),
                            border: Border.all(
                              color: AppColors.outlineVariant
                                  .withValues(alpha: 0.1),
                            ),
                          ),
                          child: Text.rich(
                            TextSpan(
                              style: t.titleMedium?.copyWith(
                                color: AppColors.onSurfaceVariant,
                                height: 1.4,
                              ),
                              children: const [
                                TextSpan(
                                  text: '네, B마트에서 지난 3월 10일에 구매했던 ',
                                ),
                                TextSpan(
                                  text: '애플망고',
                                  style: TextStyle(
                                    color: AppColors.primaryContainer,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(
                                  text: '를 확인했어요. 동일한 상품으로 주문을 진행할까요?',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 36),
                      Container(
                        width: orb,
                        height: orb,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryContainer,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primaryContainer
                                  .withValues(alpha: 0.2),
                              blurRadius: 80,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Container(
                            width: orbIn,
                            height: orbIn,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0x33FFFFFF),
                            ),
                            child: Icon(
                              Icons.mic,
                              color: Colors.white,
                              size: micIcon,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '애플망고 검색 완료',
                        style: t.titleSmall?.copyWith(
                          color: AppColors.primaryContainer,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Material(
                        color: AppColors.surfaceContainerLowest,
                        borderRadius: BorderRadius.circular(16),
                        child: InkWell(
                          onTap: () => context.push(AppRoutes.checkout),
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: AppColors.outlineVariant
                                    .withValues(alpha: 0.1),
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x0A000000),
                                  blurRadius: 20,
                                  offset: Offset(0, 12),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    StitchAssets.homeMango,
                                    width: (bubbleW * 0.28).clamp(72.0, 112.0),
                                    height:
                                        (bubbleW * 0.28).clamp(72.0, 112.0),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              '프리미엄 애플망고 2입',
                                              style: t.titleMedium?.copyWith(
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 4,
                                            ),
                                            decoration: BoxDecoration(
                                              color: AppColors.primaryContainer
                                                  .withValues(alpha: 0.1),
                                              borderRadius:
                                                  BorderRadius.circular(999),
                                            ),
                                            child: Text(
                                              '활성 상태',
                                              style: t.labelSmall?.copyWith(
                                                color:
                                                    AppColors.primaryContainer,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        '32,900원 • 1개 수량',
                                        style: t.bodySmall?.copyWith(
                                          color: AppColors.onSurfaceVariant,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      Row(
                                        children: [
                                          Container(
                                            width: 8,
                                            height: 8,
                                            decoration: const BoxDecoration(
                                              color: AppColors.primaryContainer,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            '결제 진행 중',
                                            style: t.titleSmall?.copyWith(
                                              color: AppColors.primaryContainer,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
