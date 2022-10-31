import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tambola_frontend/view/constants/new_gradints.dart';
import 'package:tambola_frontend/view/screens/AccountScreen/widgets/account_header.dart';
import 'package:tambola_frontend/view/screens/SelectRoom/widgets/coustom_button_text.dart';

import '../widgets/t_and_c_text.dart';

class TandCCard extends StatelessWidget {
  const TandCCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        body: Column(
          children: [
            AccountScreenHeader(),
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(top: 50.h, left: 28.w, right: 30.w),
                children: [
                  Container(
                    width: 369.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NewCoustomText(
                            text: "TERMS & CONDITIONS",
                            fontsize: 25.sp,
                            fontWeight: FontWeight.bold,
                            color: newblue2liner.colors),
                        SizedBox(height: 20.h),
                        TandCText_A(),
                        TandCText_B_C_D(),
                        TandCText_I(),
                        TandCText_J(),
                        TandCText_K(),
                        TandCText_L(),
                        TandCText_M(),
                        TandCText_N(),
                        TandCText_O_P_Q(),
                        TandCText_R(),
                        TandCText_S(),
                        TandCText_T(),
                        TandCText_U_V_W(),
                        TandCText_X(),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      designSize: const Size(428, 926),
    );
  }
}
