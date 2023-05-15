
import 'package:provider/provider.dart';
import 'package:to_do_flutter_app/domain/use_case/check_todo_use_case.dart';
import 'package:to_do_flutter_app/domain/use_case/get_todos_done_use_case.dart';
import 'package:to_do_flutter_app/domain/use_case/get_todos_use_case.dart';
import 'package:to_do_flutter_app/domain/use_case/watch_todos_done_use_case.dart';
import 'package:to_do_flutter_app/domain/use_case/watch_todos_use_case.dart';

final todoUseCaseProvider = [
  Provider<GetTodosUseCase>(
    create: (context) => GetTodosUseCase(
      repository: context.read(),
    ),
  ),
  Provider<GetTodosDoneUseCase>(
    create: (context) => GetTodosDoneUseCase(
      repository: context.read(),
    ),
  ),
  Provider<CheckTodoUseCase>(
    create: (context) => CheckTodoUseCase(
      repository: context.read(),
    ),
  ),
  Provider<WatchTodosDoneUseCase>(
    create: (context) => WatchTodosDoneUseCase(
      repository: context.read(),
    ),
  ),
  Provider<WatchTodosUseCase>(
    create: (context) => WatchTodosUseCase(
      repository: context.read(),
    ),
  ),
];
