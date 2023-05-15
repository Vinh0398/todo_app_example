import 'package:flutter/material.dart';
import 'package:to_do_flutter_app/cons/colors.dart';
import 'package:to_do_flutter_app/cons/dimens.dart';
import 'package:to_do_flutter_app/data/models/todo_model.dart';

class TodoItemWidget extends StatefulWidget {
  final Todo todo;
  final Function(bool)? onPressed;

  const TodoItemWidget({Key? key, required this.todo, this.onPressed})
      : super(key: key);

  @override
  State<TodoItemWidget> createState() => _TodoItemWidgetState();
}

class _TodoItemWidgetState extends State<TodoItemWidget> {
  bool _isChecked = false;
  @override
  void initState() {
    _isChecked = widget.todo.check;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.itemTodoColor,
      margin: const EdgeInsets.symmetric(vertical: Dimens.size19),
      elevation: 4,
      shape: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(
          Radius.circular(Dimens.size15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Dimens.size11,
          horizontal: Dimens.size16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: _todoDetail(
                title: widget.todo.title,
                subTitle: widget.todo.subtitle,
              ),
            ),
            _todoCheckBox(
              isCheck: widget.todo.check,
              onPressed: widget.onPressed,
            ),
          ],
        ),
      ),
    );
  }

  Widget _todoDetail({required String title, required String subTitle}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _todoTitle(title: title),
        _todoSubtitle(subTitle: subTitle),
      ],
    );
  }

  Widget _todoCheckBox({required bool isCheck, Function(bool)? onPressed}) {
    return Transform.scale(
      scale: 1.5,
      child: Checkbox(
        value: _isChecked,
        checkColor: AppColors.textTodoColor,
        activeColor: AppColors.itemTodoColor,
        side: const BorderSide(
          color: AppColors.textTodoColor,
          width: Dimens.size3,
        ),
        onChanged: (value) {
          onPressed?.call(value ?? false);
          setState(() {
            _isChecked = value??false;
          });
        },
      ),
    );
   /* if (isCheck == false) {
      return InkWell(
        onTap: onPressed,
        child: const SizedBox(
          width: Dimens.size45,
          height: Dimens.size45,
          child: Icon(
            Icons.check_box_outline_blank,
            color: AppColors.textTodoColor,
            size: Dimens.size45,
          ),
        ),
      );
    }
    return InkWell(
      onTap: onPressed,
      child: const SizedBox(
        width: Dimens.size45,
        height: Dimens.size45,
        child: Icon(
          Icons.check_box_outlined,
          color: AppColors.textTodoColor,
          size: Dimens.size30,
        ),
      ),
    );*/
  }

  Widget _todoTitle({required String title}) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: Dimens.size24,
        color: AppColors.textTodoColor,
      ),
    );
  }

  Widget _todoSubtitle({required String subTitle}) {
    return Text(
      subTitle,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: Dimens.size16,
        color: AppColors.subTextTodoColor,
      ),
    );
  }
}
