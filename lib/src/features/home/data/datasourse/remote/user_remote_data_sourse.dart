import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture_demo/src/core/constant/api_constant.dart';
import 'package:flutter_clean_architecture_demo/src/core/constant/api_endpoint_constant.dart';
import 'package:flutter_clean_architecture_demo/src/features/home/data/models/user_model.dart';

class UserRemoteDataSource {
  final Dio dio;
  UserRemoteDataSource({
    required this.dio,
  });

  Future<List<UserModel>> getUsers() async {
    try {
      var response =
          await dio.get(ApiConstant.baseUrl + ApiEndpointConstant.users);
      List<dynamic> parsedListJson = response.data["data"];
      return parsedListJson.map((e) => UserModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
