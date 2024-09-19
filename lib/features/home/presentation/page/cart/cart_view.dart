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

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetCartEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Cart',
          style: getBodyTextStyle(fontSize: 20, color: AppColors.blackColor),
        ),
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is RemoveFromCartLoadedState) {
              Navigator.pop(context);
              context.read<HomeBloc>().add(GetCartEvent());
            } else if (state is RemoveFromCartLoadingState ||
                state is GetCartLoadingState) {
              ShowLoadingDialogs(context);
            } else if (state is GetCartLoadedState) {
              Navigator.pop(context);
            }
          },
          buildWhen: (previous, current) => current is GetCartLoadedState,
          builder: (context, state) {
            var Cartlist =
                context.read<HomeBloc>().getCartResponse?.data?.cartItems;
            if (Cartlist?.isEmpty ?? false) {
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
                    'No books in Cart',
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
                          imageUrl: Cartlist?[index].itemProductImage ?? '',
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
                                    Cartlist?[index].itemProductName ?? '',
                                    maxLines: 2,
                                    style: getBodyTextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: 15),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    context.read<HomeBloc>().add(
                                        RemoveFromCartEvent(
                                            CartItemId:
                                                Cartlist?[index].itemId ?? 0));
                                  },
                                  icon: SvgPicture.asset(AssetesIcons.shapeSvg),
                                ),
                              ],
                            ),
                            Text(
                              '\$${Cartlist?[index].itemTotal?.toStringAsFixed(2)}',
                              style:
                                  getBodyTextStyle(color: AppColors.greyColor),
                            ),
                            const Gap(10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton.small(
                                  elevation: 0,
                                  backgroundColor: AppColors.borderColor,
                                  onPressed: () {},
                                  child: Icon(Icons.remove),
                                ),
                                const Gap(10),
                                Text(
                                  Cartlist?[index].itemQuantity.toString() ??
                                      '',
                                  style: getBodyTextStyle(fontSize: 20),
                                ),
                                Gap(10),
                                FloatingActionButton.small(
                                  elevation: 0,
                                  backgroundColor: AppColors.borderColor,
                                  onPressed: () {},
                                  child: Icon(Icons.add),
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
                itemCount: Cartlist?.length ?? 0,
              ),
            );
          }),
    );
  }
}
