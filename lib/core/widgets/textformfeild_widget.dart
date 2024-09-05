import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class TextFormFeildWidget extends StatelessWidget {
  const TextFormFeildWidget({
    super.key,
    required this.text,
    this.maxlines = 1, 
  });

  final String text;
  final int maxlines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxlines, 
      decoration: InputDecoration(
        hintText: text,
        hintStyle: getSmallTextStyle(color: AppColors.greyColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.greyColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.borderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 2.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.redColor,
            width: 2.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.redColor,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
