import 'package:bookia/core/constants/assetes_icons.dart';
import 'package:bookia/core/functions/navigation.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/custom_Button.dart';
import 'package:bookia/features/auth/presentation/page/login_view.dart';
import 'package:bookia/features/auth/presentation/widgets/or_divider_widgt.dart';
import 'package:bookia/features/auth/presentation/widgets/social_btn_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
              child: Icon(Icons.arrow_back_ios_new_rounded),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an account?',
              style: getBodyTextStyle(fontSize: 14),
            ),
            TextButton(
                onPressed: () {
                  Push(context, LoginView());
                },
                child: Text(
                  'Login Now',
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello! Register To Get Started',
                style: getTitleTextStyle(
                    color: AppColors.blackColor,
                    fontSize: 22,
                    fontWeight: FontWeight.normal),
              ),
              const Gap(30),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'User Name',
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
                  hintText: 'Email',
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
                    hintText: 'Password',
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
              Gap(15),
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
              const Gap(20),
              Center(
                child: CustomButton(
                  width: 330,
                  text: 'Register',
                  onPressed: () {},
                ),
              ),
              Gap(7),
              OrDividerWidget(
                text: 'or Register with',
              ),
              const Gap(8),
              SocialButtonsCard(),
            ],
          ),
        ),
      ),
    );
  }
}
