// import 'dart:async';
// import 'dart:io';

// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:simple_product_lister/components/splashDialog.dart';
// import 'package:simple_product_lister/constants/api.dart';
// import 'package:simple_product_lister/constants/global.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   void checkServer() async {
//     try {
//       String path = api;
//       var dio = Dio();
//       var response = await dio.get(path);
//       // print(response);

//       Navigator.pushNamedAndRemoveUntil(
//         context,
//         '/productPage',
//         (route) => false,
//       );
//     } catch (e) {
//       print(e);
//     }
//   }

//   void startTimer() {
//     const oneSec = Duration(seconds: 1);
//     timer = Timer.periodic(oneSec, (Timer timer) async {
//       if (limit_time_splashScreen == 0) {
//         timer.cancel();
//         // Navigator.pushNamedAndRemoveUntil(context, '/navbarMenu', (route) => false);
//         showDialog(
//           barrierDismissible: false,
//           context: context,
//           builder: (context) => SplashDialog(
//             title: '',
//             content:
//                 'ไม่สามารถเข้าแอปพลิเคชั่นได้ ณ ขณะนี้ เนื่องจากระบบขัดข้อง กรุณากลับมาอีกครั้งภายหลังหรือจนกว่าระบบจะได้รับการแก้ไข',
//             onConfirm: () {
//               exit(0);
//             },
//             buttonAcceptText: 'ตกลง',
//           ),
//         );
//         print("server not response");
//       } else {
//         checkServer();
//         setState(() {
//           limit_time_splashScreen--;
//         });
//       }
//     });
//   }

//   void checkDevicesInfo() async {
//     final deviceInfoPlugin = DeviceInfoPlugin();
//     final deviceInfo = await deviceInfoPlugin.deviceInfo;
//     final allInfo = deviceInfo.data;
//     nameDevice = allInfo['name'];

//     print(nameDevice);
//     deviceHasNotch = listDeviceHasNotch.contains(nameDevice);
//     print(deviceHasNotch);
//   }

//   @override
//   void initState() {
//     super.initState();
//     checkDevicesInfo();
//     startTimer();
//   }

//   @override
//   void dispose() {
//     timer.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Center(child: Image.asset('asset/gif/walking.gif')));
//   }
// }
