import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/new_gradints.dart';
import '../AccountScreen/widgets/account_header.dart';
import '../SelectRoom/widgets/coustom_button_text.dart';


TextEditingController _playersController = TextEditingController();

// ignore: must_be_immutable
class InviteRoomScreen extends StatefulWidget {
  InviteRoomScreen({Key? key}) : super(key: key);

  @override
  State<InviteRoomScreen> createState() => _InviteRoomScreenState();
}

class _InviteRoomScreenState extends State<InviteRoomScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<String> matchType = ['Paid', 'Free'];
  String? selectedMatchType = 'Paid';

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: newpurpleredliner),
          child: Column(children: [
            AccountScreenHeader(),
            SizedBox(
              width: 428.w,
              height: 713.h,
              child: Column(children: [
                SizedBox(width: 428.w, height: 150.h),
                SizedBox(
                  width: 350.w,
                  height: 30.h,
                  child: Padding(
                    padding: EdgeInsets.only(left: 40.w),
                    child: NewCoustomText2(
                        text: "CREATE YOUR OWN ROOM",
                        fontsize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: newmetalliccard.colors),
                  ),
                ),
                SizedBox(height: 30.h),
                Container(
                  width: 378.w,
                  height: 370.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.sp),
                    gradient: newblacklinergradient,
                    border:
                        Border.all(width: 2.5.w, color: Colors.grey.shade300),
                  ),
                  child: Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 50.h),
                          Padding(
                            padding: EdgeInsets.only(left: 110.w),
                            child: NewCoustomText2(
                                text: "MATCH TYPE",
                                fontsize: 22.sp,
                                fontWeight: FontWeight.bold,
                                color: newmetalliccard.colors),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20.w, top: 20.h),
                            child: NewCoustomText2(
                              text: "NUMBER OF PLAYERS".tr,
                              fontsize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: newmetalliccard.colors,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: Container(
                                width: 350.w,
                                height: 31.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(9.r),
                                    gradient: newmetalliccard),
                                child: TextFormField(
                                  controller: _playersController,
                                  decoration: InputDecoration(
                                      labelText: "2 to 100",
                                      border: OutlineInputBorder(),
                                      errorBorder: OutlineInputBorder()),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "This field can't be left empty";
                                    }
                                    if (value.length < 1) {
                                      return "Min. 2 Players are must to play";
                                    }
                                    if (value.length > 3) {
                                      return "Max. Players is 100 ";
                                    } else {
                                      return null;
                                    }
                                  },
                                  style: TextStyle(fontSize: 12.sp),
                                ),
                              )),
                          Padding(
                            padding: EdgeInsets.only(left: 20.w, top: 20.h),
                            child: NewCoustomText2(
                              text: "MATCH TYPE".tr,
                              fontsize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: newmetalliccard.colors,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Padding(
                            padding: EdgeInsets.only(left: 10.w),
                            child: Container(
                              width: 350.w,
                              height: 31.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9.r),
                                  gradient: newmetalliccard),
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.w),
                                child: DropdownButton<String>(
                                  value: selectedMatchType,
                                  items: matchType
                                      .map(
                                        (e) => DropdownMenuItem<String>(
                                          value: e,
                                          child: Text(
                                            e,
                                            style: TextStyle(fontSize: 12.sp),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (e) =>
                                      setState(() => selectedMatchType = e),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30.h),
                          Padding(
                            padding: EdgeInsets.only(left: 28.w),
                            child: InkWell(
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  print("Validation Done");
                                }
                              },
                              child: CustomButton2(
                                  text: "CREATE ROOM",
                                  fontsize: 23.sp,
                                  fontWeight: FontWeight.bold,
                                  width: 310.w,
                                  width2: 284.w,
                                  height: 56.h,
                                  height2: 42.h,
                                  gradient1: newgreycarddarkliner,
                                  gradient2: newpurpleredliner,
                                  color: newgreygradient.colors),
                            ),
                          ),
                        ]),
                  ),
                )
              ]),
            )
          ]),
        ),
      ),
      designSize: const Size(428, 915),
    );
  }
}
