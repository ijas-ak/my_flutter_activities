import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 1)
class Student {
  @HiveField(0)
  String name;
  @HiveField(1)
  int age;

  Student({required this.name, required this.age});
}
