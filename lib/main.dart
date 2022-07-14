import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:user_list/ui/user_view.dart';

import 'bloc_userlist/user_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<UserBloc>(
        create: (context) => UserBloc()..add(UserEventLoad()),
        child: UserView(),
      ),
    );
  }
}
