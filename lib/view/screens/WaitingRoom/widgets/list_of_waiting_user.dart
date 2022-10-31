// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';

import '../../../constants/new_gradints.dart';
import '../../SelectRoom/widgets/coustom_button_text.dart';


class ListOfWaitingUser extends StatelessWidget {
  final ImageProvider provider;
  const ListOfWaitingUser({
    Key? key,
    required this.provider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Container(
        width: 270.w,
        height: 80.h,
        child: Row(
          children: [
            SizedBox(width: 10.w),
            CircleAvatar(
              backgroundImage: provider,
              radius: 35.r,
            ),
            SizedBox(width: 15.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                NewCoustomText2(
                    text: "User Name".tr,
                    fontsize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: newblacklinergradient.colors),
                SizedBox(height: 5.h),
                NewCoustomText2(
                    text: "User ID".tr,
                    fontsize: 11.sp,
                    fontWeight: FontWeight.bold,
                    color: newredliner.colors),
              ],
            )
          ],
        ),
      ),
      designSize: const Size(428, 926),
    );
  }
}
