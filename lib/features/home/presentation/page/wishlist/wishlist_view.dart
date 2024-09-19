import 'package:bookia/core/constants/assetes_icons.dart';
import 'package:bookia/core/functions/dialogs.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/custom_Button.dart';
import 'package:bookia/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:bookia/features/home/presentation/bloc/bloc/home_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class WishlistView extends StatefulWidget {
  const WishlistView({super.key});

  @override
  State<WishlistView> createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetWishlistEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Wishlist',
          style: getBodyTextStyle(fontSize: 20, color: AppColors.blackColor),
        ),
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is RemoveFromWishlistLoadedState) {
              Navigator.pop(context);
              context.read<HomeBloc>().add(GetWishlistEvent());
            } else if (state is RemoveFromWishlistLoadingState ||
                state is GetWishlistLoadingState) {
              ShowLoadingDialogs(context);
            } else if (state is GetWishlistLoadedState) {
              Navigator.pop(context);
            }
          },
          buildWhen: (previous, current) => current is GetWishlistLoadedState,
          builder: (context, state) {
            var wishlistBooks =
                context.read<HomeBloc>().getWishlistResponse?.data?.data;
            if (wishlistBooks?.isEmpty ?? false) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.hourglass_empty_rounded,
                    size: 100,
                    color: AppColors.primaryColor,
                  ),
                  const Gap(20),
                  Text(
                    'No books in wishlist',
                    style: TextStyle(color: AppColors.blackColor, fontSize: 18),
                  ),
                ],
              ));
            }
            return Padding(
              padding: const EdgeInsets.all(15),
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(13),
                        child: CachedNetworkImage(
                          imageUrl: wishlistBooks?[index].image ?? '',
                          height: 120,
                          width: 100,
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      const Gap(15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    wishlistBooks?[index].name ?? '',
                                    maxLines: 2,
                                    style: getBodyTextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: 15),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    context.read<HomeBloc>().add(
                                        RemoveFromWishlistEvent(
                                            productId:
                                                wishlistBooks?[index].id ?? 0));
                                  },
                                  icon: SvgPicture.asset(AssetesIcons.shapeSvg),
                                ),
                              ],
                            ),
                            Text(
                              '\$${wishlistBooks?[index].price}',
                              style:
                                  getBodyTextStyle(color: AppColors.greyColor),
                            ),
                            const Gap(10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CustomButton(
                                  width: 175,
                                  height: 40,
                                  text: 'Add To Cart',
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Divider(),
                  );
                },
                itemCount: wishlistBooks?.length ?? 0,
              ),
            );
          }),
    );
  }
}
