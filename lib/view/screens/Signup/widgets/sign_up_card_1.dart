import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tambola_frontend/controller/providers/user_provider.dart';
import 'package:tambola_frontend/view/constants/new_gradints.dart';
import 'package:tambola_frontend/view/screens/Signup/SignUp_Screens/sign_up_screen_2.dart';
import 'package:tambola_frontend/view/screens/Signup/SignUp_Screens/sign_up_screen_3.dart';

import '../../../constants/gradients.dart';
import '../../../../models/user.dart';
import '../../../components/build_text_field.dart';
import '../../SelectRoom/widgets/coustom_button_text.dart';

TextEditingController _nameController = TextEditingController();

class SignUpCard1 extends StatefulWidget {
  const SignUpCard1({Key? key}) : super(key: key);

  @override
  State<SignUpCard1> createState() => _SignUpCard1State();
}

class _SignUpCard1State extends State<SignUpCard1> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 398.w,
            // height: 384.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.r),
                gradient: metallicGradientwithOpacity),
            child: SizedBox(
              width: 358.w,
              height: 353.h,
              child: Column(children: [
                SizedBox(
                  width: 286.w,
                  height: 136.h,
                  child: Column(
                    children: [
                      NewCoustomText(
                        text: "Bonzo",
                        fontsize: 50.sp,
                        fontFamily: 'IrishGrover',
                        fontWeight: FontWeight.w500,
                        color: newblue2liner.colors,
                        shadowoffset: Offset(0.0, 5.0),
                        shawdowcolor: Color.fromARGB(29, 0, 0, 0),
                        shawdowradius: 6.r,
                      ),
                      NewCoustomText(
                        text: "Welcome",
                        fontsize: 28.sp,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
                        color: newblue2liner.colors,
                        shadowoffset: Offset(0.0, 5.0),
                        shawdowcolor: Color.fromARGB(29, 0, 0, 0),
                        shawdowradius: 6.r,
                      ),
                      NewCoustomText(
                        text: "Sign UP",
                        fontsize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: newblue2liner.colors,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.h),
                SizedBox(
                    width: 350.w,
                    height: 122.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 25.w),
                          child: NewCoustomText(
                            text: "USER NAME",
                            fontsize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: newblue2liner.colors,
                            shadowoffset: Offset(0.0, 5.0),
                            shawdowcolor: Color.fromARGB(29, 0, 0, 0),
                            shawdowradius: 6.r,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Consumer<UserProvider>(
                          builder: ((context, value, child) {
                            return Form(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              key: formKey,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.w),
                                    child: BuildTextField(
                                      hieght: 35.h,
                                      width: 318.w,
                                      controller: _nameController,
                                      hintText: 'Username',
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 15.h, left: 18.w),
                                    child: InkWell(
                                      onTap: () {
                                        if (formKey.currentState!.validate()) {
                                          // value.user.username =
                                          //     _nameController.text;
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: ((context) =>
                                          //             NewSignUpScreen2(
                                          // userName:
                                          //     _nameController
                                          //         .text,
                                          // ))));
                                          Navigator.pushNamed(
                                              context, '/sign-up-2',
                                              arguments: SignUpNameArg(
                                                  userName: _nameController.text
                                                      .trim()));
                                        }
                                      },
                                      child: CustomButton2(
                                        text: "Get Started",
                                        fontsize: 19.sp,
                                        fontWeight: FontWeight.bold,
                                        width: 218.w,
                                        width2: 188.w,
                                        height: 38.h,
                                        height2: 28.h,
                                        gradient1: blueLiner2Gradient,
                                        gradient2: metallicGradient,
                                        color: newblue2liner.colors,
                                        shadowoffset: Offset(0.0, 3.0),
                                        shawdowcolor:
                                            Color.fromARGB(71, 0, 0, 0),
                                        shawdowradius: 6.r,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 50.w),
                  child: Center(
                    child: Row(
                      children: [
                        NewCoustomText(
                          text: "Aready have an account ?",
                          fontsize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: newblue2liner.colors,
                          shadowoffset: Offset(0.0, 5.0),
                          shawdowcolor: Color.fromARGB(29, 0, 0, 0),
                          shawdowradius: 6.r,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: NewCoustomText(
                            text: " Login",
                            fontsize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: newredliner.colors,
                            shadowoffset: Offset(0.0, 5.0),
                            shawdowcolor: Color.fromARGB(29, 0, 0, 0),
                            shawdowradius: 6.r,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
