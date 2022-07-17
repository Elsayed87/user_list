import 'package:flutter/material.dart';
import 'package:user_list/ui/widgets.dart';

import '../utility/const.dart';

class UserDetails extends StatelessWidget {
  final String name;
  final String email;
  final Color color;
  const UserDetails(
      {Key? key, required this.email, required this.name, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details', style: kAppBarStyle),
        backgroundColor: Colors.white,
        elevation: 1.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              StackContent(color: color, name: name),
              const SizedBox(
                height: 15,
              ),
              Text(
                name,
                style: kNameStyle,
              ),
              Text(
                email,
                style: kEmailStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


