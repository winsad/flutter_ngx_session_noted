// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_mobile_application/app/app_routes.dart';
import 'package:flutter_mobile_application/providers/account_provider.dart';
import 'package:flutter_mobile_application/widgets/avatar_bottom_sheet.dart';
import 'package:flutter_mobile_application/widgets/language_bottom_sheet.dart';
import 'package:flutter_mobile_application/widgets/setting_card_widget.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Consumer<AccountProvider>(
        builder: (BuildContext context, account, _) {
          return SafeArea(
            top: false,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(
                      24,
                      MediaQuery.paddingOf(context).top,
                      24,
                      32,
                    ),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFF1A73E8), Color(0xFF0D47A1)],
                      ),
                    ),
                    child: Column(
                      children: [
                        // Avatar
                        GestureDetector(
                          onTap: account.isGuest
                              ? null
                              : () => AvatarBottomSheet.show(
                                  context,
                                  selectedAvatar: account.avatar!,
                                  onSelected: (avatar) => context
                                      .read<AccountProvider>()
                                      .onClickedAvatar(avatar),
                                ),
                          child: Stack(
                            children: [
                              Consumer<AccountProvider>(
                                builder: (BuildContext context, account, _) {
                                  if (account.isGuest) {
                                    return Container(
                                      width: 90,
                                      height: 90,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withValues(
                                          alpha: 0.2,
                                        ),
                                        borderRadius: BorderRadius.circular(28),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '👤',
                                          style: const TextStyle(fontSize: 44),
                                        ),
                                      ),
                                    );
                                  }

                                  if (account.avatar == null ||
                                      account.avatar!.path.isEmpty) {
                                    return SizedBox(width: 90, height: 90);
                                  }

                                  return ClipOval(
                                    child: Image.asset(
                                      account.avatar?.path ?? '',
                                      width: 90,
                                      height: 90,
                                    ),
                                  );
                                },
                              ),
                              if (!account.isGuest)
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    width: 26,
                                    height: 26,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.edit_rounded,
                                      size: 14,
                                      color: Color(0xFF1A73E8),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 14),
                        Text(
                          account.name ?? 'Guest User',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 4),
                        Text(
                          account.isGuest
                              ? 'Sign in to access all features'
                              : (account.email ?? ''),
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white.withValues(alpha: 0.75),
                          ),
                        ),
                        if (!account.isGuest) ...[
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              '${account.avatar?.name}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  if (!account.isGuest) ...[
                    SettingCardWidget(
                      title: 'Appearance',
                      children: [
                        _SettingsTile(
                          icon: Icons.face_rounded,
                          iconColor: const Color(0xFF7C3AED),
                          iconBg: const Color(0xFFF5F3FF),
                          title: 'Profile Avatar',
                          onTap: () => AvatarBottomSheet.show(
                            context,
                            selectedAvatar: account.avatar!,
                            onSelected: (avatar) => context
                                .read<AccountProvider>()
                                .onClickedAvatar(avatar),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                  SettingCardWidget(
                    title: 'Preferences',
                    children: [
                      if (!account.isGuest)
                        _SettingsTile(
                          icon: Icons.notifications_outlined,
                          iconColor: const Color(0xFFF59E0B),
                          iconBg: const Color(0xFFFFFBEB),
                          title: 'Notifications',
                          trailing: Switch.adaptive(
                            value: account.notificationsEnabled,
                            activeThumbColor: const Color(0xFF1A73E8),
                            onChanged: (v) => context
                                .read<AccountProvider>()
                                .toggleNotifications(),
                          ),
                        ),
                      _SettingsTile(
                        icon: Icons.language_rounded,
                        iconColor: const Color(0xFF059669),
                        iconBg: const Color(0xFFECFDF5),
                        title: 'Language',
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              account.language == 'km'
                                  ? '🇰🇭 Khmer'
                                  : '🇬🇧 English',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.arrow_drop_down_rounded,
                              size: 18,
                              color: Color(0xFF6B7280),
                            ),
                          ],
                        ),
                        onTap: () => LanguageBottomSheet.show(
                          context,
                          currentLanguage: account.language,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SettingCardWidget(
                    title: 'Account',
                    children: [
                      _SettingsTile(
                        icon: Icons.logout_rounded,
                        iconColor: const Color(0xFFDC2626),
                        iconBg: const Color(0xFFFEF2F2),
                        title: account.isGuest
                            ? 'Sign In / Create Account'
                            : 'Logout',
                        titleColor: const Color(0xFFDC2626),
                        onTap: () => account.isGuest
                            ? Navigator.pushReplacementNamed(
                                context,
                                AppRoutes.login,
                              )
                            : _showLogoutDialog(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'NGX News v1.0.0',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Logout'),
        content: const Text(
          'Are you sure you want to logout? You will be redirected to the login screen.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              await context.read<AccountProvider>().logout();
              Navigator.pushReplacementNamed(context, AppRoutes.login);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  final String title;
  final Color? titleColor;
  final Widget? trailing;
  final VoidCallback? onTap;

  const _SettingsTile({
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    required this.title,
    this.titleColor,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: iconColor, size: 20),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: titleColor ?? const Color(0xFF111827),
                ),
              ),
            ),
            trailing ??
                const Icon(
                  Icons.chevron_right_rounded,
                  color: Color(0xFF9CA3AF),
                  size: 22,
                ),
          ],
        ),
      ),
    );
  }
}
