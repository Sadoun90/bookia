import 'package:bookia/core/constants/assetes_icons.dart';
import 'package:bookia/core/functions/dialogs.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/back_card_widegt.dart';
import 'package:bookia/features/home/data/models/response/best_seller_response/product.dart';
import 'package:bookia/features/home/presentation/bloc/bloc/home_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({super.key, required this.product});
  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,
        title: Row(
          children: [
            BackCardWidegt(),
            Spacer(),
            InkWell(
              onTap: () {
                context
                    .read<HomeBloc>()
                    .add(AddToWishlistEvent(productId: product?.id ?? 0));
              },
              child: SvgPicture.asset(AssetesIcons.bookmarktSvg),
            ),
          ],
        ),
      ),
      body: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is AddToWishlistLoadedState) {
            Navigator.pop(context);
            showSuccessDialog(context, 'Book added to wishlist');
          } else if (state is AddToCartLoadedState) {
            Navigator.pop(context);
            showSuccessDialog(context, 'Book added to Cart');
          } else if (state is AddToWishlistLoadingState ||
              state is AddToCartLoadingState) {
            ShowLoadingDialogs(context);
          } else {
            Navigator.pop(context);
            showErrorDialog(context, 'Something went wrong');
          }
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Gap(20),
                        Hero(
                          tag: product?.id ?? '',
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(9),
                            child: CachedNetworkImage(
                              imageUrl: product?.image ?? '',
                              width: 150,
                              height: 240,
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                        ),
                        Gap(10),
                        Center(
                          child: Text(
                            product?.name ?? '',
                            style: getBodyTextStyle(
                              color: AppColors.blackColor,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Gap(6),
                        Text(
                          product?.category ?? '',
                          style: getBodyTextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 16,
                          ),
                        ),
                        Gap(6),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur  elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                          textAlign: TextAlign.justify,
                          style: getBodyTextStyle(
                            color: AppColors.blackColor,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Text(
                        '\$285',
                        style: getBodyTextStyle(
                          color: AppColors.blackColor,
                          fontSize: 22,
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        width: 212,
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: AppColors.whiteColor,
                            backgroundColor: AppColors.blackColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            context.read<HomeBloc>().add(
                                AddToCartEvent(productId: product?.id ?? 0));
                          },
                          child: Text(
                            'Add To Cart',
                            style: getBodyTextStyle(
                              color: AppColors.whiteColor,
                            ),
                          ),
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
    );
  }
}
