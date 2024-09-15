import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

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
              child: Text('My Orders',
                  style: getBodyTextStyle(
                      fontSize: 22, fontWeight: FontWeight.w400)),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(14),
            child: Container(
              width: 335,
              height: 172,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 3,
                    blurRadius: 4,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order No238562312',
                          style: getBodyTextStyle(
                              fontSize: 14, color: AppColors.blackColor),
                        ),
                        Spacer(),
                        Text(
                          '20/03/2020',
                          style: getBodyTextStyle(
                              color: AppColors.greyColor, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: AppColors.borderColor,
                    thickness: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(9),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Total Amount:',
                          style: getBodyTextStyle(
                              color: AppColors.greyColor, fontSize: 14),
                        ),
                        Gap(5),
                        Text(
                          '\$150',
                          style: getBodyTextStyle(
                              color: AppColors.blackColor, fontSize: 14),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
