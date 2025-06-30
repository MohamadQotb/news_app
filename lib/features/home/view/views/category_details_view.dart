import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home/models/category_model_class.dart';
import 'package:news_app/features/newsArticles/view/views/articles_view.dart';
import 'package:news_app/features/newsSources/modelView/cubit/sources_cubit.dart';
import 'package:news_app/features/newsSources/modelView/cubit/sources_cubit_states.dart';
import 'package:news_app/features/newsSources/view/views/news_sources_view.dart';

class CategoryDetailsView extends StatefulWidget {
  const CategoryDetailsView({super.key, required this.selectedCategory});
  final CategoryModelClass selectedCategory;

  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {
  SourcesCubit sourcesCubit = SourcesCubit();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await sourcesCubit.getNewsSources(widget.selectedCategory.categoryName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider.value(value: sourcesCubit)],
      child: BlocBuilder<SourcesCubit, SourcesCubitStates>(
        bloc: sourcesCubit,
        builder: (context, state) {
          switch (state) {
            case SourcesInitialState():
            case SourcesLoadingState():
              return Center(child: CircularProgressIndicator());
            case SourcesFailureState():
              return Center(child: Text('${state.message}'));
            case SourcesSuccessEmptyListState():
              return Center(child: Text('No Data'));
            case SourcesSuccessState():
              return DefaultTabController(
                length: state.sources!.length,
                child: Column(
                  children: [
                    NewsSourcesView(
                      selectedCategory: widget.selectedCategory,
                      sources: state.sources!,
                    ),
                    ArticlesView(sources: state.sources!),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
