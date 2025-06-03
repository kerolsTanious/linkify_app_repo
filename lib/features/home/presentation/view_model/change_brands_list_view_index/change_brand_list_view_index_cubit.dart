import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkify_app/features/home/presentation/view_model/change_brands_list_view_index/change_brand_list_view_index_state.dart';

class ChangeBrandListViewIndexCubit
    extends Cubit<ChangeBrandListViewIndexState> {
  ChangeBrandListViewIndexCubit() : super(ChangeBrandListViewIndexInitial());

  int index = 0;

  void changeIndex({required int newIndex}) {
    index = newIndex;
    emit(ChangeBrandListViewIndexSuccess(newIndex: newIndex));
  }
}
