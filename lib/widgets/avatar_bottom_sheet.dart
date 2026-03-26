import 'package:flutter/material.dart';
import 'package:flutter_mobile_application/providers/account_provider.dart';

class AvatarBottomSheet extends StatefulWidget {
  final Avatar selectedAvatar;
  final ValueChanged<Avatar> onSelected;

  const AvatarBottomSheet({
    super.key,
    required this.selectedAvatar,
    required this.onSelected,
  });

  static void show(
    BuildContext context, {
    required Avatar selectedAvatar,
    required ValueChanged<Avatar> onSelected,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => AvatarBottomSheet(
        selectedAvatar: selectedAvatar,
        onSelected: onSelected,
      ),
    );
  }

  @override
  State<AvatarBottomSheet> createState() => _AvatarBottomSheetState();
}

class _AvatarBottomSheetState extends State<AvatarBottomSheet> {
  late Avatar currentAvatar = widget.selectedAvatar;

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
            'Choose Your Avatar',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 24),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1,
            ),
            itemCount: AccountProvider.avatars.length,
            itemBuilder: (ctx, index) {
              final isSelected =
                  AccountProvider.avatars[index].name == currentAvatar.name;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    currentAvatar = AccountProvider.avatars[index];
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFFEEF2FF)
                        : const Color(0xFFF9FAFB),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isSelected ? Colors.blue : Colors.transparent,
                      width: 2.5,
                    ),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: Colors.blue.withValues(alpha: 0.2),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ]
                        : [],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          AccountProvider.avatars[index].path,
                          width: 48,
                          height: 48,
                        ),
                      ),
                      Text(
                        AccountProvider.avatars[index].name,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: isSelected
                              ? Colors.blue
                              : const Color(0xFF6B7280),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          GestureDetector(
            onTap: () {
              widget.onSelected(currentAvatar);
              Navigator.pop(context);
            },
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.blue,
                border: Border.all(color: Colors.blue),
              ),
              alignment: Alignment.center,
              child: Text(
                'Confirm',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
