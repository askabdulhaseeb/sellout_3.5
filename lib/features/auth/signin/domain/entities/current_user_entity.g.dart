// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_user_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrentUserEntityAdapter extends TypeAdapter<CurrentUserEntity> {
  @override
  final int typeId = 0;

  @override
  CurrentUserEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CurrentUserEntity(
      message: fields[0] as String,
      email: fields[1] as String,
      token: fields[2] as String,
      userName: fields[3] as String,
      userId: fields[4] as String,
      fullName: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CurrentUserEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.message)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.token)
      ..writeByte(3)
      ..write(obj.userName)
      ..writeByte(4)
      ..write(obj.userId)
      ..writeByte(5)
      ..write(obj.fullName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrentUserEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
