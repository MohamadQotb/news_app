import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/app_theme.dart';
import 'package:news_app/features/home/view/home_screen.dart';
import 'package:news_app/features/home/viewModel/app_provider.dart';
import 'package:news_app/features/search/view/search_screen.dart';
import 'package:news_app/features/search/view_model/search_cubit.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppSettingsProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: context.watch<AppSettingsProvider>().themeMode,
      title: 'Flutter Demo',
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
