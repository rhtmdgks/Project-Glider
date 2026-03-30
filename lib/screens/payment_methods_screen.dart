import 'package:flutter/material.dart';

import '../layout/responsive_layout.dart';
import '../router/safe_navigation.dart';
import '../stitch/stitch_assets.dart';
import '../theme/app_colors.dart';

/// 결제 수단 관리 — Stitch `screen_22c96b1c805c41b4af6ea6fdcc704fca`
class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final t = Theme.of(context).textTheme;
    final pad = ResponsiveLayout.horizontalPadding(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        title: const Text('B Mart'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => safePopOrMain(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage(StitchAssets.paymentMethods0),
            ),
          ),
        ],
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: ResponsiveLayout.narrowColumnMaxWidth(context),
          ),
          child: ListView(
            padding: EdgeInsets.fromLTRB(pad, 8, pad, 32),
            children: [
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
                    '보안 월렛',
                    style: t.labelLarge?.copyWith(
                      color: AppColors.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                '저장된 결제 수단',
                style: t.headlineMedium?.copyWith(fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 12),
              Text(
                '원활한 결제를 위해 카드를 관리하세요. 데이터는 암호화되어 업계 표준으로 보호됩니다.',
                style: t.bodyLarge?.copyWith(
                  color: AppColors.onSurfaceVariant,
                  height: 1.45,
                ),
              ),
              const SizedBox(height: 28),
              _PrimaryCard(t: t),
              const SizedBox(height: 16),
              _SecondaryCard(t: t, cs: cs),
              const SizedBox(height: 16),
              _AddCardButton(t: t, cs: cs),
              const SizedBox(height: 28),
              _PciBadge(t: t, cs: cs),
            ],
          ),
        ),
      ),
    );
  }
}

class _PrimaryCard extends StatelessWidget {
  const _PrimaryCard({required this.t});

  final TextTheme t;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.primaryContainer,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryContainer.withValues(alpha: 0.35),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -24,
            bottom: -24,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.06),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '별칭',
                        style: t.labelSmall?.copyWith(
                          color: Colors.white.withValues(alpha: 0.85),
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '메인 쇼핑 카드',
                        style: t.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.contactless,
                    color: Colors.white.withValues(alpha: 0.95),
                    size: 32,
                  ),
                ],
              ),
              const SizedBox(height: 28),
              Row(
                children: [
                  Text(
                    '•••• •••• ••••',
                    style: t.headlineSmall?.copyWith(
                      color: Colors.white.withValues(alpha: 0.55),
                      letterSpacing: 4,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    '8842',
                    style: t.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 3,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '카드사',
                        style: t.labelSmall?.copyWith(
                          color: Colors.white.withValues(alpha: 0.55),
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '현대카드',
                        style: t.titleSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 48,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.22),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'VISA',
                      style: t.labelSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SecondaryCard extends StatelessWidget {
  const _SecondaryCard({required this.t, required this.cs});

  final TextTheme t;
  final ColorScheme cs;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.outlineVariant.withValues(alpha: 0.25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '별칭',
                    style: t.labelSmall?.copyWith(
                      color: AppColors.onSurfaceVariant,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '개인 장보기용',
                    style: t.titleLarge?.copyWith(fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              Icon(Icons.security, color: AppColors.onSurfaceVariant, size: 28),
            ],
          ),
          const SizedBox(height: 28),
          Row(
            children: [
              Text(
                '•••• •••• ••••',
                style: t.headlineSmall?.copyWith(
                  color: AppColors.onSurface.withValues(alpha: 0.28),
                  letterSpacing: 4,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                '1029',
                style: t.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  letterSpacing: 3,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '카드사',
                    style: t.labelSmall?.copyWith(
                      color: AppColors.onSurfaceVariant,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '삼성카드',
                    style: t.titleSmall?.copyWith(fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              Container(
                width: 48,
                height: 32,
                decoration: BoxDecoration(
                  color: AppColors.onSurface.withValues(alpha: 0.06),
                  borderRadius: BorderRadius.circular(6),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Master',
                  style: t.labelSmall?.copyWith(
                    color: AppColors.onSurface.withValues(alpha: 0.45),
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
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

class _AddCardButton extends StatelessWidget {
  const _AddCardButton({required this.t, required this.cs});

  final TextTheme t;
  final ColorScheme cs;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.outlineVariant.withValues(alpha: 0.45),
              strokeAlign: BorderSide.strokeAlignInside,
              width: 2,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: cs.surfaceContainerHighest,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.add, color: AppColors.onSurfaceVariant),
              ),
              const SizedBox(width: 14),
              Text(
                '새 결제 수단 추가',
                style: t.titleMedium?.copyWith(fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PciBadge extends StatelessWidget {
  const _PciBadge({required this.t, required this.cs});

  final TextTheme t;
  final ColorScheme cs;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(
            Icons.verified_user,
            color: AppColors.primaryContainer,
            size: 28,
          ),
          const SizedBox(height: 8),
          Text(
            'PCI DSS 준수',
            style: t.titleSmall?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 6),
          Text(
            '결제 정보는 뱅킹 수준 암호화로 안전하게 저장됩니다.',
            textAlign: TextAlign.center,
            style: t.bodySmall?.copyWith(
              color: AppColors.onSurfaceVariant,
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }
}
