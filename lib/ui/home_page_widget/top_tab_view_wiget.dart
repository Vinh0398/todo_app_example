import 'package:flutter/material.dart';
import 'package:to_do_flutter_app/cons/colors.dart';
import 'package:to_do_flutter_app/cons/dimens.dart';

class TopTabViewWidget extends StatefulWidget {
  final Widget child;

  const TopTabViewWidget({Key? key, required this.child}) : super(key: key);

  @override
  State<TopTabViewWidget> createState() => _TopTabViewWidgetState();
}

class _TopTabViewWidgetState extends State<TopTabViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimens.size200,
      decoration: const BoxDecoration(
        color: AppColors.tabViewColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(Dimens.size30),
          bottomRight: Radius.circular(Dimens.size30),
        ),
      ),
      child: widget.child,
    );
  }
}
