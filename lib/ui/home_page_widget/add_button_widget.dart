import 'package:flutter/material.dart';
import 'package:to_do_flutter_app/cons/colors.dart';
import 'package:to_do_flutter_app/cons/dimens.dart';

class AddButtonWidget extends StatelessWidget {
  final Function()? onPressed;

  const AddButtonWidget({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        elevation: 4,
        shape: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(40)),
        child: Container(
          width: Dimens.size80,
          height: Dimens.size80,
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.itemTodoColor,
          ),
          child: const Center(
            child: Icon(
              Icons.add,
              color: AppColors.textTodoColor,
              size: Dimens.size45,
            ),
          ),
        ),
      ),
    );
  }
}
