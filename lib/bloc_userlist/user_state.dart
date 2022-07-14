part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}
class UserLoading extends UserState{
  @override

  List<Object?> get props => [];
}

class UserLoaded extends UserState {
  final List<User> userDataInfo;
  UserLoaded({required this.userDataInfo});

  @override
  List<Object?> get props => [];
}

class UserError extends UserState {
  final String message;
  UserError({required this.message});

  @override
  List<Object?> get props => [];
}

class UserNavigate extends UserState {
  final List<User> userDataInfo;
  UserNavigate({required this.userDataInfo});

  @override
  List<Object?> get props => [];
}