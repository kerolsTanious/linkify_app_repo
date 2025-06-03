import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkify_app/features/home/presentation/view_model/change_brand_screen_body/change_brand_screen_body_state.dart';

class ChangeBrandScreenBodyCubit extends Cubit<ChangeBrandScreenBodyState> {
  ChangeBrandScreenBodyCubit() : super(ChangeBrandScreenBodyInitial());

  int index = 0;

  void changeIndex({required int newIndex}) {
    index = newIndex;
    emit(ChangeBrandScreenBodySuccess(newIndex: index));
  }
}
