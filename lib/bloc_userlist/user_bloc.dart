import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../data access layer/user_repository_impl.dart';
import '../models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepositoryImpl _userRepositoryImpl = UserRepositoryImpl();

  UserBloc() : super(UserLoading()) {
    on<UserEvent>(_onFetched);
  }

  void _onFetched(UserEvent event, Emitter<UserState> emit) async {
    if (event is UserEventLoad) {
      emit(UserLoading());
    }
    try {
      List<User> userInfo = await _userRepositoryImpl.fetchData();
      emit(UserLoaded(userDataInfo: userInfo));
    } catch (ex) {
      emit(UserError(message: '$ex'));
    }
  }
}
