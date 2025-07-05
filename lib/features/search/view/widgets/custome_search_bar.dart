import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/app_extention.dart';
import 'package:news_app/features/search/view_model/search_cubit.dart';

class CustomeSearchBar extends StatelessWidget {
  const CustomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: context.read<SearchCubit>().controller,
      enabled: true,
      onSubmitted: (value) {
        context.read<SearchCubit>().articles = [];
        context.read<SearchCubit>().getSearchedArticles();
      },
      cursorColor: context.getColor().secondaryHeaderColor,
      cursorRadius: Radius.circular(16),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      style: context.getTextStyle().displayMedium?.copyWith(
        fontWeight: FontWeight.w500,
        color: context.getColor().secondaryHeaderColor,
      ),
      decoration: InputDecoration(
        hintText: context.loc.search,
        hintStyle: context.getTextStyle().displayMedium?.copyWith(
          fontWeight: FontWeight.w500,
          color: context.getColor().secondaryHeaderColor,
        ),
        contentPadding: EdgeInsets.all(16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: context.getColor().secondaryHeaderColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: context.getColor().secondaryHeaderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: context.getColor().secondaryHeaderColor,
          ),
        ),
        iconColor: context.getColor().secondaryHeaderColor,
        prefixIcon: Icon(Icons.search_rounded),

        suffixIcon: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.close_rounded),
        ),
        prefixIconColor: context.getColor().secondaryHeaderColor,
        suffixIconColor: context.getColor().secondaryHeaderColor,
      ),
    );
  }
}
