// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:tambola_frontend/view/constants/colors.dart';
// import 'package:tambola_frontend/view/constants/gradients.dart';
// import 'package:tambola_frontend/models/user.dart';
// import 'package:tambola_frontend/view/screens/Signup/otp_page.dart';
// import 'package:tambola_frontend/view/components/build_text_field.dart';
// import 'package:tambola_frontend/view/components/custom_text.dart';
// import 'package:tambola_frontend/view/components/customized_button.dart';
// import 'package:tambola_frontend/view/components/gradient_text.dart';
// import 'package:tambola_frontend/view/components/heading_text.dart';

// TextEditingController _numberController = TextEditingController();

// class NumberPage extends StatefulWidget {
//   //final User user;
//   const NumberPage({Key? key}) : super(key: key);

//   @override
//   State<NumberPage> createState() => _NumberPageState();
// }

// class _NumberPageState extends State<NumberPage> {
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   Future<SharedPreferences> preferences = SharedPreferences.getInstance();

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           height: size.height,
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//                 //adding the background image
//                 image: AssetImage(
//                   'assets/images/background.png',
//                 ),
//                 fit: BoxFit.cover),
//           ),
//           child: Column(
//             children: [
//               const Image(image: AssetImage('assets/videos/info3.gif')),
//               Expanded(child: Container()),

//               //creating the shaped container
//               Container(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
//                 height: size.height * 0.42,
//                 decoration: const BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(30),
//                         topRight: Radius.circular(30)),
//                     gradient: fireLinearGradient),
//                 child: Column(children: [
//                   const Center(
//                     child: HeadingText(
//                       fontSize: 65,
//                       textGradient: blueLiner2Gradient,
//                     ),
//                   ),
//                   const SizedBox(height: 5),
//                   const CoustomGradientText(
//                     text: 'Sign up',
//                     gradient: blueLiner2Gradient,
//                     style: CustomTextStyle(
//                         fontWeight: FontWeight.w600, fontSize: 21),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   //consume the user provider for values
//                   Consumer<User>(
//                     builder: ((context, value, child) {
//                       return Form(
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         key: formKey,
//                         child: Column(
//                           children: [
//                             BuildTextField(
//                               controller: _numberController,
//                               type: TextInputType.number,
//                               label: 'MOBILE NUMBER',
//                               hintText: 'ENTER 10 DIGIT MOBILE NUMBER',
//                               color: const Color.fromARGB(255, 255, 225, 115),
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             CustomizedButton(
//                                 buttonBackgroundGradient: blueLiner2Gradient,
//                                 buttonGradient: fireLinearGradient,
//                                 buttonText: "Next",
//                                 textColor: kBackgroundGradient2,
//                                 handleClick: () {
//                                   if (formKey.currentState!.validate()) {
//                                     value.user.mobile = int.parse(_numberController.text);
//                                     Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: ((context) => OTPPage(
//                                               ,
//                                                 mobile:
//                                                     value.user.mobile.toString()))));
//                                   }
//                                 }),
//                           ],
//                         ),
//                       );
//                     }),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   //rich text for the span
//                   RichText(
//                       text: TextSpan(children: [
//                     const TextSpan(
//                       text: "Already have an account?",
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold, color: Colors.black),
//                     ),
//                     WidgetSpan(
//                         child: GestureDetector(
//                       onTap: () {
//                         debugPrint(
//                             "This is the user pressed answer ${_numberController.text}");
//                       },
//                       child: const Text(
//                         "Login",
//                         style: TextStyle(color: Colors.red),
//                       ),
//                     ))
//                   ]))
//                 ]),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
