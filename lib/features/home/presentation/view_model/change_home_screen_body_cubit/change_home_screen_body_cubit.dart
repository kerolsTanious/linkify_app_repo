import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkify_app/features/home/presentation/view_model/change_home_screen_body_cubit/change_home_screen_body_state.dart';

class ChangeHomeScreenBodyCubit extends Cubit<ChangeHomeScreenBodyState> {
  ChangeHomeScreenBodyCubit() : super(ChangeHomeScreenBodyInitial());

  int currentIndex = 0;

  void changeHomeScreenBody({required int newIndex}) {
    currentIndex = newIndex;
    emit(ChangeHomeScreenBodySuccess());
  }
}
