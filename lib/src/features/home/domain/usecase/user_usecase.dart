import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_demo/src/core/error/api_error.dart';
import 'package:flutter_clean_architecture_demo/src/features/home/data/models/user_model.dart';
import 'package:flutter_clean_architecture_demo/src/features/home/domain/repositories/user_repositories.dart';

class GetUserUseCase {
  final UserRepository userRepository;

  GetUserUseCase({required this.userRepository});

  Future<Either<Failure, List<UserModel>>> call() async {
    return await userRepository.getUsers();
  }
}
