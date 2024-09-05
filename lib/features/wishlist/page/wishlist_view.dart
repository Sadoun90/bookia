import 'package:bookia/core/constants/assetes_icons.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/custom_Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Favourite Books',
            style: getBodyTextStyle(fontSize: 20, color: AppColors.blackColor),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/images/bookItem.png',
                      fit: BoxFit.cover,
                      width: 100,
                      height: 118,
                    ),
                  ),
                  const Gap(15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'The Republic',
                              style:
                                  getBodyTextStyle(color: AppColors.greyColor),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(AssetesIcons.shapeSvg)),
                          ],
                        ),
                        Text(
                          '₹285',
                          style: getBodyTextStyle(color: AppColors.blackColor),
                        ),
                        const Gap(10),
                        CustomButton(
                          width: 190,
                          height: 40,
                          text: 'Add To Cart',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Gap(15),
              Divider(
                color: AppColors.secondaryColor,
              ),
              const Gap(15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/images/bookItem.png',
                      fit: BoxFit.cover,
                      width: 100,
                      height: 118,
                    ),
                  ),
                  const Gap(15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'The Republic',
                              style:
                                  getBodyTextStyle(color: AppColors.greyColor),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(AssetesIcons.shapeSvg)),
                          ],
                        ),
                        Text(
                          '₹285',
                          style: getBodyTextStyle(color: AppColors.blackColor),
                        ),
                        const Gap(10),
                        CustomButton(
                          width: 200,
                          height: 40,
                          text: 'Add To Cart',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Gap(15),
              Divider(
                color: AppColors.secondaryColor,
              ),
            ],
          ),
        ));
  }
}
