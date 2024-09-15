import 'package:bookia/core/constants/assetes_icons.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/custom_Button.dart';
import 'package:bookia/core/widgets/textformfeild_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
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
              padding: EdgeInsets.only(right: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.whiteColor,
                border: Border.all(color: AppColors.borderColor),
              ),
              child: Icon(Icons.arrow_back_ios_new_rounded),
            )
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'New Password',
                style:
                    getBodyTextStyle(color: AppColors.blackColor, fontSize: 25),
              ),
              Gap(40),
              const TextFormFeildWidget(
                text: 'New Password',
              ),
              const Gap(20),
              TextFormField(
                obscureText: isPasswordVisible,
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
                    suffixIconConstraints: BoxConstraints(maxWidth: 33),
                    suffixIcon: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                            child: SvgPicture.asset(AssetesIcons.eyeSvg)),
                      ],
                    )),
              ),
              const Gap(30),
              CustomButton(
                text: 'Update Password',
                onPressed: () {},
                width: 320,
              )
            ],
          ),
        ),
      ),
    );
  }
}
