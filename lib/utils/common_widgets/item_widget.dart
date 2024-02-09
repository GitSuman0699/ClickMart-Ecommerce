import 'package:cached_network_image/cached_network_image.dart';

import 'package:firebase_project/dummy/dummy_data.dart';
import 'package:firebase_project/utils/common_widgets/shimmer_effect.dart';
import 'package:firebase_project/utils/constants/colors.dart';
import 'package:firebase_project/utils/constants/font_styles.dart';
import 'package:firebase_project/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemWidget extends StatefulWidget {
  const ItemWidget({this.index, this.favoriteIcon, super.key});
  final int? index;
  final bool? favoriteIcon;
  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFeaturedWidget(context, widget.index),
        _buildFeaturedItemText(context),
        _buildFeaturedItemPrice(context),
      ],
    );
  }

  Widget _buildFeaturedWidget(BuildContext context, index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                height: 153.h,
                width: 163.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: CachedNetworkImage(
                  imageUrl: DummyData.featured[index],
                  fit: BoxFit.cover,
                  placeholder: (context, name) {
                    return ShimmerEffect(
                        borderRadius: 10.0,
                        height: AppDeviceUtils.getScreenHeight(context) * .15,
                        width: AppDeviceUtils.getScreenWidth(context) * .40);
                  },
                  errorWidget: (context, error, child) {
                    return ShimmerEffect(
                      borderRadius: 10.0,
                      height: AppDeviceUtils.getScreenHeight(context) * .20,
                      width: AppDeviceUtils.getScreenWidth(context) * .45,
                    );
                  },
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              width: 47.0,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                gradient: LinearGradient(
                  colors: [Color(0xFFF49763), Color(0xFFD23A3A)],
                  stops: [0, 1],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
              ),
              child: Center(
                child: Text(
                  '50%',
                  style: FontStyles.montserratBold17()
                      .copyWith(fontSize: 11.0, color: AppColors.white),
                ),
              ),
            ),
            widget.favoriteIcon!
                ? Positioned(
                    bottom: -15.0,
                    right: 10.0,
                    child: Container(
                        height: 36.0,
                        width: 36.0,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(36.0),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                          child: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color:
                                isFavorite ? AppColors.secondary : Colors.black,
                          ),
                        )),
                  )
                : const SizedBox(height: 0, width: 0),
          ],
        ),
        _buildRatings(context),
      ],
    );
  }

  Widget _buildRatings(BuildContext context) {
    return SizedBox(
      height: 20,
      width: AppDeviceUtils.getScreenWidth(context),
      child: ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Icon(
            Icons.star,
            color: AppColors.grey,
            size: 10.0,
          );
        },
      ),
    );
  }

  Widget _buildFeaturedItemText(BuildContext context) {
    return SizedBox(
      width: AppDeviceUtils.getScreenWidth(context) * .40,
      child: Text(
        'ECOWISH Womens Color Block Striped Draped K...',
        maxLines: 2,
        style: FontStyles.montserratRegular13().copyWith(
          color: const Color(0xFF34283E),
        ),
      ),
    );
  }

  Widget _buildFeaturedItemPrice(BuildContext context) {
    return SizedBox(
      width: AppDeviceUtils.getScreenWidth(context) * .40,
      child: Text(
        '\$102.33',
        style: FontStyles.montserratBold17(),
      ),
    );
  }
}
