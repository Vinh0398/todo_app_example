import 'package:to_do_flutter_app/data/repository/todo_repository.dart';
import 'package:to_do_flutter_app/domain/base_use_case.dart';

class CheckTodoUseCase extends BaseUseCase<void,int>{
  final TodoRepository repository;

  CheckTodoUseCase({required this.repository});

  @override
  Future<void> invoke({required int param}) {
    return repository.todoCheck(id: param);
  }
}