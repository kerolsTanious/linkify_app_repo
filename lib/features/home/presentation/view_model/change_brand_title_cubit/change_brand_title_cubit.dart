import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkify_app/features/home/presentation/view_model/change_brand_title_cubit/change_brand_title_state.dart';

class ChangeBrandTitleCubit extends Cubit<ChangeBrandTitleState> {
  ChangeBrandTitleCubit() : super(ChangeBrandTitleInitial());

  late String brandName;

  void changeBrandName({required String newBrandName}) {
    brandName = newBrandName;
    emit(ChangeBrandTitleSuccess(brandName: brandName));
  }
}
