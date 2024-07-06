import '../../../features/listing/add_listing/view/screens/sub_screens/add_cloths_and_footwear_screen.dart';
import '../../../features/listing/add_listing/view/screens/sub_screens/add_food_and_drink_screen.dart';
import '../../../features/listing/add_listing/view/screens/sub_screens/add_item_screen.dart';
import '../../../features/listing/add_listing/view/screens/sub_screens/add_pet_screen.dart';
import '../../../features/listing/add_listing/view/screens/sub_screens/add_property_screen.dart';
import '../../../features/listing/add_listing/view/screens/sub_screens/add_vehicle_screen.dart';

enum ListingType {
  item('item', 'IT', 'Item', 10, AddItemScreen.routeName),
  clothesAndFoot(
    'clothes-footwear',
    'CF',
    'Clothes Footwear',
    30,
    AddClothsAndFootwearScreen.routeName,
  ),
  vehicles(
    'vehicles',
    'VE',
    'Vehicles',
    20,
    AddVehicleScreen.routeName,
  ),
  foodAndDrinks(
    'food-drinks',
    'FD',
    'Food Drinks',
    10,
    AddFoodAndDrinkScreen.routeName,
  ),
  properties(
    'properties-sale-rent',
    'PR',
    'Properties Sale & Rent',
    50,
    AddPropertyScreen.routeName,
  ),
  pet(
    'pet',
    'PE',
    'Pet',
    20,
    AddPetScreen.routeName,
  );

  const ListingType(
    this.json,
    this.short,
    this.display,
    this.noOdPhotos,
    this.routeName,
  );
  final String json;
  final String short;
  final String display;
  final int noOdPhotos;
  final String routeName;

  static ListingType fromJson(String json) {
    return ListingType.values.firstWhere((ListingType e) => e.json == json);
  }

  static List<ListingType> get list => ListingType.values;
}
