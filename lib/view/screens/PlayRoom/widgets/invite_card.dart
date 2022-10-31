// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../../constants/new_gradints.dart';
import '../../SelectRoom/widgets/coustom_button_text.dart';

class InviteRoomCard extends StatefulWidget {
  const InviteRoomCard({
    Key? key,
  }) : super(key: key);

  @override
  State<InviteRoomCard> createState() => _InviteRoomCardState();
}

class _InviteRoomCardState extends State<InviteRoomCard> {
  @override
  Widget build(BuildContext context) {
    //SocketMethods socketMethods = SocketMethods();

    return ScreenUtilInit(
      builder: (context, child) => Container(
        height: 175.h,
        width: 364.12.w,
        padding: EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(
            gradient: newmetalliccard,
            boxShadow: [boxShadowWallet],
            borderRadius: BorderRadius.circular(30.r)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 5.0.h),
          Row(
            children: [
              SizedBox(width: 100.w),
              SizedBox(
                width: 160.w,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: NewCoustomText2(
                      text: 'Create your own room'.tr,
                      fontsize: 10.sp,
                      fontWeight: FontWeight.w600,
                      color: newtamatoredliner.colors),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.only(left: 22.w, top: 7.h),
            child: SizedBox(
              width: 332.w,
              height: 35.h,
              child: NewCoustomText2(
                text: "Invite Friends and family".tr,
                fontsize: 20.sp,
                fontWeight: FontWeight.bold,
                color: newtamatoredliner.colors,
               
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: 332.w,
              height: 52.h,
              child: Row(
                //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 15.w),
                  Image(
                    height: 40.h,
                    width: 31.w,
                    image: AssetImage('assets/images/Vector_3.png'),
                  ),
                  SizedBox(width: 10.w),
                  InkWell(
                      onTap: () async {
                     
                      },
                      child: CustomButton2(
                          text: "Play Now".tr,
                          fontsize: 23.sp,
                          fontWeight: FontWeight.bold,
                          width: 200.w,
                          width2: 170.w,
                          height: 52.h,
                          height2: 42.h,
                          gradient1: newtamatoredliner,
                          gradient2: newmetalliccard,
                          color: newtamatoredliner.colors)),
                  SizedBox(width: 10.w),
                  Image(
                    height: 40.h,
                    width: 31.w,
                    image: AssetImage('assets/images/Vector_3.png'),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
