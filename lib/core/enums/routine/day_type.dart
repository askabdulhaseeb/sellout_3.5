enum DayType {
  monday('Monday', 'Mon', 'monday', DateTime.monday),
  tuesday('Tuesday', 'Tue', 'tuesday', DateTime.tuesday),
  wednesday('Wednesday', 'Wed', 'wednesday', DateTime.wednesday),
  thursday('Thursday', 'Thu', 'thursday', DateTime.thursday),
  friday('Friday', 'Fri', 'friday', DateTime.friday),
  saturday('Saturday', 'Sat', 'saturday', DateTime.saturday),
  sunday('Sunday', 'Sun', 'sunday', DateTime.sunday);

  const DayType(this.title, this.short, this.json, this.number);
  final String title;
  final String short;
  final String json;
  final int number;

  static DayType? fromJson(String? json) {
    if (json == null) return null;
    for (final DayType item in DayType.values) {
      if (item.json == json) return item;
    }
    return null;
  }

  static List<DayType> get list => DayType.values;
}
