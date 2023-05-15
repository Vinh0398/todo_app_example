import 'package:to_do_flutter_app/data/models/todo_model.dart';
import 'package:to_do_flutter_app/data/repository/todo_repository.dart';
import 'package:to_do_flutter_app/domain/base_use_case.dart';

class GetTodosDoneUseCase extends BaseUseCase<List<Todo>, void> {
  final TodoRepository repository;

  GetTodosDoneUseCase({required this.repository});

  @override
  Future<List<Todo>> invoke({required void param}) {
    final result = repository.getTodosDone();
    return result;
  }

}
