import 'package:bookia/core/functions/navigation.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/custom_Button.dart';
import 'package:bookia/core/widgets/textformfeild_widget.dart';
import 'package:bookia/features/cart/page/checkout_done_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
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
            ),
            const Gap(80),
            Center(
              child: Text('Checkout',
                  style: getBodyTextStyle(
                      fontSize: 20, fontWeight: FontWeight.w400)),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(13),
        child: Column(
          children: [
            const TextFormFeildWidget(
              text: 'Full Name',
            ),
            const Gap(15),
            const TextFormFeildWidget(
              text: 'Email',
            ),
            const Gap(15),
            const TextFormFeildWidget(
              text: 'Address',
            ),
            const Gap(15),
            const TextFormFeildWidget(
              text: 'Phone',
            ),
            const Gap(15),
            const TextFormFeildWidget(
              text: 'Note',
              maxlines: 4,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Text(
                    'Total:',
                    style: getSmallTextStyle(
                        color: AppColors.greyColor, fontSize: 15),
                  ),
                  const Spacer(),
                  Text(
                    "\$ 95.00",
                    style: getSmallTextStyle(
                        color: AppColors.blackColor, fontSize: 15),
                  ),
                ],
              ),
            ),
            CustomButton(
                width: 320,
                text: 'Submit Order',
                onPressed: () {
                  Push(context, const CheckoutDoneView());
                })
          ],
        ),
      ),
    );
  }
}
