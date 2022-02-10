import 'package:flutter/material.dart';
import 'package:learningmarkersonmaps/core/services/provider/provider_registrar.dart';
import 'package:provider/provider.dart';

import 'pages/display_user_view.dart';

void main() {
  runApp(MultiProvider(
    providers: providerRegistrar,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DisplayUserView(),
    );
  }
}
