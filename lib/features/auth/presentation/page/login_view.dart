import 'package:bookia/core/constants/assetes_icons.dart';
import 'package:bookia/core/functions/navigation.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/custom_Button.dart';
import 'package:bookia/features/auth/presentation/page/Register_View.dart';
import 'package:bookia/features/auth/presentation/page/confirm_password.dart';
import 'package:bookia/features/auth/presentation/widgets/nav_bar_widget.dart';
import 'package:bookia/features/auth/presentation/widgets/or_divider_widgt.dart';
import 'package:bookia/features/auth/presentation/widgets/social_btn_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isPasswordVisible = false;
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
              child: const Icon(Icons.arrow_back_ios_new_rounded),
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
              "Don't have an account?",
              style: getBodyTextStyle(fontSize: 14),
            ),
            TextButton(
                onPressed: () {
                  Push(context, const RegisterView());
                },
                child: Text(
                  'Register Now',
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
        padding: const EdgeInsets.all(22),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back! Glad To See You,Again!',
                style: getTitleTextStyle(
                    color: AppColors.blackColor,
                    fontSize: 22,
                    fontWeight: FontWeight.normal),
              ),
              const Gap(32),
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
              Gap(15),
              TextFormField(
                obscureText: isPasswordVisible,
                decoration: InputDecoration(
                    hintText: 'Enter your password',
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
              const Gap(20),
              Row(
                children: [
                  Spacer(),
                  TextButton(
                      onPressed: () {
                        Push(context, ConfirmPassword());
                      },
                      child: Text(
                        'Forget Password?',
                        style: getTitleTextStyle(
                            fontSize: 15, color: AppColors.blackColor),
                      ))
                ],
              ),
              const Gap(20),
              Center(
                child: CustomButton(
                  width: 330,
                  text: 'Login',
                  onPressed: () {
                    PushAndRemoveUntil(context, NavBarWidget());
                  },
                ),
              ),
              Gap(30),
              OrDividerWidget(
                text: 'or login with',
              ),
              const Gap(20),
              SocialButtonsCard()
            ],
          ),
        ),
      ),
    );
  }
}
