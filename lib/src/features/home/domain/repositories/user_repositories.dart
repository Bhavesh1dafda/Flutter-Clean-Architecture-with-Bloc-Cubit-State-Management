import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_demo/src/core/error/api_error.dart';
import 'package:flutter_clean_architecture_demo/src/features/home/data/models/user_model.dart';

abstract class UserRepository {
  Future<Either<Failure, List<UserModel>>> getUsers();
}
