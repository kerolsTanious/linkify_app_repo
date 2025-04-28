import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkify_app/core/dependency_injection.dart';
import 'package:linkify_app/features/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:linkify_app/features/auth/presentation/view/widgets/reset_password_body.dart';
import 'package:linkify_app/features/auth/presentation/view_model/reset_password_cubit.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) =>
            ResetPasswordCubit(authRepo: getIt.get<AuthRepoImpl>()),
        child: const Scaffold(
          body: ResetPasswordBody(),
        ),
      ),
    );
  }
}
