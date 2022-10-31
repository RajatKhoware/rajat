import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:provider/provider.dart';
import 'package:tambola_frontend/controller/providers/wallet_provider.dart';
import 'package:tambola_frontend/view/constants/gradients.dart';
import 'package:tambola_frontend/view/screens/PlayRoom/widgets/invite_card.dart';
import 'package:tambola_frontend/view/screens/PlayRoom/widgets/royal_tambola_card.dart';
import 'package:tambola_frontend/view/screens/PlayRoom/widgets/select_room_practise_card.dart';
import 'package:tambola_frontend/view/screens/SelectRoom/widgets/coustom_button_text.dart';
import '../AccountScreen/widgets/account_header.dart';

class SelectRoomScreen extends StatefulWidget {
  const SelectRoomScreen({Key? key}) : super(key: key);

  @override
  State<SelectRoomScreen> createState() => _SelectRoomScreenState();
}

class _SelectRoomScreenState extends State<SelectRoomScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<WalletProvider>(context, listen: false).getWalletState();
    });
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: metallicGradient),
          child: Column(children: [
            AccountScreenHeader(),
            SizedBox(
              height: 10.h,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: 218.15.w,
                height: 50.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    gradient: blueLiner2Gradient),
                child: Row(
                  children: [
                    SizedBox(width: 15.w),
                    NewCoustomText(
                        text: "Select Game".tr,
                        fontsize: 25.sp,
                        fontWeight: FontWeight.w600,
                        color: metallicGradient.colors),
                    Expanded(
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: Icon(
                          Icons.info_outline,
                          size: 25.sp,
                          color: Color.fromARGB(255, 252, 165, 67),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                children: [
                  SizedBox(height: 10.h),
                  PractiseRoomCard(),
                  SizedBox(height: 20.h),
                  RoyalTambolaCard(),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ]),
        ),
        // bottomNavigationBar: NewNavBar(),
      ),
      designSize: const Size(428, 915),
    );
  }
}
