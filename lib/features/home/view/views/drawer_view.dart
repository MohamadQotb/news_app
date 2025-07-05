import 'package:flutter/material.dart';
import 'package:news_app/core/app_assets.dart';
import 'package:news_app/core/app_colors.dart';
import 'package:news_app/core/app_extention.dart';
import 'package:news_app/features/home/view/widgets/drop_down_widget.dart';
import 'package:news_app/features/home/viewModel/app_provider.dart';
import 'package:provider/provider.dart';

class DrawerView extends StatelessWidget {
  final void Function()? onTap;
  const DrawerView({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> themeMenuItem = [
      DropdownMenuItem(value: 'Light', child: Text(context.loc.light)),
      DropdownMenuItem(value: 'Dark', child: Text(context.loc.dark)),
    ];
    List<DropdownMenuItem<String>> languageMenuItem = [
      DropdownMenuItem(value: 'ar', child: Text(context.loc.arabic)),
      DropdownMenuItem(value: 'en', child: Text(context.loc.english)),
    ];
    String? selectedLanguage =
        context.read<AppSettingsProvider>().language == 'en' ? 'en' : 'ar';
    String? selectedTheme = context.read<AppSettingsProvider>().themeTitle;
    return Column(
      children: [
        Container(
          height: context.getSize().height * 0.2,
          width: double.infinity,
          decoration: BoxDecoration(color: AppColors.white),
          child: Center(
            child: Text('News App', style: context.getTextStyle().displayLarge),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.all(0),
                onTap: onTap,

                leading: ImageIcon(AssetImage(AppAssets.homeIcon)),
                title: Text(context.loc.goToHome),
              ),
              Divider(color: AppColors.white),
              SizedBox(height: 24),
              Column(
                spacing: 8,
                children: [
                  Row(
                    spacing: 8,
                    children: [
                      ImageIcon(
                        AssetImage(AppAssets.themeIcon),
                        color: AppColors.white,
                      ),
                      Text(
                        context.loc.theme,
                        style: context.getTextStyle().displayMedium,
                      ),
                    ],
                  ),
                  DropDownWidget(
                    items: themeMenuItem,
                    selected: selectedTheme,
                    onChanged: (p0) {
                      if (selectedTheme == p0) {
                        return;
                      }
                      selectedTheme = p0;
                      context.read<AppSettingsProvider>().toggleTheme();
                    },
                  ),
                ],
              ),
              SizedBox(height: 24),

              Divider(color: AppColors.white),
              SizedBox(height: 24),

              Column(
                spacing: 8,
                children: [
                  Row(
                    spacing: 8,
                    children: [
                      ImageIcon(
                        AssetImage(AppAssets.languageIcon),
                        color: AppColors.white,
                      ),
                      Text(
                        context.loc.language,
                        style: context.getTextStyle().displayMedium,
                      ),
                    ],
                  ),
                  DropDownWidget(
                    items: languageMenuItem,
                    selected: selectedLanguage,
                    onChanged: (p0) {
                      if (selectedLanguage == p0) {
                        return;
                      }
                      selectedLanguage = p0;
                      context.read<AppSettingsProvider>().changeLanguage();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
