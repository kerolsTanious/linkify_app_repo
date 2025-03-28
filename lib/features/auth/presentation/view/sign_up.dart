import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkify_app/core/dependency_injection.dart';
import 'package:linkify_app/core/utils/color_manager.dart';
import 'package:linkify_app/features/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:linkify_app/features/auth/presentation/view/widgets/sign_up_screen_body.dart';
import 'package:linkify_app/features/auth/presentation/view_model/sign_up_cubit/sign_up_cubit.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => SignUpCubit(
          signUpRepo: getIt.get<AuthRepoImpl>(),
        ),
        child: const Scaffold(
          backgroundColor: ColorManager.mainColor,
          body: SignUpScreenBody(),
        ),
      ),
    );
  }
}
