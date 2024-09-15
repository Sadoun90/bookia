import 'package:bookia/core/functions/navigation.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/custom_Button.dart';
import 'package:bookia/features/auth/presentation/page/OTP_Vetification.dart';
import 'package:bookia/features/auth/presentation/page/login_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ConfirmPassword extends StatefulWidget {
  const ConfirmPassword({super.key});

  @override
  State<ConfirmPassword> createState() => _ConfirmPasswordState();
}

class _ConfirmPasswordState extends State<ConfirmPassword> {
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
                  border: Border.all(color: AppColors.borderColor)),
              child: Icon(Icons.arrow_back_ios_new_rounded),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Remember Password?",
              style: getBodyTextStyle(fontSize: 14),
            ),
            TextButton(
                onPressed: () {
                  Push(context, LoginView());
                },
                child: Text(
                  'Login',
                  style: getTitleTextStyle(fontSize: 15),
                ))
            // Text(
            //   'Register Now',
            //   style: getTitleTextStyle(fontSize: 14),
            // ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Forget Password ?',
              style: getTitleTextStyle(
                  color: AppColors.blackColor,
                  fontSize: 22,
                  fontWeight: FontWeight.normal),
            ),
            Gap(10),
            Text(
              "Don't worry! it occurs.Please enter the email address linked with your account",
              style: getTitleTextStyle(
                  color: AppColors.greyColor,
                  fontSize: 15,
                  fontWeight: FontWeight.normal),
            ),
            const Gap(30),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter your email',
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
                text: 'Send Code',
                onPressed: () {
                  Push(context, OtpVetification());
                },
              ),
            ),
            const Gap(30),
          ],
        ),
      ),
    );
  }
}
