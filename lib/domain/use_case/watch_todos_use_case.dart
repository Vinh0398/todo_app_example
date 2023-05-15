
import 'package:to_do_flutter_app/data/models/todo_model.dart';
import 'package:to_do_flutter_app/data/repository/todo_repository.dart';
import 'package:to_do_flutter_app/domain/base_use_case.dart';

class WatchTodosUseCase extends StreamUseCase<List<Todo>, void> {
  final TodoRepository repository;

  WatchTodosUseCase({required this.repository});

  @override
  Stream<List<Todo>> invoke({required void param}) {
    return repository.streamTodos();
  }
}
