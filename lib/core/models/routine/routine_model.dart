import 'dart:convert';

import '../../entities/routine/routine_entity.dart';
import '../../enums/routine/day_type.dart';

class RoutineModel extends RoutineEntity {
  RoutineModel({
    required super.day,
    required super.isOpen,
    required super.closingTime,
    required super.openingTime,
  });

  factory RoutineModel.fromRawJson(String str) =>
      RoutineModel.fromJson(json.decode(str));

  factory RoutineModel.fromJson(Map<String, dynamic> json) => RoutineModel(
        day: DayType.fromJson(json['day']),
        isOpen: json['is_open'],
        closingTime: json['closing_time'],
        openingTime: json['opening_time'],
      );
}
