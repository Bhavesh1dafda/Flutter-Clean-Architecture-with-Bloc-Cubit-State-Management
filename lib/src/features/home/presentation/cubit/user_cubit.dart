import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture_demo/src/features/home/data/models/user_model.dart';
import 'package:flutter_clean_architecture_demo/src/features/home/domain/usecase/user_usecase.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetUserUseCase getUserUseCase;
  UserCubit({required this.getUserUseCase}) : super(UserInitial());

  getUser() async {
    emit(UserLoading());
    var data = await getUserUseCase.call();
    data.fold((error) {
      emit(UserError(errorMsg: error.errorMessage));
    }, (success) {
      emit(UserLoaded(userModel: success));
    });
  }
}
