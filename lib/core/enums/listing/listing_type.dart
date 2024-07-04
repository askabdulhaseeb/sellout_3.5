enum ListingType {
  item('item', 'IT', 'Item', 10),
  clothesAndFoot('clothes-footwear', 'CF', 'Clothes Footwear', 30),
  vehicles('vehicles', 'VE', 'Vehicles', 20),
  foodAndDrinks('food-drinks', 'FD', 'Food Drinks', 10),
  properties('properties-sale-rent', 'PR', 'Properties Sale & Rent', 50),
  services('services', 'SE', 'Services', 10),
  pet('pet', 'PE', 'Pet', 20);

  const ListingType(this.json, this.short, this.display, this.noOdPhotos);
  final String json;
  final String short;
  final String display;
  final int noOdPhotos;
}
