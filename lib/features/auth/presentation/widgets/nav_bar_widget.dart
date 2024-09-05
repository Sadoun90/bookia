import 'package:bookia/core/constants/assetes_icons.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/features/cart/page/cart_view.dart';
import 'package:bookia/features/home/presentation/page/home_view.dart';
import 'package:bookia/features/profile/page/profile_view.dart';
import 'package:bookia/features/wishlist/page/wishlist_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  int selectedIndex = 0;

  List<Widget> pages = [
    HomeView(),
    WishlistView(),
    CartView(),
    ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value.toInt();
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetesIcons.homeSvg),
            activeIcon: SvgPicture.asset(
              AssetesIcons.homeSvg,
              colorFilter:
                  ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
              color: AppColors.primaryColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetesIcons.bookmarktSvg),
            activeIcon: SvgPicture.asset(
              AssetesIcons.bookmarktSvg,
              colorFilter:
                  ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
              color: AppColors.primaryColor,
            ),
            label: 'Searth',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetesIcons.cartSvg),
            activeIcon: SvgPicture.asset(
              AssetesIcons.cartSvg,
              colorFilter:
                  ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
              color: AppColors.primaryColor,
            ),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetesIcons.profiletSvg),
            activeIcon: SvgPicture.asset(
              AssetesIcons.profiletSvg,
              colorFilter:
                  ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
              color: AppColors.primaryColor,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
