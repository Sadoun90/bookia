import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/features/home/presentation/bloc/bloc/home_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeBunnerWidget extends StatefulWidget {
  const HomeBunnerWidget({super.key});

  @override
  State<HomeBunnerWidget> createState() => _HomeBunnerWidgetState();
}

class _HomeBunnerWidgetState extends State<HomeBunnerWidget> {
  int selectedBunner = 0;
  @override
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetHomeBunnerEvent());
  }

  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          current is HomeBunnerLoadedState || current is HomeBunnerLoadingState,
      builder: (context, state) {
        if (state is HomeBunnerLoadedState) {
          var banner = context.read<HomeBloc>().homeBunnerResponse?.data;
          return Column(
            children: [
              CarouselSlider.builder(
                itemCount: banner?.sliders?.length ?? 0,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: banner?.sliders?[itemIndex].image ?? '',
                    width: double.infinity,
                    height: 190,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                options: CarouselOptions(
                  height: 150,
                  autoPlay: true,
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
                controller: PageController(initialPage: selectedBunner),
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
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
