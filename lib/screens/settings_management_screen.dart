import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../layout/responsive_layout.dart';
import '../router/app_routes.dart';
import '../router/safe_navigation.dart';
import '../stitch/stitch_assets.dart';
import '../theme/app_colors.dart';

/// 설정 및 관리 — Stitch `screen_0b4101a8402f4bdb9061956465884e6c` 레이아웃
class SettingsManagementScreen extends StatelessWidget {
  const SettingsManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final t = Theme.of(context).textTheme;
    final pad = ResponsiveLayout.horizontalPadding(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        title: const Text('설정 및 관리'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => safePopOrMain(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage(StitchAssets.settingsMgmt0),
            ),
          ),
        ],
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: ResponsiveLayout.contentMaxWidth(context),
          ),
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.fromLTRB(pad, 8, pad, 24),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    _ProfileHeader(
                      avatarAsset: StitchAssets.settingsMgmt1,
                    ),
                    const SizedBox(height: 28),
                    _SectionGroup(
                      title: '계정 및 신원',
                      children: [
                        _SettingsRow(
                          icon: Icons.person_outline,
                          title: '계정 설정',
                          subtitle: '이메일, 비밀번호, 개인 정보',
                          onTap: () {},
                        ),
                        _SettingsRow(
                          icon: Icons.location_on_outlined,
                          title: '배송지 관리',
                          subtitle: '기본·추가 배송지',
                          onTap: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    _SectionGroup(
                      title: '결제 및 지갑',
                      children: [
                        _SettingsRow(
                          icon: Icons.payments_outlined,
                          title: '결제 수단',
                          subtitle: '카드·간편결제·계좌',
                          onTap: () =>
                              context.push(AppRoutes.paymentMethods),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    _SectionGroup(
                      title: '큐레이터 인터페이스',
                      children: [
                        _SettingsRow(
                          icon: Icons.settings_voice_outlined,
                          title: '음성 상호작용',
                          subtitle: '톤, 속도, 호출어',
                          onTap: () {},
                        ),
                        _SettingsRow(
                          icon: Icons.notifications_outlined,
                          title: '알림 설정',
                          subtitle: '주문·스마트 추천',
                          trailing: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primaryContainer.withValues(
                                alpha: 0.12,
                              ),
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Text(
                              '스마트 ON',
                              style: t.labelSmall?.copyWith(
                                color: AppColors.primaryContainer,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          onTap: () {},
                        ),
                        _SettingsRow(
                          icon: Icons.accessibility_new_outlined,
                          title: '접근성',
                          subtitle: '스크린 리더, 글자 크기',
                          onTap: () =>
                              context.push(AppRoutes.accessibility),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    _SectionGroup(
                      title: '신뢰 및 투명성',
                      children: [
                        _SettingsRow(
                          icon: Icons.verified_user_outlined,
                          title: '개인정보 및 보안',
                          subtitle: '암호화, 데이터, 생체 인증',
                          onTap: () {},
                        ),
                        _SettingsRow(
                          icon: Icons.help_outline,
                          title: '고객센터',
                          subtitle: 'FAQ, 문의, 채팅',
                          onTap: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    OutlinedButton.icon(
                      onPressed: () => context.go(AppRoutes.login),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: cs.error,
                        side: BorderSide(
                          color: cs.outlineVariant.withValues(alpha: 0.5),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      icon: Icon(Icons.logout, color: cs.error),
                      label: Text(
                        '계정에서 로그아웃',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: cs.error,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Text(
                        'v1.0.4 · The Curator AI',
                        style: t.labelSmall?.copyWith(
                          color: AppColors.onSurfaceVariant.withValues(
                            alpha: 0.55,
                          ),
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({required this.avatarAsset});

  final String avatarAsset;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                avatarAsset,
                width: 96,
                height: 96,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              right: -6,
              bottom: -6,
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: AppColors.primaryContainer,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.background, width: 4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.12),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Icon(Icons.edit, color: Colors.white, size: 18),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          '알렉스 큐레이터',
          style: t.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 4),
        Text(
          '2023년부터 프리미엄 회원',
          style: t.bodySmall?.copyWith(
            color: AppColors.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _SectionGroup extends StatelessWidget {
  const _SectionGroup({
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final t = Theme.of(context).textTheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: cs.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 8),
            child: Text(
              title,
              style: t.labelSmall?.copyWith(
                fontWeight: FontWeight.w800,
                letterSpacing: 2,
                color: AppColors.onSurfaceVariant.withValues(alpha: 0.75),
              ),
            ),
          ),
          for (var i = 0; i < children.length; i++) ...[
            if (i > 0) Divider(height: 1, color: cs.outlineVariant.withValues(alpha: 0.35)),
            children[i],
          ],
        ],
      ),
    );
  }
}

class _SettingsRow extends StatelessWidget {
  const _SettingsRow({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.trailing,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final t = Theme.of(context).textTheme;
    return Material(
      color: cs.surfaceContainerLowest,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: cs.surfaceContainerLow,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: AppColors.primaryContainer),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: t.titleSmall?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: t.bodySmall?.copyWith(
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              if (trailing != null) ...[
                trailing!,
                const SizedBox(width: 4),
              ],
              Icon(
                Icons.chevron_right,
                color: AppColors.onSurfaceVariant.withValues(alpha: 0.4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
