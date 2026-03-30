import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../layout/responsive_layout.dart';
import '../theme/app_colors.dart';

/// 쇼핑(0) · 어시스턴트(1) · 주문내역(2) · 내 정보(3) — [StatefulNavigationShell]과 동일 순서.
class KoreanMainBottomNav extends StatelessWidget {
  const KoreanMainBottomNav({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  void _go(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;
    final idx = navigationShell.currentIndex;
    final hPad = ResponsiveLayout.horizontalPadding(context).clamp(12.0, 48.0);
    return Container(
      padding: EdgeInsets.fromLTRB(hPad, 12, hPad, 16 + bottom),
      decoration: BoxDecoration(
        color: AppColors.background.withValues(alpha: 0.92),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(48)),
        boxShadow: [
          BoxShadow(
            color: AppColors.onSurface.withValues(alpha: 0.04),
            blurRadius: 40,
            offset: const Offset(0, -12),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: _NavItem(
              icon: Icons.shopping_bag_outlined,
              label: '쇼핑',
              selected: idx == 0,
              onTap: () => _go(0),
            ),
          ),
          Expanded(
            child: _NavItem(
              icon: Icons.mic_none,
              label: '어시스턴트',
              selected: idx == 1,
              onTap: () => _go(1),
            ),
          ),
          Expanded(
            child: _NavItem(
              icon: Icons.receipt_long_outlined,
              label: '주문내역',
              selected: idx == 2,
              onTap: () => _go(2),
            ),
          ),
          Expanded(
            child: _NavItem(
              icon: Icons.person_outline,
              label: '내 정보',
              selected: idx == 3,
              onTap: () => _go(3),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.selected = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.labelSmall?.copyWith(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        );

    if (selected) {
      return Center(
        child: Material(
          color: AppColors.primaryContainer,
          borderRadius: BorderRadius.circular(999),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(999),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, color: Colors.white, size: 26),
                  const SizedBox(height: 4),
                  Text(
                    label,
                    style: style?.copyWith(color: Colors.white),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: AppColors.onSurfaceVariant, size: 26),
            const SizedBox(height: 4),
            Text(
              label,
              style: style?.copyWith(color: AppColors.onSurfaceVariant),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
