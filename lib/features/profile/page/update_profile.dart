import 'package:bookia/core/constants/assetes_icons.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/custom_Button.dart';
import 'package:bookia/core/widgets/textformfeild_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,
        title: Row(
          children: [
            Container(
              width: 41,
              height: 41,
              padding: const EdgeInsets.only(right: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.whiteColor,
                border: Border.all(color: AppColors.borderColor),
              ),
              child: const Icon(Icons.arrow_back_ios_new_rounded),
            )
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Update Profile',
                style: getBodyTextStyle(
                  color: AppColors.blackColor,
                  fontSize: 25,
                ),
              ),
              const Gap(40),
              const TextFormFeildWidget(
                text: 'Username',
              ),
              const Gap(20),
              const TextFormFeildWidget(
                text: 'Email',
              ),
              const Gap(15),
              const TextFormFeildWidget(
                text: 'Password',
              ),
              Gap(15),
              const TextFormFeildWidget(
                text: 'Confirm Password',
              ),
              const Gap(30),
              CustomButton(
                text: 'Update Profile',
                onPressed: () {},
                width: 320,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
