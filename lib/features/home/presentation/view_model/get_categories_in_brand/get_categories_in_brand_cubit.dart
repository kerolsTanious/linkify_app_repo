import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_categories_in_brand/get_categories_in_brand_state.dart';

class GetCategoriesInBrandCubit extends Cubit<GetCategoriesInBrandState> {
  GetCategoriesInBrandCubit() : super(GetCategoriesInBrandInitial());

  bool selected = false;

  void selectBrand({required bool isSelected}) {
    selected = isSelected;
    emit(GetCategoriesInBrandSuccess(isSelected: selected));
  }
}
