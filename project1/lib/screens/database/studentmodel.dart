import 'package:hive/hive.dart';
part 'studentmodel.g.dart';

@HiveType(typeId: 1)
class Student {
  @HiveField(0)
  String name;
  @HiveField(1)
  int age;
  @HiveField(2)
  dynamic qualification;

  Student({required this.name, required this.age, this.qualification});
}
