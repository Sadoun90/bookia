import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class ProfileContainerItem extends StatelessWidget {
  const ProfileContainerItem({
    super.key,
    required this.text,
    this.onPressed,
  });

  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        width: 335,
        height: 54,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(3),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                text,
                style: getBodyTextStyle(
                    fontSize: 18, color: AppColors.containerColor),
              ),
            ),
            IconButton(
              onPressed: onPressed,
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.blackColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
