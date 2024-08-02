import 'package:hive/hive.dart';
part 'listing_type.g.dart';

@HiveType(typeId: 9)
enum ListingType {
  @HiveField(0)
  item('items', 'IT', 'Item', 10, <String>['items']),
  @HiveField(1)
  clothesAndFoot('cloth-foot', 'CF', 'Clothes Footwear', 30,
      <String>['clothes', 'footwear']),
  @HiveField(2)
  vehicles('vehicles', 'VE', 'Vehicles', 20, <String>['vehicles']),
  @HiveField(3)
  foodAndDrinks('food-drink', 'FD', 'Food Drinks', 10, <String>['food-drinks']),
  @HiveField(4)
  properties(
      'property', 'PR', 'Properties Sale & Rent', 50, <String>['property']),
  @HiveField(5)
  pet('pets', 'PE', 'Pet', 20, <String>['pets']),
  ;

  const ListingType(
    this.json,
    this.short,
    this.display,
    this.noOdPhotos,
    this.cid,
  );
  final String json;
  final String short;
  final String display;
  final int noOdPhotos;
  final List<String> cid;

  static ListingType fromJson(String json) {
    return ListingType.values
        .firstWhere((ListingType e) => e.cid.contains(json));
  }

  static List<ListingType> get list => ListingType.values;
}
