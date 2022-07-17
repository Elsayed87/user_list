import 'package:user_list/data%20access%20layer/user_service.dart';

import '../models/user.dart';

abstract class UserList {
  Future<List<User>> fetchData();
}

class UserRepositoryImpl implements UserList {
  UserNetWork service = UserNetWork();

  @override
  Future<List<User>> fetchData() {
    return service.getUser();
  }
}
