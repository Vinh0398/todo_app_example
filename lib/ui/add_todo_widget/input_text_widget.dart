import 'package:flutter/material.dart';
import 'package:to_do_flutter_app/cons/colors.dart';
import 'package:to_do_flutter_app/cons/dimens.dart';

class InputTextWidget extends StatelessWidget {
  final TextEditingController controller;
  final String inputTitle;

  const InputTextWidget(
      {Key? key, required this.controller, required this.inputTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: AppColors.itemTodoColor,
      shape: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(Dimens.size16))),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: Dimens.size16, horizontal: Dimens.size16),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: inputTitle,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Dimens.size20,
              color: AppColors.subTextTodoColor,
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                width: Dimens.size3,
                color: AppColors.textTodoColor,
              ),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                width: Dimens.size3,
                color: AppColors.textTodoColor,
              ),
            ),
          ),
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: Dimens.size16,
            color: AppColors.textTodoColor,
          ),
          cursorColor: AppColors.textTodoColor,
        ),
      ),
    );
  }
}
