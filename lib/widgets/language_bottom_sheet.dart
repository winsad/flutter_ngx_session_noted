import 'package:flutter/material.dart';
import 'package:flutter_mobile_application/providers/account_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  final String currentLanguage;

  const LanguageBottomSheet({super.key, required this.currentLanguage});

  static void show(BuildContext context, {required String currentLanguage}) {
    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => LanguageBottomSheet(currentLanguage: currentLanguage),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: const Color(0xFFD1D5DB),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Select Language',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          _langOption(context, 'en', '🇬🇧 English'),
          const SizedBox(height: 12),
          _langOption(context, 'km', '🇰🇭 Khmer'),
        ],
      ),
    );
  }

  Widget _langOption(BuildContext context, String locale, String label) {
    final isSelected = currentLanguage == locale;
    return GestureDetector(
      onTap: () {
        context.read<AccountProvider>().setLanguage(locale);
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFEFF6FF) : const Color(0xFFF9FAFB),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFF1A73E8) : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            if (isSelected)
              const Icon(Icons.check_circle_rounded, color: Color(0xFF1A73E8)),
          ],
        ),
      ),
    );
  }
}
