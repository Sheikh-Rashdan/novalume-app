import 'package:uuid/uuid.dart';

class Appliance {
  late String id;
  final String name;
  double powerKwh;

  Appliance({String? id, required this.name, required this.powerKwh})
    : assert(powerKwh >= 0),
      id = id ?? Uuid().v4();
}
