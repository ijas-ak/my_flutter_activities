import 'package:hive_flutter/hive_flutter.dart';
part 'person.g.dart';

@HiveType(typeId: 1)
class Person {
  @HiveField(0)
  String name;
  @HiveField(1)
  int age;

  Person({required this.name, required this.age});
}
