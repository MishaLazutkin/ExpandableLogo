import 'package:flutter/material.dart';
import 'package:test_task/utils/style.dart';

class Item extends StatelessWidget {
  final String title;

  const Item( this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.all(16),
      height: 40,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: AppColor.cell,
      ),
      child: Center(child: Text(title,style: AppTextStyle.cellItem,)),
    );
  }
}
