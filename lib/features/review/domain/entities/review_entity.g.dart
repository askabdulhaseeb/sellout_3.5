// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReviewEntityAdapter extends TypeAdapter<ReviewEntity> {
  @override
  final int typeId = 2;

  @override
  ReviewEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReviewEntity(
      reviewBy: fields[6] as String,
      createdAt: fields[8] as DateTime?,
      fileUrls: (fields[10] as List).cast<AttachmentEntity>(),
      sellerId: fields[4] as String,
      businessId: fields[5] as String,
      rating: fields[7] as double,
      postId: fields[3] as String,
      comments: (fields[9] as List).cast<dynamic>(),
      text: fields[2] as String,
      reviewId: fields[0] as String,
      title: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ReviewEntity obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.reviewId)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.text)
      ..writeByte(3)
      ..write(obj.postId)
      ..writeByte(4)
      ..write(obj.sellerId)
      ..writeByte(5)
      ..write(obj.businessId)
      ..writeByte(6)
      ..write(obj.reviewBy)
      ..writeByte(7)
      ..write(obj.rating)
      ..writeByte(8)
      ..write(obj.createdAt)
      ..writeByte(9)
      ..write(obj.comments)
      ..writeByte(10)
      ..write(obj.fileUrls);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReviewEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
