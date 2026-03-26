import 'package:flutter/material.dart';
import 'package:flutter_mobile_application/providers/dashboard_provider.dart';
import 'package:flutter_mobile_application/screens/account_page.dart';
import 'package:flutter_mobile_application/screens/bookmark_page.dart';
import 'package:flutter_mobile_application/screens/home_page.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          body: IndexedStack(
            index: provider.currentIndex,
            children: [HomePage(), BookmarkPage(), AccountPage()],
          ),
          bottomNavigationBar: BottomNavBar(
            index: provider.currentIndex,
            onTap: (int index) {
              context.read<DashboardProvider>().onPageChanged(index);
            },
          ),
        );
      },
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.index, required this.onTap});
  final int index;
  final Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .only(top: 9, bottom: MediaQuery.paddingOf(context).bottom),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withValues(alpha: 0.03),
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: .spaceEvenly,
        children: [
          _NavItem(
            icon: Icons.home_outlined,
            activeIcon: Icons.home_rounded,
            label: 'Home',
            isActive: index == 0,
            onTap: () => onTap(0),
          ),

          _NavItem(
            icon: Icons.bookmark_border_rounded,
            activeIcon: Icons.bookmark_rounded,
            label: 'Bookmark',
            isActive: index == 1,
            onTap: () => onTap(1),
          ),
          _NavItem(
            icon: Icons.person_outline_rounded,
            activeIcon: Icons.person_rounded,
            label: 'Account',
            isActive: index == 2,
            onTap: () => onTap(2),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const activeColor = Color(0xFF1A73E8);
    const inactiveColor = Color(0xFF9CA3AF);

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFFEFF6FF) : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isActive ? activeIcon : icon,
              key: ValueKey(isActive),
              color: isActive ? activeColor : inactiveColor,
              size: 24,
            ),
            // .animate()
            // .fadeIn(duration: 200.ms)
            // .scale(
            //   begin: const Offset(0.8, 0.8),
            //   end: const Offset(1.0, 1.0),
            //   duration: 200.ms,
            //   curve: Curves.elasticOut,
            // )
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                color: isActive ? activeColor : inactiveColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
