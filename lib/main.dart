import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/app_theme.dart';
import 'package:news_app/features/home/view/home_screen.dart';
import 'package:news_app/features/home/viewModel/app_provider.dart';
import 'package:news_app/features/search/view/search_screen.dart';
import 'package:news_app/features/search/view_model/search_cubit.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppSettingsProvider(),
      child: Consumer<AppSettingsProvider>(
        builder: (context, value, child) => value.isLoading
            ? Center(child: CircularProgressIndicator())
            : MyApp(provider: value),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.provider});
  final AppSettingsProvider provider;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: provider.themeMode,
      locale: Locale(provider.language),
      title: 'Flutter Demo',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // arabic
      ],
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SearchScreen.routeName: (_) => BlocProvider(
          create: (context) => SearchCubit(),
          child: SearchScreen(),
        ),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
