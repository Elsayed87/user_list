import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:user_list/models/user.dart';

import 'models/users_model.dart';

const url = 'https://gorest.co.in/public/v1/users?page=1';

class UserNetWork {
  Future<List<User>> getUser() async {
    http.Response response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        String body = response.body;
        var jsonData = jsonDecode(body);
        Users users = Users.fromJson(jsonData);
        List<User> userInfo = users.users.map((e) => User.fromJson(e)).toList();
       // print(userInfo);
        return userInfo;
      }
    } catch (e) {
      throw Exception('failed to load user data!');
    }
    return  getUser();
  }

}
