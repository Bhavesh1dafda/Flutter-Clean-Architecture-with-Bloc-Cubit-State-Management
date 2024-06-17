import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_demo/src/core/error/api_error.dart';
import 'package:flutter_clean_architecture_demo/src/features/home/data/datasourse/remote/user_remote_data_sourse.dart';
import 'package:flutter_clean_architecture_demo/src/features/home/data/models/user_model.dart';
import 'package:flutter_clean_architecture_demo/src/features/home/domain/repositories/user_repositories.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl({required this.userRemoteDataSource});
  @override
  Future<Either<Failure, List<UserModel>>> getUsers() async {
    try {
      final remoteProducts = await userRemoteDataSource.getUsers();
      return Right(remoteProducts);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
