import 'package:bookia/core/utils/colors.dart';
import 'package:flutter/material.dart';

void showErrorDialog(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.redColor,
      content: Text(text),
    ),
  );
}
