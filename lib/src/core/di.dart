import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture_demo/src/core/utils/api_logger.dart';
import 'package:flutter_clean_architecture_demo/src/features/home/data/datasourse/remote/user_remote_data_sourse.dart';
import 'package:flutter_clean_architecture_demo/src/features/home/data/repositories/user_repository_impl.dart';
import 'package:flutter_clean_architecture_demo/src/features/home/domain/repositories/user_repositories.dart';
import 'package:flutter_clean_architecture_demo/src/features/home/domain/usecase/user_usecase.dart';
import 'package:flutter_clean_architecture_demo/src/features/home/presentation/cubit/user_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> injectDependency() async {
  getIt.registerSingleton<Dio>(Dio()..interceptors.add(apiLogger));

  getIt.registerFactory(() => UserCubit(getUserUseCase: getIt()));

  getIt.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(userRemoteDataSource: getIt()));

  getIt.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSource(dio: getIt()));

  getIt.registerLazySingleton(() => GetUserUseCase(userRepository: getIt()));
}
