// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:tambola_frontend/view/constants/colors.dart';
// import 'package:tambola_frontend/view/constants/gradients.dart';
// import 'package:tambola_frontend/view/screens/Signup/name_page.dart';
// import 'package:tambola_frontend/view/components/custom_text.dart';
// import 'package:tambola_frontend/view/components/customized_button.dart';

// import '../../components/gradient_text.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({Key? key}) : super(key: key);

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

// class _SignUpScreenState extends State<SignUpScreen> {
//   GoogleSignInAccount? _currentUser;

//   @override
//   void initState() {
//     _googleSignIn.onCurrentUserChanged.listen((account) {
//       setState(() {
//         _currentUser = account;
//       });
//     });
//     _googleSignIn.signInSilently();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     late GoogleSignInAccount? user = _currentUser;
//     Size size = MediaQuery.of(context).size;

//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           height: size.height,
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage(
//                   'assets/images/background.png',
//                 ),
//                 fit: BoxFit.cover),
//           ),
//           child: Column(
//             children: [
//               const Image(
//                 image: AssetImage('assets/videos/info1.gif'),
//               ),
//               Expanded(child: Container()),
//               Container(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//                 height: 350,
//                 decoration: const BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(30),
//                         topRight: Radius.circular(30)),
//                     gradient: fireLinearGradient),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Column(
//                           children: [
//                             const CoustomGradientText(
//                               text: 'Welcome',
//                               gradient: blueLiner2Gradient,
//                               style: CustomTextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 35,
//                                   fontFamily: 'Inter'),
//                             ),
//                             const SizedBox(height: 5),
//                             Form(
//                               child: Column(
//                                 children: const [
//                                   CoustomGradientText(
//                                     text: 'Select language',
//                                     gradient: blueLiner2Gradient,
//                                     style: CustomTextStyle(
//                                         fontWeight: FontWeight.w600,
//                                         fontSize: 21,
//                                         fontFamily: 'Inter'),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             Container(
//                                 width: 150,
//                                 height: 25,
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 10),
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(20),
//                                     color: Colors.white),
//                                 child: DropdownButton(
//                                   items: const [
//                                     DropdownMenuItem(
//                                       value: "Eng",
//                                       child: Text("English"),
//                                     ),
//                                     DropdownMenuItem(
//                                       value: "Hin",
//                                       child: Text("Hindi"),
//                                     )
//                                   ],
//                                   value: "Eng",
//                                   onChanged: null,
//                                 )),
//                           ],
//                         ),
//                         const SizedBox(
//                           width: 20,
//                         ),
//                         Column(
//                           children: [
//                             const CoustomGradientText(
//                               text: "SIGN UP / LOGIN WITH",
//                               gradient: blueLiner2Gradient,
//                               style:
//                                   CustomTextStyle(fontWeight: FontWeight.w600),
//                             ),
//                             const SizedBox(
//                               height: 15,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 GestureDetector(
//                                   onTap: signInGoogle,
//                                   child: Container(
//                                       padding: const EdgeInsets.all(5),
//                                       height: 40,
//                                       width: 40,
//                                       decoration: const BoxDecoration(
//                                           shape: BoxShape.circle,
//                                           color: Colors.white),
//                                       child: const Image(
//                                         image: AssetImage(
//                                             'assets/logos/google-logo.png'),
//                                       )),
//                                 ),
//                                 const SizedBox(
//                                   width: 30,
//                                 ),
//                                 Container(
//                                     height: 40,
//                                     width: 40,
//                                     decoration: const BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         color: Colors.white),
//                                     child: const CircleAvatar(
//                                       backgroundImage: AssetImage(
//                                           'assets/logos/facebook-white-logo.png'),
//                                     ))
//                               ],
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 25,
//                     ),
//                     CustomizedButton(
//                         buttonBackgroundGradient: blueLiner2Gradient,
//                         buttonGradient: fireLinearGradient,
//                         textColor: kBackgroundGradient1,
//                         buttonText: "Sign Up",
//                         handleClick: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: ((context) => const NamePage())));
//                         }),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     CustomizedButton(
//                         buttonBackgroundGradient: blueLiner2Gradient,
//                         buttonGradient: fireLinearGradient,
//                         buttonText: "Login",
//                         textColor: kBackgroundGradient1,
//                         handleClick: () {
//                           Navigator.pushNamed(context, '/login');
//                         })
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// Future<void> signInGoogle() async {
//   try {
//     await _googleSignIn.signIn();
//   } catch (e) {
//     debugPrint('Error while signing in');
//   }
// }
