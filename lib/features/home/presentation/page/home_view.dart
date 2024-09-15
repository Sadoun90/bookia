import 'package:bookia/core/constants/assetes_icons.dart';
import 'package:bookia/core/functions/navigation.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/custom_Button.dart';
import 'package:bookia/features/home/presentation/page/book_details.dart';
import 'package:bookia/features/home/presentation/page/notification_view.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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
        child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: 5,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/banner.png',
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Find out the best books to read when you don’t even know what to read!!!',
                          style: getBodyTextStyle(
                              color: AppColors.whiteColor, fontSize: 12),
                        ),
                        Gap(30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.whiteColor,
                                  foregroundColor: AppColors.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  'Explore',
                                  style: getBodyTextStyle(
                                      color: AppColors.primaryColor,
                                      fontSize: 12),
                                )),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              options: CarouselOptions(
                height: 150,
                viewportFraction: 1,
                initialPage: 0,
                enlargeCenterPage: true,
                onPageChanged: (value, reason) {
                  setState(() {
                    selectedBunner = value;
                  });
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
            Gap(15),
            SmoothPageIndicator(
              controller: PageController(
                initialPage: selectedBunner,
              ),
              count: 5,
              axisDirection: Axis.horizontal,
              effect: ExpandingDotsEffect(
                dotHeight: 7,
                radius: 7,
                dotWidth: 7,
                dotColor: AppColors.borderColor,
                expansionFactor: 7,
                activeDotColor: AppColors.primaryColor,
              ),
            ),
            Gap(18),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Popular Books',
                  style: getBodyTextStyle(
                    color: AppColors.blackColor,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const Gap(10),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.574,
                ),
                itemCount: 4,
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8, left: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            AssetesIcons.popularimageBg,
                            width: 140,
                            height: 175,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Text(
                              'The Republic',
                              style: getBodyTextStyle(
                                color: AppColors.blackColor,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  '₹285',
                                  style: getBodyTextStyle(
                                    color: AppColors.blackColor,
                                    fontSize: 13,
                                  ),
                                ),
                                Spacer(),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: AppColors.whiteColor,
                                    backgroundColor: AppColors.blackColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                  ),
                                  onPressed: () {
                                    Push(context, BookDetails());
                                  },
                                  child: Text(
                                    'Buy',
                                    style: getBodyTextStyle(
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
