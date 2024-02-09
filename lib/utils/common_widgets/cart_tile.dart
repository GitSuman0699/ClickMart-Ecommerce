import 'package:firebase_project/utils/constants/colors.dart';
import 'package:firebase_project/utils/constants/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartTile extends StatelessWidget {
  const CartTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage('assets/product/pic1.png')),
              borderRadius: BorderRadius.circular(10.0)),
        ),
        Expanded(
          child: Container(
            height: 80.h,
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Astylish Women Open Front Long Sleeve Chunky Knit Cardigan',
                  style: FontStyles.montserratRegular14(),
                  maxLines: 2,
                ),
                // SizedBox(height: 20.0),
                Text(
                  '\$89.99',
                  style: FontStyles.montserratBold17(),
                )
              ],
            ),
          ),
        ),
        const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.add_circle_outline, color: AppColors.darkGrey),
            Text('1', style: TextStyle(color: AppColors.primary)),
            Icon(Icons.remove_circle_outline, color: AppColors.darkGrey),
          ],
        ),
      ],
    );
  }
}
