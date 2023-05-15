import 'package:to_do_flutter_app/data/models/todo_model.dart';
import 'package:to_do_flutter_app/data/repository/local/todo_local_source.dart';

abstract class TodoDataSource {
  Future<void> insertTodo({required Todo todo});

  Stream<List<Todo>> streamTodos();
  Future<List<Todo>> getTodos();
  Future<List<Todo>> getTodosDone();
  Stream<List<Todo>> streamTodosDone();

  Future<void> todoCheck({required int id});
}

class TodoRepository extends TodoDataSource{
  final TodoLocalDataSource localDataSource;

  TodoRepository({required this.localDataSource,});


  @override
  Future<List<Todo>> getTodosDone(){
    return localDataSource.getTodosDone();
  }

  @override
  Future<void> insertTodo({required Todo todo}){
    return localDataSource.insertTodo(todo: todo);
  }

  @override
  Future<void> todoCheck({required int id}) {
    return localDataSource.todoCheck(id: id);
  }

  @override
  Stream<List<Todo>> streamTodos() {
    return localDataSource.streamTodos();
  }

  @override
  Stream<List<Todo>> streamTodosDone() {
    return localDataSource.streamTodosDone();
  }

  @override
  Future<List<Todo>> getTodos() {
    return localDataSource.getTodos();
  }
}