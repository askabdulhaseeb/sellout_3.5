// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ListingTypeAdapter extends TypeAdapter<ListingType> {
  @override
  final int typeId = 9;

  @override
  ListingType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ListingType.item;
      case 1:
        return ListingType.clothesAndFoot;
      case 2:
        return ListingType.vehicles;
      case 3:
        return ListingType.foodAndDrinks;
      case 4:
        return ListingType.properties;
      case 5:
        return ListingType.pet;
      default:
        return ListingType.item;
    }
  }

  @override
  void write(BinaryWriter writer, ListingType obj) {
    switch (obj) {
      case ListingType.item:
        writer.writeByte(0);
        break;
      case ListingType.clothesAndFoot:
        writer.writeByte(1);
        break;
      case ListingType.vehicles:
        writer.writeByte(2);
        break;
      case ListingType.foodAndDrinks:
        writer.writeByte(3);
        break;
      case ListingType.properties:
        writer.writeByte(4);
        break;
      case ListingType.pet:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListingTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
