import 'package:flutter/material.dart';

import '../../providers/theme_color_provider.dart';
import '../../theme/theme.dart';
import 'widget/theme_color_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text(
            "Settings",
            style: AppTextStyles.heading.copyWith(
              color: themeColorProvider.currentThemeColor.color,
            ),
          ),

          SizedBox(height: 50),

          Text(
            "Theme",
            style: AppTextStyles.label.copyWith(color: AppColors.textLight),
          ),

          SizedBox(height: 10),
      
          ListenableBuilder(
            listenable: themeColorProvider,
            builder: (context, _) {
              final current = themeColorProvider.currentThemeColor;
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: ThemeColor.values
                    .map(
                      (theme) => ThemeColorButton(
                        themeColor: theme,
                        isSelected: theme == current,
                        onTap: (value) {
                          themeColorProvider.changeThemeColor(value);
                        },
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
