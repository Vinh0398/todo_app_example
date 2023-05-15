import 'package:to_do_flutter_app/data/models/todo_model.dart';
import 'package:to_do_flutter_app/data/repository/todo_repository.dart';
import 'package:to_do_flutter_app/domain/base_use_case.dart';

class GetTodosUseCase extends BaseUseCase<List<Todo>, void> {
  final TodoRepository repository;

  GetTodosUseCase({required this.repository});

  @override
  Future<List<Todo>> invoke({required void param}) {
    final result = repository.getTodos();
    return result;
  }

}
