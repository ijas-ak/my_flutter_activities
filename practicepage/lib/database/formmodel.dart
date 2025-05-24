import 'package:hive/hive.dart';
part 'formmodel.g.dart';

@HiveType(typeId: 1)
class MyForm {
  @HiveField(0)
  String username;
  @HiveField(1)
  int userage;
  @HiveField(2)
  int phoneNumber;

  MyForm({
    required this.username,
    required this.userage,
    required this.phoneNumber,
  });
}
