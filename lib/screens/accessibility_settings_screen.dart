import 'package:flutter/material.dart';

import '../layout/responsive_layout.dart';
import '../router/safe_navigation.dart';
import '../stitch/stitch_assets.dart';
import '../theme/app_colors.dart';

/// 접근성 설정 — Stitch `screen_40ac569ddb67498bae00ec4e40623755` 벤토 레이아웃
class AccessibilitySettingsScreen extends StatefulWidget {
  const AccessibilitySettingsScreen({super.key});

  @override
  State<AccessibilitySettingsScreen> createState() =>
      _AccessibilitySettingsScreenState();
}

class _AccessibilitySettingsScreenState
    extends State<AccessibilitySettingsScreen> {
  double _voiceSpeed = 0.5;
  bool _largeText = true;
  bool _highContrast = false;
  bool _reducedMotion = false;
  bool _haptic = true;

  String get _speedLabel {
    if (_voiceSpeed < 0.33) return '0.8x';
    if (_voiceSpeed > 0.66) return '1.2x';
    return '1.0x';
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final pad = ResponsiveLayout.horizontalPadding(context);
    final wide = ResponsiveLayout.isTabletOrWider(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        title: const Text('접근성'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => safePopOrMain(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage(StitchAssets.accessibility0),
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
              Text(
                '경험을 맞춤 설정하세요',
                style: t.headlineMedium?.copyWith(fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 8),
              Text(
                '큐레이터가 어떻게 안내할지 조정해 편안하고 접근하기 쉬운 여정을 만드세요.',
                style: t.bodyLarge?.copyWith(
                  color: AppColors.onSurfaceVariant,
                  height: 1.45,
                ),
              ),
              const SizedBox(height: 24),
              _VoiceSpeedCard(
                speedLabel: _speedLabel,
                value: _voiceSpeed,
                onChanged: (v) => setState(() => _voiceSpeed = v),
              ),
              const SizedBox(height: 16),
              if (wide)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _VisualComfortCard(
                        largeText: _largeText,
                        highContrast: _highContrast,
                        onLarge: (v) => setState(() => _largeText = v),
                        onContrast: (v) => setState(() => _highContrast = v),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _InteractionCard(
                        reducedMotion: _reducedMotion,
                        haptic: _haptic,
                        onMotion: (v) => setState(() => _reducedMotion = v),
                        onHaptic: (v) => setState(() => _haptic = v),
                      ),
                    ),
                  ],
                )
              else ...[
                _VisualComfortCard(
                  largeText: _largeText,
                  highContrast: _highContrast,
                  onLarge: (v) => setState(() => _largeText = v),
                  onContrast: (v) => setState(() => _highContrast = v),
                ),
                const SizedBox(height: 16),
                _InteractionCard(
                  reducedMotion: _reducedMotion,
                  haptic: _haptic,
                  onMotion: (v) => setState(() => _reducedMotion = v),
                  onHaptic: (v) => setState(() => _haptic = v),
                ),
              ],
              const SizedBox(height: 16),
              _SimplifiedCheckoutCard(t: t),
              const SizedBox(height: 20),
              Text(
                '지원 도구',
                style: t.labelSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  letterSpacing: 2,
                  color: AppColors.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _SupportChip(
                      icon: Icons.closed_caption,
                      label: '실시간 자막',
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _SupportChip(
                      icon: Icons.visibility_outlined,
                      label: '스크린 리더',
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _SupportChip(
                      icon: Icons.sign_language_outlined,
                      label: '수화 지원',
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _ConciergeFooter(t: t),
            ],
          ),
        ),
      ),
    );
  }
}

class _VoiceSpeedCard extends StatelessWidget {
  const _VoiceSpeedCard({
    required this.speedLabel,
    required this.value,
    required this.onChanged,
  });

  final String speedLabel;
  final double value;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final t = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  color: AppColors.primaryContainer,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.keyboard_voice,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '음성 응답 속도',
                      style: t.titleLarge?.copyWith(fontWeight: FontWeight.w800),
                    ),
                    Text(
                      'AI 안내 속도를 조절합니다',
                      style: t.bodySmall?.copyWith(
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                speedLabel,
                style: t.titleMedium?.copyWith(
                  color: AppColors.primaryContainer,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: AppColors.primaryContainer,
              inactiveTrackColor: cs.surfaceContainerHighest,
              thumbColor: Colors.white,
              overlayColor: AppColors.primaryContainer.withValues(alpha: 0.12),
              trackHeight: 4,
            ),
            child: Slider(
              value: value,
              onChanged: onChanged,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '느리게',
                style: t.labelSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.5,
                  color: AppColors.onSurfaceVariant,
                ),
              ),
              Text(
                '기본',
                style: t.labelSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.5,
                  color: AppColors.onSurfaceVariant,
                ),
              ),
              Text(
                '빠르게',
                style: t.labelSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.5,
                  color: AppColors.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _VisualComfortCard extends StatelessWidget {
  const _VisualComfortCard({
    required this.largeText,
    required this.highContrast,
    required this.onLarge,
    required this.onContrast,
  });

  final bool largeText;
  final bool highContrast;
  final ValueChanged<bool> onLarge;
  final ValueChanged<bool> onContrast;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final t = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.format_size, color: AppColors.onSurfaceVariant),
              const SizedBox(width: 8),
              Text(
                '시각 편안함',
                style: t.titleMedium?.copyWith(fontWeight: FontWeight.w800),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _pillSwitch(
            context,
            label: '큰 글자',
            value: largeText,
            onChanged: onLarge,
            active: true,
          ),
          const SizedBox(height: 10),
          _pillSwitch(
            context,
            label: '고대비',
            value: highContrast,
            onChanged: onContrast,
            active: highContrast,
          ),
        ],
      ),
    );
  }

  Widget _pillSwitch(
    BuildContext context, {
    required String label,
    required bool value,
    required ValueChanged<bool> onChanged,
    required bool active,
  }) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: Colors.white,
            activeTrackColor: active
                ? AppColors.primaryContainer
                : cs.surfaceContainerHighest,
          ),
        ],
      ),
    );
  }
}

class _InteractionCard extends StatelessWidget {
  const _InteractionCard({
    required this.reducedMotion,
    required this.haptic,
    required this.onMotion,
    required this.onHaptic,
  });

  final bool reducedMotion;
  final bool haptic;
  final ValueChanged<bool> onMotion;
  final ValueChanged<bool> onHaptic;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final t = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.motion_photos_off_outlined,
                  color: AppColors.onSurfaceVariant),
              const SizedBox(width: 8),
              Text(
                '상호작용',
                style: t.titleMedium?.copyWith(fontWeight: FontWeight.w800),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _rowSwitch(
            context,
            label: '동작 줄이기',
            value: reducedMotion,
            onChanged: onMotion,
            active: reducedMotion,
          ),
          const SizedBox(height: 10),
          _rowSwitch(
            context,
            label: '햅틱 피드백',
            value: haptic,
            onChanged: onHaptic,
            active: haptic,
          ),
        ],
      ),
    );
  }

  Widget _rowSwitch(
    BuildContext context, {
    required String label,
    required bool value,
    required ValueChanged<bool> onChanged,
    required bool active,
  }) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: Colors.white,
            activeTrackColor: active
                ? AppColors.primaryContainer
                : cs.surfaceContainerHighest,
          ),
        ],
      ),
    );
  }
}

class _SimplifiedCheckoutCard extends StatelessWidget {
  const _SimplifiedCheckoutCard({required this.t});

  final TextTheme t;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.primaryContainer,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryContainer.withValues(alpha: 0.35),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -40,
            bottom: -40,
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.08),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '간소화된 결제',
                style: t.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '불필요한 시각 요소를 줄이고 필수 주문 정보만 크게 보여줍니다.',
                style: t.bodyMedium?.copyWith(
                  color: Colors.white.withValues(alpha: 0.85),
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
                  onPressed: () {},
                  child: const Text(
                    '모드 켜기',
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SupportChip extends StatelessWidget {
  const _SupportChip({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final t = Theme.of(context).textTheme;
    return Material(
      color: cs.surfaceContainerLow,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
          child: Column(
            children: [
              Icon(icon, color: AppColors.primaryContainer, size: 28),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: t.labelLarge?.copyWith(fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ConciergeFooter extends StatelessWidget {
  const _ConciergeFooter({required this.t});

  final TextTheme t;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: cs.outlineVariant.withValues(alpha: 0.35),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: Image.asset(
              StitchAssets.accessibility2,
              width: 56,
              height: 56,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '맞춤 설정이 필요하신가요?',
                  style: t.titleSmall?.copyWith(fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 6),
                Text(
                  '접근성 컨시어지와 음성으로 앱 경험을 세밀하게 조정할 수 있습니다.',
                  style: t.bodySmall?.copyWith(
                    color: AppColors.onSurfaceVariant,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 10),
                TextButton.icon(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.primaryContainer,
                    padding: EdgeInsets.zero,
                  ),
                  icon: const Icon(Icons.arrow_forward, size: 18),
                  label: const Text(
                    '음성 세션 시작',
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
