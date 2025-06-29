import 'package:flutter/material.dart';
import 'package:news_app/core/app_assets.dart';
import 'package:news_app/core/app_colors.dart';
import 'package:news_app/features/home/models/category_model_class.dart';
import 'package:news_app/features/home/view/views/category_details_view.dart';
import 'package:news_app/features/home/view/views/category_view.dart';
import 'package:news_app/features/home/view/views/drawer_view.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/homeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  CategoryModelClass? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        backgroundColor: AppColors.black,
        child: DrawerView(
          onTap: () {
            selectedCategory = null;
            _scaffoldKey.currentState!.closeDrawer();
            setState(() {});
          },
        ),
      ),
      appBar: AppBar(
        title: Text(
          selectedCategory == null ? 'Home' : selectedCategory!.categoryName,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ImageIcon(AssetImage(AppAssets.searchIcon)),
          ),
        ],
      ),
      body: selectedCategory == null
          ? CategoryView(
              onCatClicked: (p0) {
                selectedCategory = p0;
                setState(() {});
              },
            )
          : CategoryDetailsView(),
    );
  }
}
