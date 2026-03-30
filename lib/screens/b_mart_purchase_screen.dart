import 'package:flutter/material.dart';

import '../layout/responsive_layout.dart';

/// Stitch "B Mart Purchase with Logo" — migrated from HTML; typography: Paperlogy.
class BMartPurchaseScreen extends StatelessWidget {
  const BMartPurchaseScreen({super.key, this.embedInMainShell = false});

  /// 메인 탭 셸 안에서는 중복 하단 바·FAB을 숨깁니다.
  final bool embedInMainShell;

  static const _font = 'Paperlogy';

  static const Color _background = Color(0xFFF9F9F9);
  static const Color _onSurface = Color(0xFF1B1B1B);
  static const Color _primaryContainer = Color(0xFF0047AB);
  static const Color _surfaceContainerHighest = Color(0xFFE2E2E2);
  static const Color _surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color _outlineVariant = Color(0xFFC3C6D5);
  static const Color _onSurfaceVariant = Color(0xFF434653);

  static const String _logo = 'assets/images/b_mart_purchase/logo.png';
  static const String _profile = 'assets/images/b_mart_purchase/profile.png';
  static const String _mango = 'assets/images/b_mart_purchase/mango.png';

  /// centerDocked FAB가 본문 하단에 겹치는 높이 + 여유.
  static const double _scrollBottomInsetFab = 56;
  static const double _scrollBottomInsetEmbedded = 24;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final bottomPad =
        embedInMainShell ? _scrollBottomInsetEmbedded : _scrollBottomInsetFab;
    final hPad = ResponsiveLayout.horizontalPadding(context);

    final scroll = SafeArea(
      bottom: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Header(horizontalPadding: hPad),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(
                hPad,
                16,
                hPad,
                bottomPad,
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: ResponsiveLayout.narrowColumnMaxWidth(context),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _VoiceHero(textTheme: textTheme),
                      const SizedBox(height: 40),
                      _Conversation(textTheme: textTheme),
                      const SizedBox(height: 24),
                      _ProductCard(textTheme: textTheme),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: _background,
      extendBody: false,
      body: scroll,
      floatingActionButton: embedInMainShell ? null : const _AssistantFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:
          embedInMainShell ? null : const _BottomAppNavBar(),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.horizontalPadding});

  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu),
                color: BMartPurchaseScreen._onSurfaceVariant,
                style: IconButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(40, 40),
                ),
              ),
              const SizedBox(width: 8),
              Image.asset(
                BMartPurchaseScreen._logo,
                height: 24,
                fit: BoxFit.contain,
                filterQuality: FilterQuality.high,
              ),
            ],
          ),
          Material(
            color: BMartPurchaseScreen._surfaceContainerHighest.withValues(alpha: 0.6),
            shape: const CircleBorder(),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {},
              child: SizedBox(
                width: 40,
                height: 40,
                child: Image.asset(
                  BMartPurchaseScreen._profile,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _VoiceHero extends StatelessWidget {
  const _VoiceHero({required this.textTheme});

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        SizedBox(
          width: 192,
          height: 192,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Transform.scale(
                scale: 1.1,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: BMartPurchaseScreen._primaryContainer.withValues(alpha: 0.2),
                      width: 4,
                    ),
                  ),
                ),
              ),
              Container(
                width: 192,
                height: 192,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const RadialGradient(
                    center: Alignment(-0.4, -0.4),
                    radius: 1.0,
                    colors: [
                      Color(0xFFFFFFFF),
                      Color(0xFFF3F3F3),
                      Color(0xFFDAE2FF),
                    ],
                    stops: [0.0, 0.45, 1.0],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: BMartPurchaseScreen._primaryContainer.withValues(alpha: 0.08),
                      blurRadius: 40,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: BMartPurchaseScreen._primaryContainer,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x33001A4D),
                          blurRadius: 16,
                          offset: Offset(0, 8),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.mic,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        Text(
          'AI 구매 어시스턴트',
          style: textTheme.labelSmall?.copyWith(
            fontFamily: BMartPurchaseScreen._font,
            color: BMartPurchaseScreen._primaryContainer,
            fontWeight: FontWeight.w600,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '결제 처리 중',
          style: textTheme.headlineSmall?.copyWith(
            fontFamily: BMartPurchaseScreen._font,
            color: BMartPurchaseScreen._onSurface,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.5,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _Conversation extends StatelessWidget {
  const _Conversation({required this.textTheme});

  final TextTheme textTheme;

  static const _bubbleRadius = 16.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 320),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: const BoxDecoration(
                color: BMartPurchaseScreen._surfaceContainerHighest,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_bubbleRadius),
                  topRight: Radius.circular(_bubbleRadius),
                  bottomLeft: Radius.circular(_bubbleRadius),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x0A000000),
                    blurRadius: 4,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Text(
                '"B마트에서 저번에 구매했던 애플망고 사줘."',
                style: textTheme.titleMedium?.copyWith(
                  fontFamily: BMartPurchaseScreen._font,
                  color: BMartPurchaseScreen._onSurface,
                  height: 1.5,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        _MicroStatus(textTheme: textTheme),
        const SizedBox(height: 24),
        Align(
          alignment: Alignment.centerLeft,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 320),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                color: BMartPurchaseScreen._surfaceContainerLowest,
                border: Border.all(
                  color: BMartPurchaseScreen._outlineVariant.withValues(alpha: 0.15),
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(_bubbleRadius),
                  topRight: Radius.circular(_bubbleRadius),
                  bottomRight: Radius.circular(_bubbleRadius),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x05000000),
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                '"네, B마트에서 지난 3월 10일에 구매했던 애플망고를 확인했어요. 현재 충분히 재고가 남아 있습니다. 지금 주문하면 오후 7시 전에 도착 예정입니다. 구매하시겠습니까?"',
                style: textTheme.titleMedium?.copyWith(
                  fontFamily: BMartPurchaseScreen._font,
                  color: BMartPurchaseScreen._onSurface,
                  height: 1.5,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Align(
          alignment: Alignment.centerRight,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 320),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: const BoxDecoration(
                color: BMartPurchaseScreen._surfaceContainerHighest,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_bubbleRadius),
                  topRight: Radius.circular(_bubbleRadius),
                  bottomLeft: Radius.circular(_bubbleRadius),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x0A000000),
                    blurRadius: 4,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Text(
                '"구매해줘."',
                style: textTheme.titleMedium?.copyWith(
                  fontFamily: BMartPurchaseScreen._font,
                  color: BMartPurchaseScreen._onSurface,
                  height: 1.5,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Align(
          alignment: Alignment.centerLeft,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 320),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  decoration: const BoxDecoration(
                    color: BMartPurchaseScreen._primaryContainer,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(_bubbleRadius),
                      topRight: Radius.circular(_bubbleRadius),
                      bottomRight: Radius.circular(_bubbleRadius),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x1A001A4D),
                        blurRadius: 12,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Text(
                    '"현대카드로 애플망고 결제를 완료했습니다."',
                    style: textTheme.titleMedium?.copyWith(
                      fontFamily: BMartPurchaseScreen._font,
                      color: Colors.white,
                      height: 1.5,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.check_circle,
                        size: 18,
                        color: BMartPurchaseScreen._primaryContainer,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '결제 완료',
                        style: textTheme.labelSmall?.copyWith(
                          fontFamily: BMartPurchaseScreen._font,
                          color: BMartPurchaseScreen._primaryContainer,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _MicroStatus extends StatelessWidget {
  const _MicroStatus({required this.textTheme});

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(height: 1, color: BMartPurchaseScreen._outlineVariant.withValues(alpha: 0.3)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            '애플망고 검색 완료.',
            style: textTheme.labelSmall?.copyWith(
              fontFamily: BMartPurchaseScreen._font,
              color: BMartPurchaseScreen._onSurfaceVariant,
              fontSize: 11,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
            ),
          ),
        ),
        Expanded(
          child: Container(height: 1, color: BMartPurchaseScreen._outlineVariant.withValues(alpha: 0.3)),
        ),
      ],
    );
  }
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({required this.textTheme});

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: BMartPurchaseScreen._surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: BMartPurchaseScreen._outlineVariant.withValues(alpha: 0.15),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  BMartPurchaseScreen._mango,
                  width: 128,
                  height: 128,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '프리미엄 과일',
                      style: textTheme.labelSmall?.copyWith(
                        fontFamily: BMartPurchaseScreen._font,
                        color: BMartPurchaseScreen._primaryContainer,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.5,
                        fontSize: 10,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '애플망고 2입',
                      style: textTheme.titleLarge?.copyWith(
                        fontFamily: BMartPurchaseScreen._font,
                        fontWeight: FontWeight.w700,
                        color: BMartPurchaseScreen._onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          BMartPurchaseScreen._logo,
                          height: 16,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            '• 강남점',
                            style: textTheme.bodySmall?.copyWith(
                              fontFamily: BMartPurchaseScreen._font,
                              color: BMartPurchaseScreen._onSurfaceVariant,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: BMartPurchaseScreen._primaryContainer.withValues(alpha: 0.05),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        '재고 충분',
                        style: textTheme.labelSmall?.copyWith(
                          fontFamily: BMartPurchaseScreen._font,
                          color: BMartPurchaseScreen._primaryContainer,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Divider(height: 1, color: BMartPurchaseScreen._outlineVariant.withValues(alpha: 0.2)),
          const SizedBox(height: 24),
          const _ProductMetaGrid(),
        ],
      ),
    );
  }
}

class _ProductMetaGrid extends StatelessWidget {
  const _ProductMetaGrid();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    Widget metaField(String label, String value) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: textTheme.labelSmall?.copyWith(
              fontFamily: BMartPurchaseScreen._font,
              color: BMartPurchaseScreen._onSurfaceVariant,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8,
              fontSize: 11,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: textTheme.bodyMedium?.copyWith(
              fontFamily: BMartPurchaseScreen._font,
              color: BMartPurchaseScreen._onSurface,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      );
    }

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: metaField('지난 구매', '3월 10일')),
            const SizedBox(width: 16),
            Expanded(child: metaField('도착 예정', '오늘 오후 7시 전')),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: metaField('결제 수단', '현대카드 (**** 1234)')),
            const SizedBox(width: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        color: BMartPurchaseScreen._primaryContainer,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.receipt,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        '결제 완료',
                        style: textTheme.bodyMedium?.copyWith(
                          fontFamily: BMartPurchaseScreen._font,
                          color: BMartPurchaseScreen._primaryContainer,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// 중앙 노치에 맞춰 도킹되는 어시스턴트 버튼 (위로 잘리지 않도록 Scaffold가 배치).
class _AssistantFab extends StatelessWidget {
  const _AssistantFab();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      elevation: 8,
      shadowColor: BMartPurchaseScreen._primaryContainer.withValues(alpha: 0.35),
      shape: const CircleBorder(),
      color: BMartPurchaseScreen._primaryContainer,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {},
        customBorder: const CircleBorder(),
        child: SizedBox(
          width: 72,
          height: 72,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.mic, color: Colors.white, size: 26),
              const SizedBox(height: 2),
              Text(
                '어시스턴트',
                style: textTheme.labelSmall?.copyWith(
                  fontFamily: BMartPurchaseScreen._font,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.6,
                  fontSize: 10,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomAppNavBar extends StatelessWidget {
  const _BottomAppNavBar();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: BottomAppBar(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        elevation: 12,
        shadowColor: BMartPurchaseScreen._onSurface.withValues(alpha: 0.08),
        surfaceTintColor: Colors.transparent,
        color: BMartPurchaseScreen._background.withValues(alpha: 0.98),
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        height: 72,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: _BarNavItem(
                icon: Icons.shopping_bag_outlined,
                label: '쇼핑',
                onTap: () {},
              ),
            ),
            const SizedBox(width: 72),
            Expanded(
              child: _BarNavItem(
                icon: Icons.receipt_long_outlined,
                label: '주문',
                onTap: () {},
              ),
            ),
            Expanded(
              child: _BarNavItem(
                icon: Icons.shopping_cart_outlined,
                label: '장바구니',
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BarNavItem extends StatelessWidget {
  const _BarNavItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: BMartPurchaseScreen._onSurfaceVariant, size: 26),
            const SizedBox(height: 4),
            Text(
              label,
              style: textTheme.labelSmall?.copyWith(
                fontFamily: BMartPurchaseScreen._font,
                color: BMartPurchaseScreen._onSurfaceVariant,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.8,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
