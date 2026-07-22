import 'package:uuid/uuid.dart';

class Recommendation {
  late String id;
  final String text;

  Recommendation({String? id, required this.text}) : id = id ?? Uuid().v4();
}
