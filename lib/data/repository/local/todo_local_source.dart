import 'package:isar/isar.dart';
import 'package:to_do_flutter_app/data/dao/database/database_service.dart';
import 'package:to_do_flutter_app/data/dao/todo_entity.dart';
import 'package:to_do_flutter_app/data/models/todo_model.dart';
import 'package:to_do_flutter_app/data/repository/todo_repository.dart';

class TodoLocalDataSource extends TodoDataSource {
  final DatabaseService databaseService;

  TodoLocalDataSource({required this.databaseService});

  @override
  Stream<List<Todo>> streamTodos() {
    final res = databaseService.isar.todoEntitys.filter()
        .checkEqualTo(false)
        .watch(fireImmediately: true)
        .asBroadcastStream();
    //final res = getAll.where((element) => element.check == false);
    return res.asyncMap(_mapToTodoStream);
  }
  @override
  Future<List<Todo>> getTodos() async{
    final res = await databaseService.isar.todoEntitys
        .filter()
        .checkEqualTo(false)
        .findAll();
    //final res = getAll.where((element) => element.check == true);
    return res.map(_mapToTodo).toList();
  }


  @override
  Future<void> insertTodo({required Todo todo}) async {
    await databaseService.isar.writeTxn(() async {
      await databaseService.isar.todoEntitys.put(
        TodoEntity(
          title: todo.title,
          subtitle: todo.subtitle,
          check: false,
        ),
      );
    });
  }

  @override
  Future<List<Todo>> getTodosDone() async {
    final res = await databaseService.isar.todoEntitys
        .filter()
        .checkEqualTo(true)
        .findAll();
    //final res = getAll.where((element) => element.check == true);
    return res.map(_mapToTodo).toList();
  }

  @override
  Stream<List<Todo>> streamTodosDone() {
    final res = databaseService.isar.todoEntitys.filter()
        .checkEqualTo(true)
        .watch(fireImmediately: true)
        .asBroadcastStream();
    //final res = getAll.where((element) => element.check == false);
    return res.asyncMap(_mapToTodoStream);
  }


  Todo _mapToTodo(e) => Todo(
        id: e.id,
        title: e.title,
        subtitle: e.subtitle,
        check: e.check,
      );

  @override
  Future<void> todoCheck({required int id}) async {
    await databaseService.isar.todoEntitys.get(id).then((value) async {
      if (value?.check == false) {
        value?.check = true;
        await databaseService.isar.writeTxn(() async {
          await databaseService.isar.todoEntitys.put(value!);
        });
      } else {
        value?.check = false;
        await databaseService.isar.writeTxn(() async {
          await databaseService.isar.todoEntitys.put(value!);
        });
      }
    });
  }

  List<Todo> _mapToTodoStream(List<TodoEntity> event) {
    print("map data ${event.length}");
    return   event.map(_mapToTodo).toList();
  }

}
