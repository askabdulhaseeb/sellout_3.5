import 'package:hive/hive.dart';
part 'user_entity.g.dart';

@HiveType(typeId: 1)
class UserEntity {
  const UserEntity({
    required this.mobileNo,
    required this.timestamp,
    required this.fullName,
    required this.email,
    required this.uid,
    required this.interest,
    required this.lastLoginTime,
    required this.date,
    required this.token,
    required this.profilePic,
    required this.userName,
  });

  @HiveField(0)
  final String uid;
  @HiveField(1)
  final DateTime timestamp;
  @HiveField(2)
  final String fullName;
  @HiveField(3)
  final String email;
  @HiveField(4)
  final String mobileNo;
  @HiveField(5)
  final List<dynamic> interest;
  @HiveField(6)
  final String lastLoginTime;
  @HiveField(7)
  final DateTime date;
  @HiveField(8)
  final String token;
  @HiveField(9)
  final String profilePic;
  @HiveField(10)
  final String userName;
}
