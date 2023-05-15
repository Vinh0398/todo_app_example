import 'package:flutter/material.dart';
import 'package:to_do_flutter_app/cons/colors.dart';
import 'package:to_do_flutter_app/cons/dimens.dart';

class AddTodoBtnWidget extends StatelessWidget {
  final Function()? onPressed;

  const AddTodoBtnWidget({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: AppColors.textTodoColor,
      elevation: 4,
      height: Dimens.size60,
      shape: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(Dimens.size16))),
      child: const Center(
        child: Text(
          "Add Todo",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Dimens.size24,
              color: AppColors.titleBtnColor),
        ),
      ),
    );
  }
}
