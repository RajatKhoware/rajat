import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:from_css_color/from_css_color.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tambola_frontend/controller/lang/localization_service.dart';
import 'package:tambola_frontend/view/constants/gradients.dart';
import 'package:tambola_frontend/view/constants/new_gradints.dart';
// import 'package:tambola_frontend/view/screens/Login/login_screen.dart';
import 'package:tambola_frontend/view/screens/SelectRoom/widgets/coustom_button_text.dart';
import 'package:tambola_frontend/view/screens/Signup/widgets/language_down.dart';

class StartCard0 extends StatefulWidget {
  const StartCard0({Key? key}) : super(key: key);

  @override
  State<StartCard0> createState() => _StartCard0State();
}

class _StartCard0State extends State<StartCard0> {
  late String _language;
  final audioPlayer = AudioPlayer();

  @override
  void initState() {
    _language = LocalizationService().getCurrentLang();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Container(
        width: 398.w,
        height: 384.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(41.r),
          gradient: metallicGradientwithOpacity,
        ),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(top: 15.h, right: 20.h, left: 20.h),
            child: SizedBox(
              width: 351.w,
              height: 124.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 164.w,
                      height: 124.h,
                      child: Column(
                        children: [
                          SizedBox(
                            width: 159.w,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: NewCoustomText2(
                                text: "Welcome".tr,
                                fontsize: 30.sp,
                                fontWeight: FontWeight.w500,
                                color: newblue2liner.colors,
                              ),
                            ),
                          ),
                          SizedBox(height: 2.h),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: NewCoustomText(
                              text: "Select language".tr,
                              fontsize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: newblue2liner.colors,
                            ),
                          ),
                          SizedBox(height: 7.h),
                          LanguageDropDown(
                            languages: const [],
                            language: _language,
                            onChanged: (val) {
                              setState(() {
                                this._language = val;
                                LocalizationService().changeLocale(val);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  // SocialLoginStartScreen(),
                ],
              ),
            ),
          ),
          SizedBox(height: 5.h),
          Expanded(
            child: SizedBox(
              height: 153.h,
              width: 247.w,
              child: Column(children: [
                InkWell(
                  onTap: () {
                    // audioPlayer.play(AssetSource("audio/number1.mpeg"));
                    Navigator.pushNamed(context, '/bottom-bar');
                  },
                  child: CustomButton2(
                    text: "Guest Login".tr,
                    fontsize: 19.sp,
                    fontWeight: FontWeight.bold,
                    width: 220.w,
                    width2: 190.w,
                    height: 38.h,
                    height2: 28.h,
                    gradient1: blueLiner2Gradient,
                    gradient2: blueGradient,
                    color: newgreygradient.colors,
                  ),
                ),
                SizedBox(height: 8.h),
                InkWell(
                  onTap: () {
                     FocusManager.instance.primaryFocus?.unfocus();
                    Navigator.pushNamed(context, '/sign-up-1');
                  },
                  child: CustomButton2(
                    text: "Sign Up".tr,
                    fontsize: 19.sp,
                    fontWeight: FontWeight.bold,
                    width: 220.w,
                    width2: 190.w,
                    height: 38.h,
                    height2: 28.h,
                    gradient1: blueLiner2Gradient,
                    gradient2: blueGradient,
                    color: newgreygradient.colors,
                  ),
                ),
                SizedBox(height: 8.h),
                InkWell(
                  onTap: () {
                     FocusManager.instance.primaryFocus?.unfocus();
                    Navigator.pushNamed(context, '/login');
                  },
                  child: CustomButton2(
                    text: "Login".tr,
                    fontsize: 19.sp,
                    fontWeight: FontWeight.bold,
                    width: 220.w,
                    width2: 190.w,
                    height: 38.h,
                    height2: 28.h,
                    gradient1: blueLiner2Gradient,
                    gradient2: greyLinerGradient,
                    color: newblue2liner.colors,
                  ),
                )
              ]),
            ),
          )
        ]),
      ),

      //designSize: const Size(398, 384),
    );
  }
}

class SocialLoginStartScreen extends StatelessWidget {
  const SocialLoginStartScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 129.w,
      height: 118.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 8.h, left: 20.w),
            child: SizedBox(
              height: 50.h,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: NewCoustomText2(
                  text: "SIGN UP /LOGIN\n        IN WITH".tr,
                  fontsize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: newblue2liner.colors,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.h, left: 35.w),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16.r,
                  backgroundImage:
                      AssetImage("assets/logos/google.jpg"),
                  backgroundColor: Colors.white,
                ),
                SizedBox(width: 15.w),
                CircleAvatar(
                  radius: 16.r,
                  backgroundColor: Colors.white,
                  backgroundImage:
                      AssetImage("assets/logos/fb.png"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
