part of 'user_cubit.dart';

@immutable
sealed class UserState extends Equatable {
  const UserState();
  @override
  List<Object?> get props => [];
}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserError extends UserState {
  final String errorMsg;

  const UserError({required this.errorMsg});
  @override
  List<Object?> get props => [errorMsg];
}

final class UserLoaded extends UserState {
  final List<UserModel> userModel;

  const UserLoaded({required this.userModel});
  @override
  List<Object?> get props => [userModel];
}
