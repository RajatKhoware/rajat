import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tambola_frontend/controller/providers/user_provider.dart';
import 'package:tambola_frontend/controller/utils/baseclass.dart';
import 'package:tambola_frontend/models/user.dart' as user_model;
import 'package:tambola_frontend/view/constants/gradients.dart';
import 'package:tambola_frontend/view/screens/Signup/SignUp_Screens/sign_up_screen_4.dart';
import 'package:tambola_frontend/view/screens/Signup/password_page.dart';
import 'package:tambola_frontend/controller/utils/showSnackBar.dart';
import 'package:tambola_frontend/view/components/build_text_field.dart';
import 'package:tambola_frontend/view/components/custom_text.dart';
import 'package:tambola_frontend/view/components/customized_button.dart';
import 'package:tambola_frontend/view/components/gradient_text.dart';
import 'package:tambola_frontend/view/components/heading_text.dart';

class OTPPage extends StatefulWidget {
  //final User user;
  final String mobile;
  final String userName;
  const OTPPage({required this.mobile, Key? key, required this.userName})
      : super(key: key);

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> with BaseClass {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();
  String _verifID = "";
  int screenState = 0;

  @override
  void initState() {
    //get the phone number from user object before build method to verify the number
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // user_model.User currentUser =
      // Provider.of<user_model.User>(context, listen: false);
      // debugPrint(currentUser.user.mobile.toString());
      //call method to verify the phone number
      await _verifyPhone(widget.mobile);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        //adding the background image
        child: Container(
          height: size.height,
          decoration: const BoxDecoration(
              // image: DecorationImage(
              //     image: AssetImage(
              //       'assets/images/background.png',
              //     ),
              //     fit: BoxFit.cover),
              ),
          child: Column(
            children: [
              //adding the infographic
              // const Image(image: AssetImage('assets/videos/info4.gif')),
              Expanded(child: Container()),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                margin: const EdgeInsets.only(bottom: 0),
                height: size.height * 0.42,
                //adding shape to the container
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  gradient: metallicGradientwithOpacity,
                ),
                child: Column(children: [
                  Center(
                    child: HeadingText(
                      isVisible: false,
                      fontSize: 46.sp,
                      textGradient: blueLiner2Gradient,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const CoustomGradientText(
                    text: 'Sign up',
                    gradient: blueLiner2Gradient,
                    style: CustomTextStyle(
                        fontWeight: FontWeight.w600, fontSize: 21),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Consumer<UserProvider>(builder: (context, value, child) {
                    return Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: formKey,
                      child: Column(
                        children: [
                          BuildTextField(
                            controller: _otpController,
                            type: TextInputType.number,
                            maxLength: 6,
                            label: 'ENTER OTP SENT',
                            hintText: 'ENTER OTP',
                            color: const Color.fromARGB(255, 255, 225, 115),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomizedButton(
                              buttonBackgroundGradient: blueLiner2Gradient,
                              buttonGradient: fireLinearGradient,
                              buttonText: "Done",
                              handleClick: () async {
                                showLoader(context, "Verifying...");
                                if (formKey.currentState!.validate()) {
                                  // value.user.username = _otpController.text;
                                }
                                await _verifyOTP(_otpController.text, context)
                                    .then((value) async {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: ((context) =>
                                  //              NewSignUpScreen4(
                                  //               mobile: widget.mobile,
                                  //             ))));
                                  // pushNamedAndRemoveUntil(context: context, destination: '/sign-up-4');
                                });
                              })
                        ],
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

//firebase method to verify the phone number and send the otp
  Future _verifyPhone(String phoneNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        timeout: const Duration(seconds: 60),
        phoneNumber: "+91" + phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {
          //signing the user
          FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.credential != null) {
              showSnackBarText(context, "User Authenticated!");
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          showSnackBarText(context, "Authentication Failed");
        },
        codeSent: (String verficationID, int? resendToken) {
          showSnackBarText(context, "OTP sent to the number");
          setState(() {
            _verifID = verficationID;
            screenState = 1;
          });
        },
        codeAutoRetrievalTimeout: (String verifID) {
          setState(() {
            _verifID = verifID;
          });
          // showSnackBarText(context, "Timeout!");
        });
  }

//verifying the entered otp against the user entered otp
  Future<void> _verifyOTP(String value, BuildContext context) async {
    await FirebaseAuth.instance
        .signInWithCredential(PhoneAuthProvider.credential(
            verificationId: _verifID, smsCode: value))
        .whenComplete(() async {
      showSnackBarText(context, "Phone number verified!");
      Navigator.pushNamed(context, '/sign-up-4',
          arguments:
              SignUpArg(mobile: widget.mobile, userName: widget.userName));
    });
  }
}
