import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Notification',
          style: getBodyTextStyle(color: AppColors.blackColor, fontSize: 17),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(11),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  width: 390,
                  height: 100,
                  decoration: BoxDecoration(
                    color: AppColors.accentColor,
                    borderRadius:
                        BorderRadius.circular(3), // إضافة borderRadius
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'assets/images/notiphoto1.png',
                            fit: BoxFit.cover,
                            width: 80,
                            height: 80,
                          ),
                        ),
                        const Gap(10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Your order #123456789 has been confirmed',
                                style: TextStyle(
                                  color: AppColors.blackColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const Gap(5),
                              Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis pretium et in arcu adipiscing nec.',
                                style: TextStyle(
                                  color: AppColors.greyColor,
                                  fontSize: 8,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/images/notiphoto2.png',
                        fit: BoxFit.cover,
                        width: 80,
                        height: 80,
                      ),
                    ),
                    const Gap(10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your order #123456789 has been canceled',
                            style: TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Gap(5),
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis pretium et in arcu adipiscing nec.',
                            style: TextStyle(
                              color: AppColors.greyColor,
                              fontSize: 8,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
