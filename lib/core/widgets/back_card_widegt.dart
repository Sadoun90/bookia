import 'package:bookia/core/utils/colors.dart';
import 'package:flutter/material.dart';

class BackCardWidegt extends StatelessWidget {
  const BackCardWidegt({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: 41,
        height: 41,
        padding: EdgeInsets.only(right: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.whiteColor,
          border: Border.all(color: AppColors.borderColor),
        ),
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}
