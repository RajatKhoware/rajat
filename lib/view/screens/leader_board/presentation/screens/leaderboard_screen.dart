import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:tambola_frontend/view/screens/AccountScreen/widgets/account_header.dart';
import 'package:tambola_frontend/view/screens/SelectRoom/widgets/coustom_button_text.dart';

import '../../../../constants/new_gradints.dart';
import '../widgets/leader_board_list.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({Key? key}) : super(key: key);

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        body: Column(
          children: [
            AccountScreenHeader(),
            SizedBox(height: 10.h),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                child: Container(
                  width: 358.w,
                  height: 625.h,
                  decoration: BoxDecoration(
                      color: fromCssColor("#00647B"),
                      borderRadius: BorderRadius.circular(30.r)),
                  child: Column(
                    children: [
                      SizedBox(height: 10.h),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: NewCoustomText(
                            text: "Leader Board".tr,
                            fontsize: 25.sp,
                            fontWeight: FontWeight.w500,
                            color: newgreygradient.colors),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: 10.0.w, right: 10.w, top: 10.h, bottom: 10.h),
                        height: 38.h,
                        width: 339.w,
                        decoration: BoxDecoration(
                          color: fromCssColor('#00181E').withOpacity(.6),
                          borderRadius: BorderRadius.circular(10.0.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(3.0),
                          child: TabBar(
                            controller: tabController,
                            indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0.r),
                                gradient: newfireliner),
                            labelColor: Colors.white,
                            labelStyle: TextStyle(
                              fontFamily: 'Padauk',
                              fontSize: 16.0.sp,
                              fontWeight: FontWeight.w500,
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(0.0, 5.0),
                                  blurRadius: 10.r,
                                  color: Color.fromARGB(57, 0, 0, 0),
                                ),
                              ],
                            ),
                            unselectedLabelColor:
                                Color.fromARGB(255, 238, 164, 3),
                            unselectedLabelStyle: TextStyle(
                              fontFamily: 'Padauk',
                              fontSize: 16.0.sp,
                              fontWeight: FontWeight.w600,
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(0.0, 5.0),
                                  blurRadius: 10.r,
                                  color: Color.fromARGB(57, 0, 0, 0),
                                ),
                              ],
                            ),
                            tabs: [
                              Tab(text: "Weekly".tr),
                              Tab(text: "Monthly".tr),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: tabController,
                          children: [LB_WeeklyList(), LB_WeeklyList()],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      designSize: const Size(428, 926),
    );
  }
}

class LB_WeeklyList extends StatelessWidget {
  const LB_WeeklyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Padding(
        padding: EdgeInsets.only(left: 10.w, bottom: 25.h, right: 10.w),
        child: Container(
          width: 338.w,
          height: 505.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              gradient: newmetallicGradient),
          child: ListView(
            padding: EdgeInsets.only(top: 10.h, left: 5.w),
            children: [
              LB_ListView(
                profileImg: "assets/images/avg.png",
                text: "₹57000",
                prizeImg: "assets/images/Winner.png",
              ),
              LB_ListView(
                profileImg: "assets/images/avg.png",
                text: "₹48600",
                prizeImg: "assets/images/gold.png",
              ),
              LB_ListView(
                profileImg: "assets/images/avg.png",
                text: "₹46100",
                prizeImg: "assets/images/silver.png",
              ),
              LB_ListView(
                profileImg: "assets/images/avg.png",
                text: "₹32000",
                prizeImg: "assets/images/bronze.png",
              ),
              LB_ListView_2(
                profileImg: "assets/images/avg.png",
                text: "₹23230",
              ),
              LB_ListView_2(
                profileImg: "assets/images/avg.png",
                text: "₹23230",
              ),
              LB_ListView_2(
                profileImg: "assets/images/avg.png",
                text: "₹23230",
              ),
              LB_ListView_2(
                profileImg: "assets/images/avg.png",
                text: "₹23230",
              ),
              LB_ListView_2(
                profileImg: "assets/images/avg.png",
                text: "₹23230",
              ),
            ],
          ),
        ),
      ),
      designSize: const Size(428, 926),
    );
  }
}
