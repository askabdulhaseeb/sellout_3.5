import 'package:hive/hive.dart';

import '../../../../features/auth/signin/data/models/current_user_model.dart';
import '../../../utilities/app_strings.dart';

class LocalAuth {
  static final String boxTitle = AppStrings.localAuthBox;
  static Box<CurrentUserEntity> get _box =>
      Hive.box<CurrentUserEntity>(boxTitle);

  static Future<Box<CurrentUserEntity>> get openBox async =>
      await Hive.openBox<CurrentUserEntity>(boxTitle);

  Future<Box<CurrentUserEntity>> refresh() async {
    final bool isOpen = Hive.isBoxOpen(boxTitle);
    if (isOpen) {
      return _box;
    } else {
      return await Hive.openBox<CurrentUserEntity>(boxTitle);
    }
  }

  Future<void> signin(CurrentUserEntity currentUser) async =>
      await _box.put(boxTitle, currentUser);

  static CurrentUserEntity? get currentUser =>
      _box.length == 0 ? null : _box.get(boxTitle);
  static String? get token => currentUser?.token;
  static String? get uid => currentUser?.userId;

  Future<void> signout() async => await _box.clear();
}
