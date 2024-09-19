import 'package:bookia/core/constants/assetes_icons.dart';
import 'package:bookia/core/functions/navigation.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/custom_Button.dart';
import 'package:bookia/features/home/presentation/bloc/bloc/home_bloc.dart';
import 'package:bookia/features/home/presentation/page/book_details/book_details.dart';
import 'package:bookia/features/home/presentation/page/notification_view.dart';
import 'package:bookia/features/home/presentation/widgets/best_seller_widget.dart';
import 'package:bookia/features/home/presentation/widgets/home_bunner.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedBunner = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: SvgPicture.asset(
          AssetesIcons.logoSvg,
          height: 30,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Push(context, NotificationView());
            },
            icon: SvgPicture.asset(AssetesIcons.notificationSvg),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AssetesIcons.searthSvg),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomeBunnerWidget(),
              Gap(18),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Best Seller',
                    style: getBodyTextStyle(
                      color: AppColors.blackColor,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const Gap(10),
              BestSellerBooksWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
