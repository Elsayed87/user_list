import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/user.dart';
import '../data access layer/user_service.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserNetWork _userNetWork = UserNetWork();

  UserBloc() : super(UserLoading()) {
    on<UserEvent>((event, emit) async {
      if (event is UserEventLoad) {
        emit(UserLoading());
        try {
          List<User> userInfo = await _userNetWork.getUser();
          emit(UserLoaded(userDataInfo: userInfo));
        } catch (ex) {
          emit(UserError(message: '$ex'));
        }
      }else if(event is UserEventNavigate){
        emit(UserLoading());
        try {
          List<User> userInfo = await _userNetWork.getUser();
          emit(UserNavigate(userDataInfo: userInfo));
        } catch (ex) {
          emit(UserError(message: '$ex'));
        }

      }
    });
  }
}
