import 'package:bookia/core/functions/navigation.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/custom_Button.dart';
import 'package:bookia/features/auth/presentation/page/Password_Changed.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
          backgroundColor: AppColors.whiteColor,
          title: Row(
            children: [
              Container(
                width: 41,
                height: 41,
                padding: EdgeInsets.only(right: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.whiteColor,
                  border: Border.all(color: AppColors.borderColor)
                ),
                child: Icon (Icons.arrow_back_ios_new_rounded),
              )
            ],
          ),
          ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create New Password ',
                style: getTitleTextStyle(
                    color: AppColors.blackColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w400),
              ),
              Gap(10),
              Text(
                "Your new password must be unique from those previously used.",
                style: getTitleTextStyle(
                    color: AppColors.greyColor,
                    fontSize: 15,
                    fontWeight: FontWeight.normal),
              ),
              const Gap(30),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'New Password',
                  hintStyle: getSmallTextStyle(color: AppColors.greyColor),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.greyColor)),
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
              ),
              Gap(15),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  hintStyle: getSmallTextStyle(color: AppColors.greyColor),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.greyColor)),
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
              ),
              const Gap(20),
              Center(
                child: CustomButton(
                  width: 330,
                  text: 'Reset Password',
                  onPressed: () {
                    Push(context, PasswordChanged());
                  },
                ),
              ),
              const Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}
