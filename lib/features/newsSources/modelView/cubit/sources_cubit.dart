import 'package:news_app/features/newsSources/model/sources_api.dart';
import 'package:news_app/features/newsSources/model/sources_model.dart';
import 'package:news_app/features/newsSources/modelView/cubit/sources_cubit_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SourcesCubit extends Cubit<SourcesCubitStates> {
  SourcesCubit() : super(SourcesInitialState());
  getNewsSources(String category) async {
    emit(SourcesLoadingState());
    try {
      List<SourcesModel>? sources = await SourcesApi.getNewsSources(category);
      if (sources == null) {
        emit(SourcesSuccessEmptyListState());
      }
      emit(SourcesSuccessState(sources: sources));
    } catch (e) {
      emit(SourcesFailureState(message: e.toString()));
    }
  }
}
