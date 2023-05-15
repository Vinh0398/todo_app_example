
import 'package:provider/provider.dart';
import 'package:to_do_flutter_app/data/repository/local/todo_local_source.dart';
import 'package:to_do_flutter_app/data/repository/todo_repository.dart';

final todoRepositoryProviders = [
  Provider<TodoLocalDataSource>(
    create: (context) => TodoLocalDataSource(
      databaseService: context.read(),
    ),
  ),
  Provider<TodoRepository>(
    create: (context) => TodoRepository(
      localDataSource: context.read<TodoLocalDataSource>(),
    ),
  ),
];
