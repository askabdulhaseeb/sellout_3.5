import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'features/auth/signin/view/providers/signin_provider.dart';

final List<SingleChildWidget> providers = <SingleChildWidget>[
  // Add your providers here
  ChangeNotifierProvider<SigninProvider>.value(value: SigninProvider()),
];
