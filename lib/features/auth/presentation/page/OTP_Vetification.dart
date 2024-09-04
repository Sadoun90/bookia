import 'package:bookia/core/functions/navigation.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/custom_Button.dart';
import 'package:bookia/features/auth/presentation/page/Create_new_password.dart';
import 'package:bookia/features/auth/presentation/page/login_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OtpVetification extends StatefulWidget {
  const OtpVetification({super.key});

  @override
  State<OtpVetification> createState() => _OtpVetificationState();
}

class _OtpVetificationState extends State<OtpVetification> {
  String otpCode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,
        title: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 41,
                height: 41,
                padding: EdgeInsets.only(right: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.whiteColor,
                  border: Border.all(color: AppColors.borderColor),
                ),
                child: Icon(Icons.arrow_back_ios_new_rounded),
              ),
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
              "Didn't receive the code?",
              style: getBodyTextStyle(fontSize: 14),
            ),
            TextButton(
              onPressed: () {
                Push(context, LoginView());
              },
              child: Text(
                'Resend',
                style: getTitleTextStyle(fontSize: 15),
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'OTP Verification',
              style: getTitleTextStyle(
                color: AppColors.blackColor,
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
            ),
            Gap(10),
            Text(
              "Enter the verification code we just sent to your email address",
              style: getTitleTextStyle(
                color: AppColors.greyColor,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
            const Gap(30),
            TextField(
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter OTP',
                counterText: "",
              ),
              onChanged: (value) {
                setState(() {
                  otpCode = value;
                });
              },
            ),
            const Gap(20),
            Center(
              child: CustomButton(
                width: 300,
                text: 'Verify',
                onPressed: () {
                  if (otpCode.length == 6) {
                    Push(context, CreateNewPassword());
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Please enter the full OTP code'),
                    ));
                  }
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
