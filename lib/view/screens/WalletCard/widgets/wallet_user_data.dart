import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:from_css_color/from_css_color.dart';

class WallletUserData extends StatelessWidget {
  const WallletUserData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w, bottom: 15.h),
            child: CircleAvatar(
              radius: 50.r,
              child: Image.asset(
                'assets/images/avg.png',
                width: 120.w,
                height: 120.h,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40.w, bottom: 15.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "User Name",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.sp,
                    shadows: const <Shadow>[
                      Shadow(
                        offset: Offset(4.0, 4.0),
                        blurRadius: 10.0,
                        color: Color.fromARGB(123, 51, 51, 51),
                      ),
                    ],
                    color: fromCssColor('#555555')),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Text(
                  "User ID",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                      shadows: const <Shadow>[
                        Shadow(
                          offset: Offset(4.0, 4.0),
                          blurRadius: 8.0,
                          color: Color.fromARGB(123, 65, 64, 64),
                        ),
                      ],
                      color: fromCssColor('#FF0000')),
                ),
              )
            ]),
          )
        ],
      ),
      designSize: const Size(428, 926),
    );
  }
}
