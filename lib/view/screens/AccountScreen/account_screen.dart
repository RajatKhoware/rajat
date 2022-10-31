import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tambola_frontend/view/screens/AccountScreen/widgets/account_colunms.dart';
import 'package:tambola_frontend/view/screens/AccountScreen/widgets/account_header.dart';
import 'package:tambola_frontend/view/screens/AccountScreen/widgets/bottom_buttons.dart';
import 'package:tambola_frontend/view/screens/AccountScreen/widgets/ellipse.dart';
import 'package:tambola_frontend/view/screens/AccountScreen/widgets/refer_earn.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        body: Column(
          children: [
            AccountScreenHeader(),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Ellipse(),
                  AccountColunm1(),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                    child: AccountColunm2(),
                  ),
                  ReferContainer(),
                  CircularButtons(),
                ],
              ),
            ),
          ],
        ),
      ),
      designSize: const Size(428, 926),
    );
  }
}
