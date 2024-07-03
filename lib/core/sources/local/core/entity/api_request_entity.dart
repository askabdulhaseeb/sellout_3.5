import 'package:hive/hive.dart';

import '../local_request_history.dart';
part 'api_request_entity.g.dart';

@HiveType(typeId: 3)
class ApiRequestEntity {
  ApiRequestEntity({required this.url, this.lastRequest});

  @HiveField(0)
  final String url;
  @HiveField(1)
  DateTime? lastRequest;

  bool timesAgo(Duration duration) =>
      lastRequest != null && DateTime.now().difference(lastRequest!) > duration;

  Future<void> updateLastRequest() async {
    lastRequest = DateTime.now();
    LocalRequestHistory().save(this);
  }
}
