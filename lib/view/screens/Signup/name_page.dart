// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:tambola_frontend/view/constants/colors.dart';
// import 'package:tambola_frontend/view/constants/gradients.dart';
// import 'package:tambola_frontend/models/user.dart';
// import 'package:tambola_frontend/view/screens/Signup/number_page.dart';
// import 'package:tambola_frontend/view/components/build_text_field.dart';
// import 'package:tambola_frontend/view/components/custom_text.dart';
// import 'package:tambola_frontend/view/components/customized_button.dart';
// import 'package:tambola_frontend/view/components/gradient_text.dart';
// import 'package:tambola_frontend/view/components/heading_text.dart';

// TextEditingController _nameController = TextEditingController();

// class NamePage extends StatefulWidget {
//   //final User user;
//   const NamePage({Key? key}) : super(key: key);

//   @override
//   State<NamePage> createState() => _NamePageState();
// }

// class _NamePageState extends State<NamePage> {
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(0),
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
//               const Image(image: AssetImage('assets/videos/info2.gif')),
//               Expanded(
//                 child: Container(),
//               ),
//               Container(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
//                 height: size.height * 0.5,
//                 decoration: const BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(30),
//                         topRight: Radius.circular(30)),
//                     gradient: fireLinearGradient),
//                 child: Column(children: [
//                   const Center(
//                       child: HeadingText(
//                     fontSize: 65,
//                     textGradient: blueLiner2Gradient,
//                   )),
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
//                   Consumer<User>(
//                     builder: ((context, value, child) {
//                       return Form(
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         key: formKey,
//                         child: Column(
//                           children: [
//                             BuildTextField(
//                               controller: _nameController,
//                               label: 'FULL NAME',
//                               hintText: 'ENTER YOUR FULL NAME',
//                               color: const Color.fromARGB(255, 255, 225, 115),
//                             ),
//                             const SizedBox(
//                               height: 25,
//                             ),
//                             CustomizedButton(
//                                 buttonBackgroundGradient: blueLiner2Gradient,
//                                 buttonGradient: fireLinearGradient,
//                                 buttonText: "Login",
//                                 textColor: kBackgroundGradient1,
//                                 handleClick: () {
//                                   if (formKey.currentState!.validate()) {
//                                     value.user.username = _nameController.text;
//                                     Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: ((context) =>
//                                                 const NumberPage())));
//                                   }
//                                 })
//                           ],
//                         ),
//                       );
//                     }),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   RichText(
//                       text: TextSpan(children: [
//                     const TextSpan(
//                       text: "Already have an account?",
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold, color: Colors.black),
//                     ),
//                     WidgetSpan(
//                         child: GestureDetector(
//                       onTap: () {},
//                       child: const Text(
//                         "Next",
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
