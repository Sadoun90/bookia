import 'package:bookia/core/constants/assetes_icons.dart';
import 'package:bookia/core/functions/navigation.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/features/home/presentation/bloc/bloc/home_bloc.dart';
import 'package:bookia/features/home/presentation/page/book_details/book_details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerBooksWidget extends StatefulWidget {
  const BestSellerBooksWidget({
    super.key,
  });

  @override
  State<BestSellerBooksWidget> createState() => _BestSellerBooksWidgetState();
}

class _BestSellerBooksWidgetState extends State<BestSellerBooksWidget> {
  @override
  initState() {
    super.initState();
    context.read<HomeBloc>().add(GetBestSellerEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) =>
            current is BestSellerLoadedState ||
            current is BestSellerLoadingState,
        builder: (context, state) {
          if (state is BestSellerLoadedState) {
            var books = context.read<HomeBloc>().bestSellerResponse?.data;
            return GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisExtent: 295,
                mainAxisSpacing: 10,
                childAspectRatio: 0.62,
              ),
              itemCount: books?.products?.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Push(
                      context,
                      BookDetails(
                        product: books?.products?[index],
                      ));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(
                        13), // تعديل الـ borderRadius للـ Container
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 8, right: 8),
                        child: Hero(
                          tag: books?.products?[index].id ?? '',
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(13),
                            child: CachedNetworkImage(
                              imageUrl: books?.products?[index].image ?? '',
                              width: double.infinity,
                              height: 190,
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Text(
                              books?.products?[index].name ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
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
                                  '\$${books?.products?[index].price ?? ''}',
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
                                      borderRadius: BorderRadius.circular(10),
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
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
