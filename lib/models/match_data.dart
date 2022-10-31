import 'package:hive_flutter/hive_flutter.dart';
part 'match_data.g.dart';

@HiveType(typeId: 2)
class GlobalMatchData extends HiveObject {
  @HiveField(0)
  final String matchId;
  GlobalMatchData({required this.matchId});
}
