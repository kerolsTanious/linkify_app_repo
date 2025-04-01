import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkify_app/core/dependency_injection.dart';
import 'package:linkify_app/core/utils/color_manager.dart';
import 'package:linkify_app/features/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:linkify_app/features/auth/presentation/view/widgets/login_body.dart';
import 'package:linkify_app/features/auth/presentation/view_model/login_cubit/login_cubit.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => LoginCubit(authRepo: getIt.get<AuthRepoImpl>()),
        child: const Scaffold(
          backgroundColor: ColorManager.mainColor,
          body: LoginBody(),
        ),
      ),
    );
  }
}
