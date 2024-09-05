import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.width,
    this.height,
    required this.text,
    required this.onPressed,
    this.color,
    this.isOutline = false,
  });

  final double? width;
  final double? height;
  final String text;
  final Function() onPressed;

  final Color? color;
  final bool isOutline;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 300,
      height: height ?? 50,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor:
                  isOutline ? AppColors.whiteColor : AppColors.primaryColor,
              foregroundColor: AppColors.whiteColor,
              shape: RoundedRectangleBorder(
                  side: isOutline
                      ? BorderSide(color: AppColors.textColor)
                      : BorderSide.none,
                  borderRadius: BorderRadius.circular(6))),
          onPressed: onPressed,
          child: Text(
            text,
            style: getSmallTextStyle(
                color: isOutline ? AppColors.textColor : AppColors.whiteColor),
          )),
    );
  }
}
