import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news_app/core/app_assets.dart';
import 'package:news_app/core/app_extention.dart';
import 'package:news_app/features/home/models/category_model_class.dart';
import 'package:news_app/features/home/view/views/category_details_view.dart';
import 'package:news_app/features/home/view/views/category_view.dart';
import 'package:news_app/features/home/view/widgets/category_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/homeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryModelClass? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu_rounded)),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ImageIcon(AssetImage(AppAssets.searchIcon)),
          ),
        ],
      ),
      body: selectedCategory == null ? CategoryView() : CategoryDetailsView(),
    );
  }
}
