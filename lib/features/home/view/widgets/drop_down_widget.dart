import 'package:flutter/material.dart';
import 'package:news_app/core/app_assets.dart';
import 'package:news_app/core/app_colors.dart';
import 'package:news_app/core/app_extention.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({super.key, this.items, this.selected, this.onChanged});
  final String? selected;
  final List<DropdownMenuItem<String>>? items;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.white),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          padding: EdgeInsets.symmetric(horizontal: 16),

          dropdownColor: AppColors.black,
          iconSize: 16,
          icon: ImageIcon(AssetImage(AppAssets.vectorIcon)),
          borderRadius: BorderRadius.circular(16),
          isExpanded: true,
          iconEnabledColor: AppColors.white,
          style: context.getTextStyle().displayMedium,
          items: items,
          onChanged: onChanged,
          value: selected,
        ),
      ),
    );
  }
}
