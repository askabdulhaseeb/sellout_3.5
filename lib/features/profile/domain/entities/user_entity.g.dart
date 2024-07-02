// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserEntityAdapter extends TypeAdapter<UserEntity> {
  @override
  final int typeId = 1;

  @override
  UserEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserEntity(
      mobileNo: fields[4] as String,
      timestamp: fields[1] as DateTime,
      fullName: fields[2] as String,
      email: fields[3] as String,
      uid: fields[0] as String,
      interest: (fields[5] as List).cast<dynamic>(),
      lastLoginTime: fields[6] as String,
      date: fields[7] as DateTime,
      token: fields[8] as String,
      profilePic: fields[9] as String,
      userName: fields[10] as String,
      ratings: fields[11] == null ? [] : (fields[11] as List).cast<double>(),
    );
  }

  @override
  void write(BinaryWriter writer, UserEntity obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.timestamp)
      ..writeByte(2)
      ..write(obj.fullName)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.mobileNo)
      ..writeByte(5)
      ..write(obj.interest)
      ..writeByte(6)
      ..write(obj.lastLoginTime)
      ..writeByte(7)
      ..write(obj.date)
      ..writeByte(8)
      ..write(obj.token)
      ..writeByte(9)
      ..write(obj.profilePic)
      ..writeByte(10)
      ..write(obj.userName)
      ..writeByte(11)
      ..write(obj.ratings);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
