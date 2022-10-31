import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tambola_frontend/view/constants/gradients.dart';
import 'package:tambola_frontend/view/components/heading_text.dart';
import 'package:tambola_frontend/view/constants/new_gradints.dart';
import 'package:tambola_frontend/view/screens/SelectRoom/widgets/coustom_button_text.dart';


class AccountScreenHeader extends StatelessWidget {
  const AccountScreenHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Container(
        height: 119.h,
        width: double.infinity,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 0, 79, 143),
            offset: Offset(0.0, 3.0),
            blurRadius: 6.0,
          ),
        ], gradient: newblue2liner),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 33.99.h,
              decoration: BoxDecoration(gradient: greyLinerGradient),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(width: 0.w),
                  // IconButton(
                  //     onPressed: () {},
                  //     icon: Icon(
                  //       Icons.arrow_back,
                  //       color: Colors.white,
                  //     )),
                  NewCoustomText2(
                    text: "Bonzo",
                    fontsize: 25.sp,
                    fontFamily: 'IrishGrover',
                    fontWeight: FontWeight.w100,
                    color: newfireliner.colors,
                  ),
                  SizedBox(width: 110.w),
                  const Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                  SizedBox(width: 15.w),

                ],
              ),
            ),
            Flexible(child: HeadingText(fontSize: 34.sp)),
          ],
        ),
      ),
    );
  }
}
