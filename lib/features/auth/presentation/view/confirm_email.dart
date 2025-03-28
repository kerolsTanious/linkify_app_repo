import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkify_app/core/dependency_injection.dart';
import 'package:linkify_app/features/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:linkify_app/features/auth/presentation/view/widgets/confirm_email_body.dart';
import 'package:linkify_app/features/auth/presentation/view_model/confirm_email_cubit/confirm_email_cubit.dart';

class ConfirmEmail extends StatelessWidget {
  const ConfirmEmail({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) =>
            ConfirmEmailCubit(authRepo: getIt.get<AuthRepoImpl>()),
        child: Scaffold(
          body: ConfirmEmailBody(
            email: email,
          ),
        ),
      ),
    );
  }
}
