import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 12.w),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
        ),
        title: Text("รายละเอียดสินค้า", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 12.h),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                width: MediaQuery.of(context).size.width,
                imageUrl: args['thumbnail'],
              ),
              Text(
                args['title'],
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
              ),

              SizedBox(height: 12.h),

              Text(
                "Price: ${args['price']} \$",
                style: TextStyle(fontSize: 20.sp),
              ),

              SizedBox(height: 12.h),
              Text(args['description'], style: TextStyle(fontSize: 16.sp)),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }
}
