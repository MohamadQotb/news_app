import 'package:news_app/features/newsSources/model/sources_model.dart';

sealed class SourcesCubitStates {}

class SourcesInitialState extends SourcesCubitStates {}

class SourcesLoadingState extends SourcesCubitStates {}

class SourcesSuccessState extends SourcesCubitStates {
  final List<SourcesModel>? sources;

  SourcesSuccessState({required this.sources});
}

class SourcesFailureState extends SourcesCubitStates {
  final String? message;

  SourcesFailureState({required this.message});
}

class SourcesSuccessEmptyListState extends SourcesCubitStates {}
