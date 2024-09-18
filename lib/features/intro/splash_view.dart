import 'package:bookia/core/constants/assetes_icons.dart';
import 'package:bookia/core/functions/navigation.dart';
import 'package:bookia/core/services/local_storage.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/features/auth/presentation/widgets/nav_bar_widget.dart';
import 'package:bookia/features/intro/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    String token = LocalStorage.getData(key: LocalStorage.token) ?? '';
    Future.delayed(const Duration(seconds: 3), () {
      if (token.isNotEmpty) {
        PushWithReplacement(context, NavBarWidget());
      } else {
        PushWithReplacement(context, WelcomeView());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AssetesIcons.logoSvg),
            const Gap(10),
            Text(
              'Order Your Book Now!',
              style: getSmallTextStyle(
                color: AppColors.blackColor,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
