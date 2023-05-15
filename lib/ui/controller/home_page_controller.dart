import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_flutter_app/data/models/todo_model.dart';
import 'package:to_do_flutter_app/domain/use_case/check_todo_use_case.dart';
import 'package:to_do_flutter_app/domain/use_case/watch_todos_done_use_case.dart';
import 'package:to_do_flutter_app/domain/use_case/watch_todos_use_case.dart';

class HomePageState {
  final List<Todo> listTodo;
  final List<Todo> listTodoDone;

  HomePageState({
    this.listTodo = const [],
    this.listTodoDone = const [],
  });
}

class HomePageController extends Cubit<HomePageState> {
  final WatchTodosUseCase _watchTodosUseCase;
  final WatchTodosDoneUseCase _watchTodosDoneUseCase;
  final CheckTodoUseCase checkTodoUseCase;

  StreamSubscription<List<Todo>>? _todoSubscription;

  StreamSubscription<List<Todo>>? _todoDoneSubscription;

  HomePageController({
    required WatchTodosUseCase getTodosUseCase,
    required WatchTodosDoneUseCase getTodosDoneUseCase,
    required this.checkTodoUseCase,
  })  : _watchTodosDoneUseCase = getTodosDoneUseCase,
        _watchTodosUseCase = getTodosUseCase,
        super(HomePageState());

  Future<void> fetchTodo() async {
    _todoSubscription = _watchTodosUseCase.invoke(param: null).listen((event) {
      emit(HomePageState(
        listTodo: event,
        listTodoDone: state.listTodoDone,
      ));
    });
  }

  Future<void> fetchTodoDone() async {
    _todoDoneSubscription =
        _watchTodosDoneUseCase.invoke(param: null).listen((event) {
      emit(HomePageState(
        listTodo: state.listTodo,
        listTodoDone: event,
      ));
    });
  }

  Future<void> checkTodo(int id) async {
    final result = await checkTodoUseCase.invoke(param: id);
    return result;
  }

  @override
  Future<void> close() {
    _todoDoneSubscription?.cancel();
    _todoSubscription?.cancel();
    return super.close();
  }
}
