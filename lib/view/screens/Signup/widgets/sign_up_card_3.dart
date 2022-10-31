// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:tambola_frontend/models/user.dart' as user_model;
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:from_css_color/from_css_color.dart';
// import 'package:provider/provider.dart';
// import 'package:tambola_frontend/view/screens/Signup/SignUp_Screens/sign_up_screen_4.dart';

// import 'package:tambola_frontend/view/screens/Signup/widgets/text_form.dart';
// import 'package:tambola_frontend/view/components/gradient_text.dart';

// import '../../../constants/gradients.dart';
// import '../../../../controller/utils/showSnackBar.dart';
// import '../../../components/build_text_field.dart';
// import '../../SelectRoom/widgets/coustom_button_text.dart';

// class SignUpCard3 extends StatefulWidget {
//   //final User user;
//   final String? mobile;
//   const SignUpCard3({
//     Key? key,
//     this.mobile,
//   }) : super(key: key);

//   @override
//   State<SignUpCard3> createState() => _SignUpCard3State();
// }

// class _SignUpCard3State extends State<SignUpCard3> {
//   FirebaseAuth auth = FirebaseAuth.instance;
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   final TextEditingController _otpController = TextEditingController();
//   String _verifID = "";
//   int screenState = 0;

//   @override
//   void initState() {
//     //get the phone number from user object before build method to verify the number
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       user_model.User currentUser =
//           Provider.of<user_model.User>(context, listen: false);
//       debugPrint(currentUser.user.mobile.toString());
//       //call method to verify the phone number
//       _verifyPhone(currentUser.user.mobile.toString());
//     });

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       builder: (context, child) => Container(
//         width: 370.w,
//         height: 355.h,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(25.r),
//             gradient: metallicGradientwithOpacity),
//         child: SizedBox(
//           width: 358.w,
//           height: 328.h,
//           child: Column(
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(top: 20.h, left: 15.w, right: 15.w),
//                 child: SizedBox(
//                   width: 358.w,
//                   height: 74.h,
//                   child: Row(
//                     children: [
//                       IconButton(
//                         onPressed: () {
//                           Navigator.pushNamed(context, '/sign-up-2');
//                         },
//                         icon: const Icon(Icons.arrow_back_ios),
//                         iconSize: 30.0.sp,
//                         color: fromCssColor('#003240'),
//                       ),
//                       CoustomGradientText(
//                         text: "Play & Earn",
//                         gradient: blueLiner2Gradient,
//                         style: TextStyle(
//                           fontSize: 48.sp,
//                           fontFamily: 'IrishGrover',
//                           shadows: <Shadow>[
//                             Shadow(
//                               offset: Offset(0.0, 3.5),
//                               blurRadius: 6.0.r,
//                               color: Color.fromARGB(99, 0, 0, 0),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10.h),
//               NewCoustomText(
//                 text: "Resend otp : 00:10",
//                 fontsize: 16.sp,
//                 fontWeight: FontWeight.w600,
//                 color: [
//                   fromCssColor("#006B8D"),
//                   fromCssColor("#00181E"),
//                 ],
//               ),
//               SizedBox(height: 10.h),
//               Container(
//                 width: 358.w,
//                 height: 150.h,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(left: 28.w, top: 20.h),
//                       child: NewCoustomText(
//                         text: "CONFIRM OTP",
//                         fontsize: 11.sp,
//                         fontWeight: FontWeight.w600,
//                         color: [
//                           fromCssColor("#006B8D"),
//                           fromCssColor("#00181E"),
//                         ],
//                         shadowoffset: Offset(0.0, 5.0),
//                         shawdowcolor: Color.fromARGB(29, 0, 0, 0),
//                         shawdowradius: 6.r,
//                       ),
//                     ),
//                     SizedBox(height: 5.h),
//                     Consumer<user_model.User>(
//                       builder: (context, value, child) {
//                         return Form(
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           key: formKey,
//                           child: Column(
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.only(left: 20.w),
//                                 child: BuildTextField(
//                                   hieght: 30.h,
//                                   controller: _otpController,
//                                   type: TextInputType.number,
//                                   maxLength: 6,
//                                   hintText: 'ENTER OTP',
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(top: 15.h, left: 20.w),
//                                 child: InkWell(
//                                   onTap: () {
//                                     if (formKey.currentState!.validate()) {
//                                       value.user.username = _otpController.text;
//                                     }
//                                     _verifyOTP(_otpController);
//                                     Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: ((context) =>
//                                                  NewSignUpScreen4(
//                                                   mobile: widget.mobile!,
//                                                 ))));
//                                   },
//                                   child: CustomButton2(
//                                     text: "Next",
//                                     fontsize: 21.sp,
//                                     fontWeight: FontWeight.bold,
//                                     width: 173.w,
//                                     width2: 150.w,
//                                     height: 45.h,
//                                     height2: 35.h,
//                                     gradient1: blueLiner2Gradient,
//                                     gradient2: metallicGradient,
//                                     color: [
//                                       fromCssColor("#006B8D"),
//                                       fromCssColor("#00181E"),
//                                     ],
//                                     shadowoffset: Offset(0.0, 3.0),
//                                     shawdowcolor: Color.fromARGB(71, 0, 0, 0),
//                                     shawdowradius: 6.r,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                     // Padding(
//                     //   padding: EdgeInsets.only(left: 6.w),
//                     //   child: CoustomTextformfield(
//                     //       labeltext: "Enter 6 Digit OTP Here"),
//                     // ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

// //firebase method to verify the phone number and send the otp
//   _verifyPhone(String phoneNumber) async {
//     await auth.verifyPhoneNumber(
//         timeout: const Duration(seconds: 60),
//         phoneNumber: "+91$phoneNumber",
//         verificationCompleted: (PhoneAuthCredential credential) {
//           //signing the user
//           FirebaseAuth.instance
//               .signInWithCredential(credential)
//               .then((value) async {
//             if (value.user != null) {
//               showSnackBarText(context, "User Authenticated!");
//             }
//           });
//         },
//         verificationFailed: (FirebaseAuthException e) {
//           showSnackBarText(context, "Authentication Failed");
//         },
//         codeSent: (String verficationID, int? resendToken) {
//           showSnackBarText(context, "OTP sent to the number");
//           setState(() {
//             _verifID = verficationID;
//             screenState = 1;
//           });
//         },
//         codeAutoRetrievalTimeout: (String verifID) {
//           setState(() {
//             _verifID = verifID;
//           });
//           showSnackBarText(context, "Timeout!");
//         });
//   }

// //verifying the entered otp against the user entered otp
//   Future<void> _verifyOTP(value) async {
//     await auth
//         .signInWithCredential(PhoneAuthProvider.credential(
//             verificationId: _verifID, smsCode: _otpController.text))
//         .whenComplete(() {
//       showSnackBarText(context, "OTP verified!");
//     });
//   }
// }
