import 'package:bookia/core/constants/assetes_icons.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SocialButtonsCard extends StatelessWidget {
  const SocialButtonsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        social_card_item(
          logo: AssetesIcons.facebookSvg,
        ),
        const Gap(10),
        social_card_item(
          logo: AssetesIcons.googleSvg,
        ),
        const Gap(10),
        social_card_item(
          logo: AssetesIcons.appleSvg,
        ),
      ],
    );
  }
}

class social_card_item extends StatelessWidget {
  const social_card_item({
    super.key,
    required this.logo,
  });

  final String logo;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        width: 40,
        height: 50,
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.borderColor)),
        child: SvgPicture.asset(logo),
      ),
    );
  }
}
