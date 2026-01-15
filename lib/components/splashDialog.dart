import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_product_lister/constants/color.dart';

class SplashDialog extends StatelessWidget {
  final String title;
  final String content;
  const SplashDialog({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: white,
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      contentPadding: EdgeInsets.only(
        top: 24.h,
        left: 12.w,
        right: 12.w,
        bottom: 10.h,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title),
          SizedBox(width: 6.w),
          Icon(Icons.warning, color: orenge),
        ],
      ),
      content: Text(
        content,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: const Color(0xE5343741),
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
