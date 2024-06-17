import 'package:flutter_clean_architecture_demo/src/features/home/data/models/user_model.dart';

class UserResponseModel {
  late String message;
  dynamic data;

  UserResponseModel({required this.message, this.data});

  UserResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data;
    }
    return data;
  }
}
