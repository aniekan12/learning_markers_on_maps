import 'package:learningmarkersonmaps/core/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final providerRegistrar = <SingleChildWidget>[
  ChangeNotifierProvider(create: (_) => UserViewModel()),
];
