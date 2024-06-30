import 'package:hive/hive.dart';
part 'current_user_entity.g.dart';

@HiveType(typeId: 0)
class CurrentUserEntity {
  CurrentUserEntity({
    required this.message,
    required this.email,
    required this.token,
    required this.userName,
    required this.userId,
    required this.fullName,
  });

  @HiveField(0)
  final String message;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String token;
  @HiveField(3)
  final String userName;
  @HiveField(4)
  final String userId;
  @HiveField(5)
  final String fullName;
}
