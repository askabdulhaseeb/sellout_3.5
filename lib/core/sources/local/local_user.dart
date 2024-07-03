import 'package:hive_flutter/hive_flutter.dart';

import '../../../features/profile/data/models/user_model.dart';
import '../../utilities/app_strings.dart';
import '../apis/data_state.dart';
export '../../../features/profile/data/models/user_model.dart';

class LocalUser {
  static final String boxTitle = AppStrings.localUsersBox;
  static Box<UserEntity> get _box => Hive.box<UserEntity>(boxTitle);

  static Future<Box<UserEntity>> get openBox async =>
      await Hive.openBox<UserEntity>(boxTitle);

  Future<Box<UserEntity>> refresh() async {
    final bool isOpen = Hive.isBoxOpen(boxTitle);
    if (isOpen) {
      return _box;
    } else {
      return await Hive.openBox<UserEntity>(boxTitle);
    }
  }

  Future<void> save(UserEntity user) async => await _box.put(user.uid, user);
  UserEntity? userEntity(String value) => _box.get(value);

  DataState<UserEntity?> userState(String value) {
    final UserEntity? entity = _box.get(value);
    if (entity != null) {
      return DataSuccess<UserEntity?>(value, entity);
    } else {
      return DataFailer<UserEntity?>(CustomException('Loading...'));
    }
  }
}
