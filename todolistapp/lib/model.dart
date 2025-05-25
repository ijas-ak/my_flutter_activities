import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 1)
class TodoListApp extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  bool isDone;

  TodoListApp({required this.title, required this.isDone});
}
