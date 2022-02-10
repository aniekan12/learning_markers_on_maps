import 'package:flutter/material.dart';
import 'package:learningmarkersonmaps/core/model/user_model.dart';

class UserCard extends StatelessWidget {
  final User? user;
  const UserCard({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 10,
      width: MediaQuery.of(context).size.width,
      child: ListTile(
        title: Text(user!.name!,
            style: const TextStyle(fontWeight: FontWeight.w500)),
        leading: CircleAvatar(
          child: Text(user!.name!.substring(0, 1)),
        ),
        subtitle: Text(user!.company!.name!),
      ),
    );
  }
}
