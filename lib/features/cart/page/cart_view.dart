import 'package:bookia/core/constants/assetes_icons.dart';
import 'package:bookia/core/functions/navigation.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/custom_Button.dart';
import 'package:bookia/features/cart/page/checkout_done_view.dart';
import 'package:bookia/features/cart/page/checkout_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'My Cart',
            style: getBodyTextStyle(color: AppColors.blackColor, fontSize: 20),
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
                  Gap(15),
                  Gap(15),
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
                        const Gap(15),
                        Row(
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              padding: const EdgeInsets.only(right: 3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColors.accentColor,
                                border:
                                    Border.all(color: AppColors.borderColor),
                              ),
                              child: const Icon(Icons.add),
                            ),
                            const Gap(15),
                            Text('01',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20)),
                            Gap(15),
                            Container(
                              width: 30,
                              height: 30,
                              padding: const EdgeInsets.only(right: 3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColors.accentColor,
                                border:
                                    Border.all(color: AppColors.borderColor),
                              ),
                              child: const Icon(Icons.remove),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Gap(15),
              Divider(
                color: AppColors.secondaryColor,
              ),
              Gap(15),
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
                  Gap(15),
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
                        const Gap(15),
                        Row(
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              padding: const EdgeInsets.only(right: 3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColors.accentColor,
                                border:
                                    Border.all(color: AppColors.borderColor),
                              ),
                              child: const Icon(Icons.add),
                            ),
                            const Gap(15),
                            Text('01',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20)),
                            Gap(15),
                            Container(
                              width: 30,
                              height: 30,
                              padding: const EdgeInsets.only(right: 3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColors.accentColor,
                                border:
                                    Border.all(color: AppColors.borderColor),
                              ),
                              child: const Icon(Icons.remove),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Gap(15),
              Divider(
                color: AppColors.secondaryColor,
              ),
              Gap(40),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Text(
                      'Total:',
                      style: getSmallTextStyle(
                          color: AppColors.greyColor, fontSize: 18),
                    ),
                    const Spacer(),
                    Text(
                      "\$ 95.00",
                      style: getSmallTextStyle(
                          color: AppColors.blackColor, fontSize: 18),
                    ),
                  ],
                ),
              ),
              CustomButton(
                  width: 320,
                  text: 'Checkout',
                  onPressed: () {
                    Push(context, const CheckoutView());
                  })
            ],
          ),
        ));
  }
}

// Row(
//                         children: [
//                           Container(
//                             width: 30,
//                             height: 30,
//                             padding: const EdgeInsets.only(right: 3),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(12),
//                               color: AppColors.accentColor,
//                               border: Border.all(color: AppColors.borderColor),
//                             ),
//                             child: const Icon(Icons.add),
//                           ),
//                           const Gap(15),
//                           Text('01',
//                               style:
//                                   TextStyle(color: Colors.black, fontSize: 20)),
//                           Gap(15),
//                           Container(
//                             width: 30,
//                             height: 30,
//                             padding: const EdgeInsets.only(right: 3),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(12),
//                               color: AppColors.accentColor,
//                               border: Border.all(color: AppColors.borderColor),
//                             ),
//                             child: const Icon(Icons.remove),
//                           ),
//                         ],
//                       )
