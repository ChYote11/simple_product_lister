import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_product_lister/page/product/productDetailPage.dart';
import 'package:simple_product_lister/page/product/productListPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        title: 'Simple Product Lister',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          final MediaQueryData data = MediaQuery.of(context);
          return MediaQuery(
            data: data.copyWith(textScaler: TextScaler.linear(1.0)),
            child: child!,
          );
        },
        initialRoute: "/",
        routes: {
          // "/": (context) => const SplashScreen(),
          "/": (context) => const ProductListPage(),
          '/productDetailPage': (context) => const ProductDetailPage(),
        },
      ),
    );
  }
}
