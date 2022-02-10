import 'package:flutter/material.dart';
import 'package:learningmarkersonmaps/core/model/user_model.dart';
import 'package:learningmarkersonmaps/core/viewmodel/user_view_model.dart';
import 'package:learningmarkersonmaps/pages/shared/user_card.dart';
import 'package:provider/provider.dart';

class DisplayUserView extends StatefulWidget {
  const DisplayUserView({Key? key}) : super(key: key);

  @override
  _DisplayUserViewState createState() => _DisplayUserViewState();
}

class _DisplayUserViewState extends State<DisplayUserView> {
  UserViewModel? vm;
  Future? usersFuture;

  @override
  void didChangeDependencies() {
    vm = Provider.of<UserViewModel>(context);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    usersFuture =
        Provider.of<UserViewModel>(context, listen: false).getUsersAndDisplay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder(
            future: usersFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                errorWidget();
              }
              return ListView.builder(
                  itemCount: vm!.userList.length,
                  itemBuilder: (_, index) {
                    User user = vm!.userList[index];
                    return UserCard(user: user);
                  });
            }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () {},
        child: const Icon(Icons.map),
      ),
    );
  }

  Widget errorWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Text(
          "An error occurred. Tap to reload",
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
