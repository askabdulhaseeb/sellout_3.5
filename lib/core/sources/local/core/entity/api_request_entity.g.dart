// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_request_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ApiRequestEntityAdapter extends TypeAdapter<ApiRequestEntity> {
  @override
  final int typeId = 3;

  @override
  ApiRequestEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ApiRequestEntity(
      url: fields[0] as String,
      lastRequest: fields[1] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, ApiRequestEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.url)
      ..writeByte(1)
      ..write(obj.lastRequest);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApiRequestEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
