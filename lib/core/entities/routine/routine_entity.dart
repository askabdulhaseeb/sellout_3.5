import '../../enums/routine/day_type.dart';

class RoutineEntity {
  const RoutineEntity({
    required this.day,
    required this.isOpen,
    required this.closingTime,
    required this.openingTime,
  });
  
  final DayType day;
  final bool isOpen;
  final String closingTime;
  final String openingTime;
}
