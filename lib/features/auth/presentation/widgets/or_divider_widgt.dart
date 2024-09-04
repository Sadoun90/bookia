import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class OrDividerWidget extends StatelessWidget {
  const OrDividerWidget({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: getSmallTextStyle(color: AppColors.greyColor),
          ),
        ),
        const Expanded(child: Divider())
      ],
    );
  }
}
