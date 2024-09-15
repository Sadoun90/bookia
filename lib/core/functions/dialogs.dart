import 'package:bookia/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void showErrorDialog(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.redColor,
      content: Text(text),
    ),
  );
}

// ignore: non_constant_identifier_names
ShowLoadingDialogs(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Lottie.asset('assets/images/loading.json');
    },
  );
}
