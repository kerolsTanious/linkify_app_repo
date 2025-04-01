import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkify_app/core/dependency_injection.dart';
import 'package:linkify_app/features/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:linkify_app/features/auth/presentation/view/widgets/forget_password_body.dart';
import 'package:linkify_app/features/auth/presentation/view_model/forget_cubit/forget_password_cubit.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) =>
            ForgetPasswordCubit(authRepo: getIt.get<AuthRepoImpl>()),
        child: const Scaffold(
          body: ForgetPasswordBody(),
        ),
      ),
    );
  }
}
