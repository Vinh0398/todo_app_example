import 'package:isar/isar.dart';
import 'package:to_do_flutter_app/data/models/todo_model.dart';

part 'todo_entity.g.dart';
@collection
class TodoEntity {
   Id? id;
   String title;
   String subtitle;
   bool check;

  TodoEntity({
    this.id,
    required this.title,
    required this.subtitle,
    required this.check,
  });

  Todo toTodo() {
    return Todo(
      id: id!,
      title: title,
      subtitle: subtitle,
      check: check,
    );
  }
}
