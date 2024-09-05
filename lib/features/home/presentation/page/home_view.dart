import 'package:bookia/core/constants/assetes_icons.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/custom_Button.dart';
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
        centerTitle: false,
        title: SvgPicture.asset(
          AssetesIcons.logoSvg,
          height: 30,
        ),
        actions: [
          IconButton(
            onPressed: () {},
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
                ],
              ),
              options: CarouselOptions(
                height: 150,
                viewportFraction: 0.8,
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
                  crossAxisCount: 2, // Two items per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio:
                      0.56, // Adjust this ratio to fit the content properly
                ),
                itemCount: 4, // Number of items in the grid
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            AssetesIcons.popularbooksBg,
                            width:
                                140, // Ensure the image width matches container width
                            height: 175, // Adjust height as needed
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'The Republic',
                            style: getBodyTextStyle(
                              color: AppColors.blackColor,
                              fontSize: 15,
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
                                    fontSize: 12,
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
                                  onPressed: () {},
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
