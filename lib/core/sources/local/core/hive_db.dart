import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../features/auth/signin/domain/entities/current_user_entity.dart';
import '../../../../features/profile/data/models/user_model.dart';
import '../auth/local_auth.dart';
import '../local_user.dart';

class HiveDB {
  static Future<void> init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    await Hive.initFlutter();

    // Hive
    Hive.registerAdapter(CurrentUserEntityAdapter()); // 0
    Hive.registerAdapter(UserEntityAdapter()); // 1

    // Hive box Open
    await refresh();
  }

  static Future<void> refresh() async {
    await LocalAuth().refresh();
    await LocalUser().refresh();
  }

  Future<void> signout() async => await LocalAuth().signout();
}
