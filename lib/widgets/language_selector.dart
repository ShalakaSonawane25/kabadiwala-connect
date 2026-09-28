import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/localization/locale_controller.dart';

class LanguageSelectorMenu extends StatelessWidget {
  final LocaleController? controller;

  const LanguageSelectorMenu({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    final ctrl = controller ?? LocaleController.instance;
    final currentCode = ctrl.currentLanguageCode;

    return PopupMenuButton<String>(
      icon: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.language, color: Colors.white, size: 22),
            SizedBox(width: 4),
            Icon(Icons.arrow_drop_down, color: Colors.white, size: 18),
          ],
        ),
      ),
      tooltip: 'Change Language / भाषा बदलें / भाषा बदला',
      onSelected: (langCode) => ctrl.setLanguageCode(langCode),
      itemBuilder: (context) {
        return LocaleController.supportedLanguages.map((lang) {
          final isSelected = lang.code == currentCode;
          return PopupMenuItem<String>(
            value: lang.code,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  lang.nativeName,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    color: isSelected ? AppColors.primary : AppColors.textPrimary,
                  ),
                ),
                if (isSelected)
                  const Icon(Icons.check_circle_rounded, color: AppColors.primary, size: 20),
              ],
            ),
          );
        }).toList();
      },
    );
  }
}
