import 'package:hive/hive.dart';
part 'listing_type.g.dart';

@HiveType(typeId: 9)
enum ListingType {
  @HiveField(0)
  item('item', 'IT', 'Item', 10),
  @HiveField(1)
  clothesAndFoot('cloth-foot', 'CF', 'Clothes Footwear', 30),
  @HiveField(2)
  vehicles('vehicles', 'VE', 'Vehicles', 20),
  @HiveField(3)
  foodAndDrinks('food-drinks', 'FD', 'Food Drinks', 10),
  @HiveField(4)
  properties('properties-sale-rent', 'PR', 'Properties Sale & Rent', 50),
  @HiveField(5)
  pet('pet', 'PE', 'Pet', 20);

  const ListingType(this.json, this.short, this.display, this.noOdPhotos);
  final String json;
  final String short;
  final String display;
  final int noOdPhotos;

  static ListingType fromJson(String json) {
    print('ListingType.fromJson: $json');
    return ListingType.values.firstWhere((ListingType e) => e.json == json);
  }

  static List<ListingType> get list => ListingType.values;
}
