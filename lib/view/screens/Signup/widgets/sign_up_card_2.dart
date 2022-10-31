import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tambola_frontend/controller/providers/user_provider.dart';
import 'package:tambola_frontend/view/screens/Signup/SignUp_Screens/sign_up_screen_3.dart';
import 'package:tambola_frontend/view/components/gradient_text.dart';
import 'package:tambola_frontend/view/screens/Signup/otp_page.dart';

import '../../../constants/gradients.dart';
import '../../../components/build_text_field.dart';
import '../../SelectRoom/widgets/coustom_button_text.dart';

TextEditingController _numberController = TextEditingController();

class SignUpCard2 extends StatefulWidget {
  final String userName;
  const SignUpCard2({Key? key, required this.userName}) : super(key: key);

  @override
  State<SignUpCard2> createState() => _SignUpCard2State();
}

class _SignUpCard2State extends State<SignUpCard2> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<SharedPreferences> preferences = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return

        //  ScreenUtilInit(
        //     builder: (context, child) =>

        Container(
      width: 384.w,
      height: 385.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          gradient: metallicGradientwithOpacity),
      child: Padding(
        padding:
            EdgeInsets.only(top: 20.h, bottom: 20.h, left: 13.w, right: 13.w),
        child: SizedBox(
          width: 358.w,
          height: 333.h,
          child: Column(children: [
            SizedBox(
              width: 326.w,
              height: 66.h,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/sign-up-1');
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                    iconSize: 30.0.sp,
                    color: fromCssColor('#003240'),
                  ),
                  SizedBox(width: 10.w),
                  CoustomGradientText(
                    text: "Tambola",
                    gradient: blueLiner2Gradient,
                    style: TextStyle(
                      fontSize: 58.sp,
                      fontFamily: 'IrishGrover',
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(0.0, 3.5),
                          blurRadius: 6.0.r,
                          color: Color.fromARGB(99, 0, 0, 0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            NewCoustomText(
              text: "Sign UP",
              fontsize: 19.sp,
              fontWeight: FontWeight.w600,
              color: [
                fromCssColor("#006B8D"),
                fromCssColor("#00181E"),
              ],
            ),
            SizedBox(height: 3.h),
            Container(
              width: 358.w,
              height: 153.h,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 12.w, top: 15.h),
                      child: NewCoustomText(
                        text: "MOBILE NUMBER",
                        fontFamily: 'Montserrat',
                        fontsize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: [
                          fromCssColor("#006B8D"),
                          fromCssColor("#00181E"),
                        ],
                        shadowoffset: Offset(0.0, 5.0),
                        shawdowcolor: Color.fromARGB(29, 0, 0, 0),
                        shawdowradius: 6.r,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Consumer<UserProvider>(
                      builder: ((context, value, child) {
                        return Form(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          key: formKey,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: BuildTextField(
                                  width: 335.w,
                                  hieght: 30.h,
                                  controller: _numberController,
                                  type: TextInputType.number,
                                  hintText: 'ENTER 10 DIGIT MOBILE NUMBER',
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10.h, left: 20.w),
                                child: InkWell(
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      // value.user.mobile =
                                      //    int.parse( _numberController.text);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: ((context) => OTPPage(
                                                  userName: widget.userName,
                                                  mobile: _numberController.text
                                                      .trim(),
                                                )),
                                          ));
                                    }
                                  },
                                  child: CustomButton2(
                                    text: "Next",
                                    fontsize: 21.sp,
                                    fontWeight: FontWeight.bold,
                                    width: 173.w,
                                    width2: 150.w,
                                    height: 45.h,
                                    height2: 35.h,
                                    gradient1: blueLiner2Gradient,
                                    gradient2: metallicGradient,
                                    color: [
                                      fromCssColor("#006B8D"),
                                      fromCssColor("#00181E"),
                                    ],
                                    shadowoffset: Offset(0.0, 3.0),
                                    shawdowcolor: Color.fromARGB(71, 0, 0, 0),
                                    shawdowradius: 6.r,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 73.w, top: 10.h),
                      child: InkWell(
                        onTap: () {
                          debugPrint(
                              "This is the user pressed answer ${_numberController.text}");
                        },
                        child: NewCoustomText(
                          text: "Aready have an account ?",
                          fontsize: 15.sp,
                          //fontfamily: "Montserrat",
                          fontWeight: FontWeight.bold,
                          color: [
                            fromCssColor("#006B8D"),
                            fromCssColor("#00181E"),
                          ],
                          shadowoffset: Offset(0.0, 5.0),
                          shawdowcolor: Color.fromARGB(29, 0, 0, 0),
                          shawdowradius: 6.r,
                        ),
                      ),
                    )
                  ]),
            )
          ]),
        ),
      ),
    );
    // );
  }
}
