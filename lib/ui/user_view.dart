import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/ui/user_details.dart';

import '../bloc_userlist/user_bloc.dart';
import '../models/user.dart';
import '../utility/const.dart';

class UserView extends StatelessWidget {
  final List<Color> colors = <Color>[
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.blueAccent,
    Colors.pinkAccent,
    Colors.yellow,
    Colors.cyanAccent,
    Colors.teal
  ];

  UserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //User user = state.userDataInfo[index];
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            elevation: 1.0,
            title: const Text('User List', style: kAppBarStyle),
            backgroundColor: Colors.white),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoaded) {
              return ListView.builder(
                  itemCount: state.userDataInfo.length,
                  itemBuilder: (context, index) {
                    User user = state.userDataInfo[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 10, left: 10, right: 10, bottom: 5),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: ListTile(
                          leading: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              CircleAvatar(
                                backgroundColor: colors[index],
                                radius: 45.0,
                                child: Text(
                                  //user.name.characters.first.toUpperCase(),
                                  user.name
                                      .trim()
                                      .split(' ')
                                      .map((e) => e[0])
                                      .take(2)
                                      .join(),
                                  style: kCharUserStyle,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: CircleAvatar(
                                  radius: 12.0,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.male,
                                    color: Colors.black,
                                    size: 9,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          title: Text(user.name.toString(), style: kNameStyle),
                          subtitle: Text(
                            user.email.toString(),
                            style: kEmailStyle,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => UserDetails(
                                  name: user.name.toString(),
                                  email: user.email.toString(),
                                  color: colors[index],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  });
            } else if (state is UserNavigate) {}
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
