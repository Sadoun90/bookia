import 'package:bookia/core/constants/assetes_icons.dart';
import 'package:bookia/core/functions/navigation.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/custom_Button.dart';
import 'package:bookia/features/auth/presentation/page/Register_View.dart';
import 'package:bookia/features/auth/presentation/page/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AssetesIcons.welcomeBg,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                children: [
                  Spacer(flex: 2),
                  SvgPicture.asset(AssetesIcons.logoSvg),
                  Gap(15),
                  Text(
                    'Order Your Book Now!',
                    style: getBodyTextStyle(
                      color: AppColors.blackColor,
                      fontSize: 14,
                    ),
                  ),
                  Spacer(flex: 4),
                  CustomButton(
                      text: 'Login',
                      onPressed: () {
                        Push(context, LoginView());
                      }),
                  Gap(15),
                  CustomButton(
                      isOutline: true,
                      text: 'Register',
                      onPressed: () {
                        Push(context, RegisterView());
                      }),
                  Spacer(
                    flex: 1,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
