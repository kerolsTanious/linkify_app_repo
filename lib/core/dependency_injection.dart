import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:linkify_app/core/api/api_manager.dart';
import 'package:linkify_app/features/auth/data/repo_impl/sign_up_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiManager>(
    ApiManager(dio: Dio()),
  );
  getIt.registerSingleton<SignUpRepoImpl>(
    SignUpRepoImpl(
      apiManager: getIt.get<ApiManager>(),
    ),
  );
}
