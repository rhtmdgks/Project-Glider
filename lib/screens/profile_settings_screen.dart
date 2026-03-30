import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../layout/responsive_layout.dart';
import '../router/app_routes.dart';
import '../router/safe_navigation.dart';
import '../stitch/stitch_assets.dart';
import '../theme/app_colors.dart';

/// 프로필 및 설정 — Stitch `screen_b61021e6fe494e17a46a30c8f587249a` 벤토 레이아웃
class ProfileSettingsScreen extends StatelessWidget {
  const ProfileSettingsScreen({super.key, this.inMainShell = false});

  final bool inMainShell;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final t = Theme.of(context).textTheme;
    final pad = ResponsiveLayout.horizontalPadding(context);
    final wide = ResponsiveLayout.isTabletOrWider(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        title: const Text('B Mart'),
        automaticallyImplyLeading: !inMainShell,
        leading: inMainShell
            ? null
            : IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => safePopOrMain(context),
              ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage(StitchAssets.profileSettings0),
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
          child: ListView(
            padding: EdgeInsets.fromLTRB(pad, 8, pad, 32),
            children: [
              _ProfileHero(t: t),
              const SizedBox(height: 28),
              if (wide)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 8,
                      child: _AiVoiceCard(t: t, cs: cs),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      flex: 4,
                      child: _NotificationCard(
                        t: t,
                        onManage: () =>
                            context.push(AppRoutes.settingsMgmt),
                      ),
                    ),
                  ],
                )
              else ...[
                _AiVoiceCard(t: t, cs: cs),
                const SizedBox(height: 16),
                _NotificationCard(
                  t: t,
                  onManage: () => context.push(AppRoutes.settingsMgmt),
                ),
              ],
              const SizedBox(height: 20),
              if (wide)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _DeliveryCard(t: t, cs: cs),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: _PaymentCard(
                        t: t,
                        cs: cs,
                        onAddCard: () =>
                            context.push(AppRoutes.paymentMethods),
                      ),
                    ),
                  ],
                )
              else ...[
                _DeliveryCard(t: t, cs: cs),
                const SizedBox(height: 16),
                _PaymentCard(
                  t: t,
                  cs: cs,
                  onAddCard: () => context.push(AppRoutes.paymentMethods),
                ),
              ],
              const SizedBox(height: 20),
              _SecuritySection(t: t, cs: cs),
              const SizedBox(height: 16),
              _QuickLinks(),
              const SizedBox(height: 24),
              Center(
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: cs.errorContainer,
                    foregroundColor: cs.onErrorContainer,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 36,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                  onPressed: () => context.go(AppRoutes.login),
                  child: Text(
                    '모든 기기에서 로그아웃',
                    style: t.labelLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileHero extends StatelessWidget {
  const _ProfileHero({required this.t});

  final TextTheme t;

  @override
  Widget build(BuildContext context) {
    final wide = ResponsiveLayout.isTabletOrWider(context);
    final avatar = Stack(
      clipBehavior: Clip.none,
      children: [
        ClipOval(
          child: Image.asset(
            StitchAssets.profileSettings0,
            width: wide ? 140 : 112,
            height: wide ? 140 : 112,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          right: 4,
          bottom: 4,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: AppColors.primaryContainer,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color(0x22000000),
                  blurRadius: 12,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(Icons.edit, color: Colors.white, size: 18),
          ),
        ),
      ],
    );
    final textBlock = Column(
      crossAxisAlignment:
          wide ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Text(
          '엘레나 리처드슨',
          textAlign: wide ? TextAlign.start : TextAlign.center,
          style: t.headlineMedium?.copyWith(fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 6),
        Text(
          '2022년부터 프리미엄 회원 · 미국 샌프란시스코',
          textAlign: wide ? TextAlign.start : TextAlign.center,
          style: t.bodyLarge?.copyWith(
            color: AppColors.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          alignment: wide ? WrapAlignment.start : WrapAlignment.center,
          spacing: 8,
          runSpacing: 8,
          children: const [
            _Badge(
              label: '플래티넘 등급',
              filled: true,
            ),
            _Badge(
              label: 'AI 얼리 액세스',
              filled: false,
            ),
          ],
        ),
      ],
    );
    if (wide) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          avatar,
          const SizedBox(width: 20),
          Expanded(child: textBlock),
        ],
      );
    }
    return Column(
      children: [
        avatar,
        const SizedBox(height: 20),
        textBlock,
      ],
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.label, required this.filled});

  final String label;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: filled
            ? AppColors.primaryContainer
            : AppColors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: t.labelSmall?.copyWith(
          color: filled ? Colors.white : AppColors.onSurface,
          fontWeight: FontWeight.w800,
          letterSpacing: 1,
        ),
      ),
    );
  }
}

class _AiVoiceCard extends StatelessWidget {
  const _AiVoiceCard({required this.t, required this.cs});

  final TextTheme t;
  final ColorScheme cs;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.mic_none, color: AppColors.primaryContainer, size: 28),
              const SizedBox(width: 10),
              Text(
                'AI 어시스턴트 음성',
                style: t.titleLarge?.copyWith(fontWeight: FontWeight.w800),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            '디지털 큐레이터 목소리를 맞춤 설정하세요. 모든 대화에 「평온함」이 적용되어 있습니다.',
            style: t.bodyMedium?.copyWith(
              color: AppColors.onSurfaceVariant,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _VoiceChip(
                label: '평온함 (기본)',
                selected: true,
                icon: Icons.check_circle,
              ),
              _VoiceChip(
                label: '활기참',
                selected: false,
                icon: Icons.play_circle_outline,
              ),
              _VoiceChip(
                label: '격식있음',
                selected: false,
                icon: Icons.play_circle_outline,
              ),
            ],
          ),
          const SizedBox(height: 24),
          Divider(color: cs.outlineVariant.withValues(alpha: 0.35)),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '연속 듣기 모드',
                style: t.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              Switch(
                value: true,
                onChanged: (_) {},
                activeThumbColor: Colors.white,
                activeTrackColor: AppColors.primaryContainer,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _VoiceChip extends StatelessWidget {
  const _VoiceChip({
    required this.label,
    required this.selected,
    required this.icon,
  });

  final String label;
  final bool selected;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;
    return Material(
      color: selected ? AppColors.onSurface : cs.surfaceContainerHighest,
      borderRadius: BorderRadius.circular(999),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(999),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 20,
                color: selected ? Colors.white : AppColors.onSurface,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: t.labelLarge?.copyWith(
                  color: selected ? Colors.white : AppColors.onSurface,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NotificationCard extends StatelessWidget {
  const _NotificationCard({
    required this.t,
    required this.onManage,
  });

  final TextTheme t;
  final VoidCallback onManage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.primaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.notifications_active,
            color: Colors.white,
            size: 36,
          ),
          const SizedBox(height: 12),
          Text(
            '실시간 알림',
            style: t.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '저장한 큐레이션의 가격이 떨어지면 AI가 즉시 알려드립니다.',
            style: t.bodySmall?.copyWith(
              color: const Color(0xFFB1C5FF),
              height: 1.45,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppColors.primaryContainer,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
              onPressed: onManage,
              child: Text(
                '전체 설정 관리',
                style: t.labelLarge?.copyWith(fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DeliveryCard extends StatelessWidget {
  const _DeliveryCard({required this.t, required this.cs});

  final TextTheme t;
  final ColorScheme cs;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.outlineVariant.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '배송지 주소',
                    style: t.titleLarge?.copyWith(fontWeight: FontWeight.w800),
                  ),
                  Text(
                    '기본 배송지 설정',
                    style: t.bodySmall?.copyWith(
                      color: AppColors.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              Icon(Icons.location_on_outlined, color: AppColors.onSurfaceVariant),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: cs.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('우리집', style: t.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
                const SizedBox(height: 6),
                Text(
                  '2450 Taylor Street, Penthouse 4\nSan Francisco, CA 94133',
                  style: t.bodyMedium?.copyWith(
                    color: AppColors.onSurfaceVariant,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: AppColors.primaryContainer,
              textStyle: t.labelLarge?.copyWith(fontWeight: FontWeight.w800),
            ),
            child: const Text('주소 변경'),
          ),
        ],
      ),
    );
  }
}

class _PaymentCard extends StatelessWidget {
  const _PaymentCard({
    required this.t,
    required this.cs,
    required this.onAddCard,
  });

  final TextTheme t;
  final ColorScheme cs;
  final VoidCallback onAddCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.outlineVariant.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '결제 수단',
                    style: t.titleLarge?.copyWith(fontWeight: FontWeight.w800),
                  ),
                  Text(
                    '원클릭 AI 결제 활성화됨',
                    style: t.bodySmall?.copyWith(
                      color: AppColors.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              Icon(Icons.payments_outlined, color: AppColors.onSurfaceVariant),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: AppColors.onSurface,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 44,
                      height: 30,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'VISA',
                        style: t.labelSmall?.copyWith(
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '•••• 8829',
                          style: t.titleMedium?.copyWith(
                            color: cs.surface,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          '만료일 12/26',
                          style: t.bodySmall?.copyWith(
                            color: AppColors.surfaceContainerHighest,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(Icons.verified, color: AppColors.surfaceContainerHighest),
              ],
            ),
          ),
          const SizedBox(height: 12),
          TextButton(
            onPressed: onAddCard,
            style: TextButton.styleFrom(
              foregroundColor: AppColors.primaryContainer,
              textStyle: t.labelLarge?.copyWith(fontWeight: FontWeight.w800),
            ),
            child: const Text('새 카드 추가'),
          ),
        ],
      ),
    );
  }
}

class _SecuritySection extends StatelessWidget {
  const _SecuritySection({required this.t, required this.cs});

  final TextTheme t;
  final ColorScheme cs;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '보안 및 컨시어지 액세스',
            style: t.titleLarge?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 16),
          _toggleRow(
            context,
            icon: Icons.face_outlined,
            label: '결제 시 Face ID 사용',
            value: false,
            onChanged: (_) {},
          ),
          const SizedBox(height: 10),
          _toggleRow(
            context,
            icon: Icons.history,
            label: '대화 기록 자동 삭제',
            value: true,
            onChanged: (_) {},
          ),
        ],
      ),
    );
  }

  Widget _toggleRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.onSurfaceVariant),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: Colors.white,
            activeTrackColor: AppColors.primaryContainer,
          ),
        ],
      ),
    );
  }
}

class _QuickLinks extends StatelessWidget {
  const _QuickLinks();

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '바로가기',
          style: t.titleSmall?.copyWith(
            color: AppColors.onSurfaceVariant,
            fontWeight: FontWeight.w800,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 12),
        _linkTile(
          context,
          icon: Icons.settings_outlined,
          title: '설정 및 관리',
          onTap: () => context.push(AppRoutes.settingsMgmt),
        ),
        _linkTile(
          context,
          icon: Icons.credit_card_outlined,
          title: '결제 수단 관리',
          onTap: () => context.push(AppRoutes.paymentMethods),
        ),
        _linkTile(
          context,
          icon: Icons.accessibility_new_outlined,
          title: '접근성 설정',
          onTap: () => context.push(AppRoutes.accessibility),
        ),
        _linkTile(
          context,
          icon: Icons.history,
          title: 'AI 대화 기록',
          onTap: () => context.push(AppRoutes.aiHistory),
        ),
        _linkTile(
          context,
          icon: Icons.local_shipping_outlined,
          title: '배송 조회',
          onTap: () => context.push(AppRoutes.delivery),
        ),
        _linkTile(
          context,
          icon: Icons.celebration_outlined,
          title: '프로필 설정 완료 (데모)',
          onTap: () => context.push(AppRoutes.profileSetupComplete),
        ),
      ],
    );
  }

  Widget _linkTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: AppColors.primaryContainer),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
