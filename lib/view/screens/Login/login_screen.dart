import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tambola_frontend/controller/utils/baseclass.dart';
import 'package:tambola_frontend/view/components/build_text_field.dart';
import 'package:tambola_frontend/view/constants/gradients.dart';
import 'package:tambola_frontend/controller/services/auth_service.dart';
import 'package:tambola_frontend/view/constants/new_gradints.dart';
import 'package:tambola_frontend/view/screens/SelectRoom/widgets/coustom_button_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with BaseClass {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _auth = AuthService();
  loginOnTap() async {
    showLoader(context);

    FocusManager.instance.primaryFocus?.unfocus();
    _auth.signInWithUsernameOrPhone(
        username: _usernameController.text,
        password: _passwordController.text,
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: screenSize.height,
            width: 428.w,
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            decoration: const BoxDecoration(gradient: blueLiner2Gradient),
            child: Column(
              children: [
                SizedBox(height: 50.h),
                SizedBox(
                  width: 280.w,
                  height: 68.h,
                  child: Image.asset(
                    "assets/icons/Tambola.png",
                  ),
                ),
                SizedBox(height: 30.h),
                Center(
                    child: NewCoustomText2(
                        text: "WELCOME".tr,
                        fontsize: 25.sp,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                        color: newmetalliccard.colors)),
                SizedBox(height: 30.h),
                NewCoustomText2(
                    text: "Login / Sign UP".tr,
                    fontsize: 19.sp,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w600,
                    color: newmetalliccard.colors),
                SizedBox(height: 20.h),
                SizedBox(
                  width: 369.w,
                  // height: 250.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NewCoustomText2(
                          text: "   Email / Mobile No.".tr,
                          fontsize: 13.sp,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                          color: newmetalliccard.colors),
                      SizedBox(height: 10.h),
                      BuildTextField2(
                        label: 'EMAIL / MOBILE NO.'.tr,
                        hintText: 'ENTER YOUR EMAIL OR MOBILE NUMBER'.tr,
                        textGradient: fireLinearGradient,
                        controller: _usernameController,
                      ),
                      SizedBox(height: 25.h),
                      NewCoustomText2(
                          text: "   PASSWORD".tr,
                          fontsize: 13.sp,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                          color: newmetalliccard.colors),
                      SizedBox(height: 10.h),
                      BuildTextField2(
                        isHide: true,
                        label: 'PASSWORD'.tr,
                        hintText: 'PASSWORD'.tr,
                        type: TextInputType.visiblePassword,
                        textGradient: fireLinearGradient,
                        controller: _passwordController,
                      ),
                      SizedBox(height: 30.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: loginOnTap,
                            child: CustomButton2(
                                text: "Login".tr,
                                fontsize: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .fontSize!,
                                fontWeight: FontWeight.bold,
                                width: 145.w,
                                width2: 118.w,
                                height: 48.h,
                                height2: 32.h,
                                gradient1: newblacklinergradient,
                                gradient2: newmetalliccard,
                                color: newblacklinergradient.colors),
                          ),
                          // SizedBox(width: 30.w),
                          InkWell(
                            onTap: () async {
                              Navigator.pushNamed(context, '/sign-up-start');
                            },
                            child: CustomButton2(
                                text: "Sign Up".tr,
                                fontsize: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .fontSize!,
                                fontWeight: FontWeight.w500,
                                width: 145.w,
                                width2: 118.w,
                                height: 48.h,
                                height2: 32.h,
                                gradient1: newmetalliccard,
                                gradient2: newblacklinergradient,
                                color: newmetalliccard.colors),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.h),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/bottom-bar');
                  },
                  child: CustomButton2(
                      text: "Guest".tr,
                      fontsize: 23.sp,
                      fontWeight: FontWeight.w500,
                      width: 180.w,
                      width2: 150.w,
                      height: 48.h,
                      height2: 32.h,
                      gradient1: newfireliner,
                      gradient2: newblacklinergradient,
                      color: newfireliner.colors),
                ),
                SizedBox(height: 30.h),
                // SocialLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SocialLogin extends StatelessWidget {
  const SocialLogin({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: NewCoustomText2(
              text: "SIGN UP /LOGIN IN WITH".tr,
              fontsize: 16.sp,
              fontFamily: "Inter",
              fontWeight: FontWeight.w600,
              color: newmetalliccard.colors),
        ),
        SizedBox(height: 15.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 23.r,
              backgroundImage: AssetImage("assets/logos/google.jpg"),
              backgroundColor: Colors.white,
            ),
            SizedBox(width: 25.w),
            CircleAvatar(
              radius: 23.r,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/logos/fb.png"),
            ),
          ],
        )
      ],
    );
  }
}
