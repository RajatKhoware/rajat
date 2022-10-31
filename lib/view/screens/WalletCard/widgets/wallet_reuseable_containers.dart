// //for colunm container
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:from_css_color/from_css_color.dart';
// import 'package:simple_gradient_text/simple_gradient_text.dart';
// import 'package:tambola_frontend/constants/new_gradints.dart';

// import '../../SelectRoom/widgets/coustom_button_text.dart';

// class WalletReuseableGradientContainer extends StatelessWidget {
//   final double width;
//   final double height;
//   final double width1;
//   final double height1;
//   final String text1;
//   final String text2;
//   final double fontsize;
//   final double fontsize1;
//   final double circular;
//   const WalletReuseableGradientContainer({
//     Key? key,
//     required this.width,
//     required this.height,
//     required this.width1,
//     required this.height1,
//     required this.text1,
//     required this.text2,
//     required this.fontsize,
//     required this.fontsize1,
//     required this.circular,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       builder: (context, child) => Container(
//         width: width.w,
//         height: height.h,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(circular.r),
//           gradient: RadialGradient(
//             colors: [
//               fromCssColor('#3DCCFE'),
//               fromCssColor('#006177'),
//             ],
//             radius: 1.5,
//           ),
//           boxShadow: const [
//             BoxShadow(
//               color: Color.fromARGB(171, 66, 72, 78),
//               offset: Offset(0.0, 6.0),
//               blurRadius: 4.0,
//             ),
//           ],
//         ),
//         child: Column(children: [
//           SizedBox(
//             height: 8.h,
//           ),
//           NewCoustomText(
//             text: text1,
//             fontsize: fontsize.sp,
//             fontWeight: FontWeight.bold,
//             color: [fromCssColor('#FFFFFF'), fromCssColor('#FFFFFF')],
//             shadowoffset: Offset(4.0, 4.0),
//             shawdowcolor: Color.fromARGB(123, 51, 51, 51),
//             shawdowradius: 10.0.r,
//           ),
//           SizedBox(
//             height: 3.h,
//           ),
//           Container(
//             width: width1.w,
//             height: height1.h,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20.r),
//               color: fromCssColor('#FFFFFF').withOpacity(0.5),
//               boxShadow: [
//                 BoxShadow(
//                   color:
//                       const Color.fromARGB(64, 179, 177, 177).withOpacity(0.2),
//                   offset: const Offset(0.0, 6.0),
//                   blurRadius: 4.0,
//                 ),
//               ],
//             ),
//             child: Center(
//               child: NewCoustomText(
//                 text: text2,
//                 fontsize: fontsize1.sp,
//                 fontWeight: FontWeight.bold,
//                 color: [fromCssColor('#FFFFFF'), fromCssColor('#FFFFFF')],
//                 shadowoffset: Offset(4.0, 4.0),
//                 shawdowcolor: Color.fromARGB(123, 51, 51, 51),
//                 shawdowradius: 10.0.r,
//               ),
//             ),
//           ),
//         ]),
//       ),
//       designSize: const Size(428, 926),
//     );
//   }
// }

// //for row container
// class WalletReuseableGradientContainer2 extends StatelessWidget {
//   final double width;
//   final double height;
//   final double width1;
//   final double height1;
//   final String text1;
//   final String text2;
//   final double fontsize;
//   final double fontsize1;
//   const WalletReuseableGradientContainer2({
//     Key? key,
//     required this.width,
//     required this.height,
//     required this.width1,
//     required this.height1,
//     required this.text1,
//     required this.text2,
//     required this.fontsize,
//     required this.fontsize1,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       builder: (context, child) => Container(
//         width: width.w,
//         height: height.h,
//         decoration: BoxDecoration(
//           boxShadow: [boxShadowWallet],
//           borderRadius: BorderRadius.circular(20.r),
//           gradient: RadialGradient(
//             colors: [
//               fromCssColor('#3DCCFE'),
//               fromCssColor('#006177'),
//             ],
//             radius: 1.2,
//           ),
//         ),
//         child: Row(children: [
//           SizedBox(width: 40.w),
//           Padding(
//             padding:
//                 EdgeInsets.only(top: 5.h, bottom: 5.h, left: 10.w, right: 20.w),
//             child: NewCoustomText(
//               text: text1,
//               fontsize: fontsize.sp,
//               fontWeight: FontWeight.bold,
//               color: newgreygradient.colors,
//               shadowoffset: Offset(4.0, 4.0),
//               shawdowcolor: Color.fromARGB(123, 51, 51, 51),
//               shawdowradius: 10.0.r,
//             ),
//           ),
//           SizedBox(width: 3.w),
//           Container(
//             width: width1.w,
//             height: height1.h,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20.r),
//               gradient: newfireliner,
//               boxShadow: const [
//                 BoxShadow(
//                   color: Color.fromARGB(144, 78, 85, 92),
//                   offset: Offset(0.0, 6.0),
//                   blurRadius: 4.0,
//                 ),
//               ],
//             ),
//             child: Center(
//               child: NewCoustomText(
//                 text: text2,
//                 fontsize: fontsize1.sp,
//                 fontWeight: FontWeight.bold,
//                 color: newgreygradient.colors,
//                 shadowoffset: Offset(4.0, 4.0),
//                 shawdowcolor: Color.fromARGB(123, 51, 51, 51),
//                 shawdowradius: 10.0.r,
//               ),
//             ),
//           )
//         ]),
//       ),
//       designSize: const Size(428, 926),
//     );
//   }
// }

// //for square containers
// class ReuseableSquareContainer extends StatelessWidget {
//   final double width;
//   final double height;
//   final String text1;
//   final String text2;
//   final double fontsize;
//   final double fontsize1;
//   const ReuseableSquareContainer({
//     Key? key,
//     required this.width,
//     required this.height,
//     required this.text1,
//     required this.text2,
//     required this.fontsize,
//     required this.fontsize1,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       builder: (context, child) => Container(
//         width: width.w,
//         height: height.h,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20.r),
//           gradient: RadialGradient(
//             colors: [
//               fromCssColor('#3DCCFE'),
//               fromCssColor('#006177'),
//             ],
//             radius: .5,
//           ),
//           boxShadow: [boxShadowWallet],
//         ),
//         child: Column(children: [
//           Row(
//             children: [
//               SizedBox(width: 35.w),
//               NewCoustomText(
//                 text: text1,
//                 fontsize: fontsize.sp,
//                 fontWeight: FontWeight.bold,
//                 color: newgreygradient.colors,
//                 shadowoffset: Offset(4.0, 4.0),
//                 shawdowcolor: Color.fromARGB(123, 51, 51, 51),
//                 shawdowradius: 10.0.r,
//               ),
//               Image.asset(
//                 "assets/images/coins.png",
//                 width: 60.w,
//                 height: 60.h,
//               ),
//             ],
//           ),
//           Text(
//             text2,
//             style: TextStyle(
//               fontSize: fontsize1.sp,
//               fontWeight: FontWeight.bold,
//               color: fromCssColor('#FFFFFF'),
//               shadows: const <Shadow>[
//                 Shadow(
//                   offset: Offset(4.0, 4.0),
//                   blurRadius: 10.0,
//                   color: Color.fromARGB(123, 51, 51, 51),
//                 ),
//               ],
//             ),
//           )
//         ]),
//       ),
//       designSize: const Size(428, 926),
//     );
//   }
// }
