import 'package:bookia/core/constants/assetes_icons.dart';
import 'package:bookia/core/functions/navigation.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/features/profile/page/my_orders.dart';
import 'package:bookia/features/profile/page/new_password.dart';
import 'package:bookia/features/profile/page/update_profile.dart';
import 'package:bookia/features/profile/widgets/profile_container_Item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Profile',
            style: getBodyTextStyle(
              fontSize: 20,
              color: AppColors.blackColor,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {}, icon: SvgPicture.asset(AssetesIcons.shareSvg))
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://i.pinimg.com/236x/f8/20/b4/f820b492ae984ba114a4a1059867bf66.jpg'),
                ),
                Gap(15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mossad Ahmed',
                      style: getBodyTextStyle(fontSize: 22),
                    ),
                    Text(
                      'mosad22@gmail.com',
                      style: getSmallTextStyle(color: AppColors.greyColor),
                    ),
                  ],
                )
              ],
            ),
            const Gap(25),
            ProfileContainerItem(
              text: 'My Orders',
              onPressed: () => Push(context, MyOrders()),
            ),
            ProfileContainerItem(
              text: 'Edit Profile',
              onPressed: () => Push(context, UpdateProfile()),
            ),
            ProfileContainerItem(
              text: 'Reset Password',
              onPressed: () => Push(context, NewPassword()),
            ),
            const ProfileContainerItem(
              text: 'FAQ',
            ),
            const ProfileContainerItem(
              text: 'Contact Us',
            ),
            const ProfileContainerItem(
              text: 'Privacy & Terms',
            )
          ],
        ));
  }
}
