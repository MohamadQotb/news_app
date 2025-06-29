import 'package:flutter/material.dart';
import 'package:news_app/core/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.white,
    secondaryHeaderColor: AppColors.black,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.black, size: 24),
      titleTextStyle: TextStyle(
        color: AppColors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: TextTheme(
      //home screen text styles
      titleLarge: TextStyle(
        color: AppColors.black,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      //tab Bar text styles
      labelMedium: TextStyle(
        color: AppColors.black,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      labelLarge: TextStyle(
        color: AppColors.black,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      //news details text styles
      bodySmall: TextStyle(
        color: AppColors.grey,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        color: AppColors.white,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      //drawer text styles
      displayLarge: TextStyle(
        color: AppColors.black,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      displayMedium: TextStyle(
        color: AppColors.white,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.white),
        foregroundColor: WidgetStatePropertyAll(AppColors.black),
        padding: WidgetStatePropertyAll(EdgeInsets.all(16)),
        textStyle: WidgetStatePropertyAll(
          TextStyle(
            color: AppColors.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        fixedSize: WidgetStatePropertyAll(Size.fromWidth(double.infinity)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
    ),
    listTileTheme: ListTileThemeData(
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
      ),
      iconColor: AppColors.white,
    ),
    dividerColor: AppColors.white,
    tabBarTheme: TabBarThemeData(
      dividerColor: Colors.transparent,
      tabAlignment: TabAlignment.start,
      indicatorColor: AppColors.black,
      labelColor: AppColors.black,
      labelStyle: TextStyle(
        color: AppColors.white,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      unselectedLabelStyle: TextStyle(
        color: AppColors.black,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelColor: AppColors.black,
      labelPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
    ),
  );

  //DarkTheme------------->
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: AppColors.black,
    secondaryHeaderColor: AppColors.white,
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.black,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.white, size: 24),
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: TextTheme(
      //home screen text styles
      titleLarge: TextStyle(
        color: AppColors.white,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      //tab Bar text styles
      labelMedium: TextStyle(
        color: AppColors.white,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      labelLarge: TextStyle(
        color: AppColors.white,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      //news details text styles
      bodySmall: TextStyle(
        color: AppColors.grey,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        color: AppColors.black,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      //drawer text styles
      displayLarge: TextStyle(
        color: AppColors.black,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      displayMedium: TextStyle(
        color: AppColors.white,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.black),
        foregroundColor: WidgetStatePropertyAll(AppColors.white),
        padding: WidgetStatePropertyAll(EdgeInsets.all(16)),
        textStyle: WidgetStatePropertyAll(
          TextStyle(
            color: AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        fixedSize: WidgetStatePropertyAll(Size.fromWidth(double.infinity)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
    ),
    listTileTheme: ListTileThemeData(
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
      ),
      iconColor: AppColors.white,
    ),
    dividerColor: AppColors.white,
    tabBarTheme: TabBarThemeData(
      dividerColor: Colors.transparent,
      tabAlignment: TabAlignment.start,
      indicatorColor: AppColors.white,
      labelColor: AppColors.white,
      labelStyle: TextStyle(
        color: AppColors.white,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      unselectedLabelStyle: TextStyle(
        color: AppColors.white,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelColor: AppColors.white,
      labelPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
    ),
  );
}
