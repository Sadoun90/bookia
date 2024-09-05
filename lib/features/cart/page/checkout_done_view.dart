import 'package:bookia/core/constants/assetes_icons.dart';
import 'package:bookia/core/functions/navigation.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/custom_Button.dart';
import 'package:bookia/features/auth/presentation/page/login_view.dart';
import 'package:bookia/features/home/presentation/page/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CheckoutDoneView extends StatelessWidget {
  const CheckoutDoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AssetesIcons.doneSvg),
              Gap(22),
              Text(
                'Success! ',
                style: getTitleTextStyle(
                    color: AppColors.blackColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w400),
              ),
              const Gap(10),
              Text(
                "Your order will be delivered soon.Thank you for your choosing our app!",
                style: getTitleTextStyle(
                    color: AppColors.greyColor,
                    fontSize: 15,
                    fontWeight: FontWeight.normal),
              ),
              Gap(20),
              CustomButton(
                width: 330,
                text: 'Back To Home',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
