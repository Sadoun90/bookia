import 'package:bookia/core/constants/assetes_icons.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class BookDetails extends StatefulWidget {
  const BookDetails({super.key});

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,
        title: Row(
          children: [
            Container(
              width: 41,
              height: 41,
              padding: EdgeInsets.only(right: 3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.whiteColor,
                  border: Border.all(color: AppColors.borderColor)),
              child: Icon(Icons.arrow_back_ios_new_rounded),
            ),
            Spacer(),
            SvgPicture.asset(AssetesIcons.bookmarktSvg)
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(9),
                child: Image.asset(
                  'assets/images/blackbook.png',
                  fit: BoxFit.cover,
                  width: 183,
                  height: 271,
                ),
              ),
              Gap(10),
              Text(
                'Black Heart',
                style:
                    getBodyTextStyle(color: AppColors.blackColor, fontSize: 25),
              ),
              Gap(6),
              Text(
                'Broché',
                style: getBodyTextStyle(
                    color: AppColors.primaryColor, fontSize: 15),
              ),
              Gap(5),
              Padding(
                padding: const EdgeInsets.only(left: 7),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  style: getBodyTextStyle(
                      color: AppColors.blackColor, fontSize: 12),
                ),
              ),
              Gap(25),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Text(
                      '₹285',
                      style: getBodyTextStyle(color: AppColors.blackColor),
                    ),
                    Spacer(),
                    SizedBox(
                      width: 212,
                      height: 56,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: AppColors.whiteColor,
                          backgroundColor: AppColors.blackColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
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
    );
  }
}
