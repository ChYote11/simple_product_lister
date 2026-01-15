import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_product_lister/components/splashDialog.dart';
import 'package:simple_product_lister/constants/color.dart';
import 'package:simple_product_lister/model/product.dart';
import 'package:simple_product_lister/service/productService.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final ProductService productService = ProductService();
  List<Product> products = [];
  bool isLoading = true;
  String? errorMessage;

  Future<void> getProducts() async {
    try {
      final result = await productService.fetchProducts();
      setState(() {
        products = result;
        isLoading = false;
        errorMessage = null;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'ไม่สามารถโหลดข้อมูลสินค้าได้';
        isLoading = false;
      });
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) => SplashDialog(
          title: 'เกิดข้อผิดพลาด',
          content: "ไม่มีการเชื่อมต่ออินเตอร์เน็ต",
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator(color: teal));
    } else if (products.isEmpty) {
      return Center(
        child: Text('ไม่พบข้อมูลสินค้า', style: TextStyle(color: black)),
      );
    } else {
      return ListView.builder(
        itemCount: products.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(left: 12.w, right: 12.w, top: 12.h),
            decoration: BoxDecoration(
              border: Border.all(width: 1.w, color: grey),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12.r),
              clipBehavior: Clip.antiAlias, // ⭐ สำคัญ
              child: ListTile(
                onTap: () {
                  // print(products[index].product_id);
                  Navigator.pushNamed(
                    context,
                    '/productDetailPage',
                    arguments: {
                      'id': products[index].product_id,
                      'title': products[index].title,
                      'description': products[index].description,
                      'price': products[index].price,
                      'thumbnail': products[index].thumbnail,
                    },
                  );
                },
                splashColor: Colors.teal[50],
                leading: CachedNetworkImage(
                  imageUrl: products[index].thumbnail,
                  width: 50.w,
                  height: 50.h,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => CircularProgressIndicator(
                    strokeWidth: 2,
                    color: transparent,
                  ),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.broken_image),
                ),
                title: Text(products[index].title),
                subtitle: Text("${products[index].price} \$ "),
              ),
            ),
          );
        },
      );
    }
  }
}
