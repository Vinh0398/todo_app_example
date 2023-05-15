
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_flutter_app/cons/colors.dart';
import 'package:to_do_flutter_app/cons/dimens.dart';
import 'package:to_do_flutter_app/data/dao/database/database_service.dart';
import 'package:to_do_flutter_app/data/models/todo_model.dart';
import 'package:to_do_flutter_app/data/repository/local/todo_local_source.dart';
import 'package:to_do_flutter_app/data/repository/todo_repository.dart';
import 'package:to_do_flutter_app/ui/add_todo_widget/add_todo_btn_widget.dart';
import 'package:to_do_flutter_app/ui/add_todo_widget/input_text_widget.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({Key? key}) : super(key: key);

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  late TextEditingController titleInputController;
  late TextEditingController subtitleInputController;
  late Todo addTodo;
  late TodoRepository repository;

  @override
  void initState() {
    super.initState();
    titleInputController = TextEditingController();
    subtitleInputController = TextEditingController();
    repository = TodoRepository(
        localDataSource:
            TodoLocalDataSource(databaseService: DatabaseService()));
  }

  @override
  void dispose() {
    titleInputController.dispose();
    subtitleInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.tabViewColor,
        shape: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(Dimens.size30),
            bottomRight: Radius.circular(Dimens.size30),
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Add Todo",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: Dimens.size30,
            color: AppColors.textTodoColor,
          ),
        ),
      ),
      body: _buildBodyPage(),
    );
  }

  Widget _buildBodyPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.size8),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InputTextWidget(
            controller: titleInputController,
            inputTitle: "Todo Title",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Dimens.size16),
            child: InputTextWidget(
              controller: subtitleInputController,
              inputTitle: "Todo Sub Title",
            ),
          ),
          AddTodoBtnWidget(
            onPressed: _onPressed,
          ),
        ],
      ),
    );
  }

  void _onPressed() {
    if (titleInputController.text.isEmpty ||
        subtitleInputController.text.isEmpty) {
      return;
    }
    addTodo = Todo(
      id: -1,
      title: titleInputController.text,
      subtitle: subtitleInputController.text,
      check: false,
    );
    setState(() {
      repository.insertTodo(todo: addTodo);
      titleInputController.clear();
      subtitleInputController.clear();
    });
    context.pop();
  }
}
