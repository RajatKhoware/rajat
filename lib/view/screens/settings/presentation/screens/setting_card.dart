// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:tambola_frontend/controller/local_db/local_db.dart';
import 'package:tambola_frontend/controller/services/user_services.dart';
import 'package:tambola_frontend/models/user.dart';
import 'package:tambola_frontend/view/constants/export_main.dart';
import 'package:tambola_frontend/view/constants/gradients.dart';
import 'package:tambola_frontend/view/constants/new_gradints.dart';
import 'package:tambola_frontend/view/screens/settings/presentation/widgets/update_textfield.dart';
import 'package:tambola_frontend/view/screens/support/presentation/screens/customer_support.dart';

import '../../../SelectRoom/widgets/coustom_button_text.dart';

class SettingCard extends StatefulWidget {
  const SettingCard({Key? key}) : super(key: key);

  @override
  State<SettingCard> createState() => _SettingCardState();
}

class _SettingCardState extends State<SettingCard> {
  // late TextEditingController updateName;
  // late TextEditingController updateEmail;
  // late TextEditingController updateMobile;
  TextEditingController updateName = TextEditingController();
  TextEditingController updateEmail = TextEditingController();
  TextEditingController updateMobile = TextEditingController();
  bool musicStatus = true;
  bool soundStatus = false;
  bool securityStatus = false;

  @override
  void initState() {
    super.initState();
  }

  // bool status = false;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      User user = Provider.of<UserProvider>(context, listen: false).user;
      updateName.text = user.user.username!;
      updateEmail.text = user.user.id!;
      updateMobile.text = user.user.mobile.toString();
      musicStatus = await LocalData.getMusic();
    });
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            width: 359.w,
            height: 680.h,
            decoration: BoxDecoration(
                gradient: metallicGradient,
                borderRadius: BorderRadius.circular(20.r)),
            child: SingleChildScrollView(
              child: Consumer<UserProvider>(builder: (context, userState, _) {
                return Column(
                  children: [
                    SizedBox(height: 20.h),
                    SettingCardProfilePic(),
                    SizedBox(height: 30.h),
                    userState.isNameEditing
                        ? UpdateTextfield(
                            controller: updateName,
                            onPressed: () async {
                              await UserServices().updateUser(
                                  jsonEncode({"username": updateName.text}));
                              Provider.of<UserProvider>(context, listen: false)
                                  .setEditing(EditType.Name, false);
                            },
                          )
                        : CustomSettingRow(
                            onPressed: () {
                              Provider.of<UserProvider>(context, listen: false)
                                  .setEditing(EditType.Name, true);
                            },
                            text: "User Name".tr,
                            icon: Icon(Icons.edit),
                          ),
                    SizedBox(height: 20.h),
                    userState.isEmailEditing
                        ? UpdateTextfield(
                            controller: updateEmail,
                            onPressed: () {
                              Provider.of<UserProvider>(context, listen: false)
                                  .setEditing(EditType.Email, false);
                            },
                          )
                        : CustomSettingRow(
                            text: "Email".tr,
                            icon: Icon(
                              Icons.edit,
                            ),
                            onPressed: () {
                              Provider.of<UserProvider>(context, listen: false)
                                  .setEditing(EditType.Email, true);
                            },
                          ),
                    SizedBox(height: 20.h),
                    userState.isMobileEditing
                        ? UpdateTextfield(
                            controller: updateMobile,
                            onPressed: () {
                              Provider.of<UserProvider>(context, listen: false)
                                  .setEditing(EditType.Mobile, false);
                            },
                          )
                        : CustomSettingRow(
                            text: "Mobile Number".tr,
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              Provider.of<UserProvider>(context, listen: false)
                                  .setEditing(EditType.Mobile, true);
                            },
                          ),
                    SizedBox(height: 20.h),
                    SettingSwitchButton(
                      status: musicStatus,
                      text: "Music".tr,
                      onToggle: (val) async {
                        setState(() {
                          musicStatus = val;
                        });
                        if (!val) {
                          await AudioManager.pause();
                          await LocalData.setMusic(val);
                        } else {
                          await AudioManager.resume();
                          await LocalData.setMusic(val);
                        }
                      },
                    ),
                    SizedBox(height: 20.h),
                    SettingSwitchButton(
                      status: soundStatus,
                      text: "Sound".tr,
                      onToggle: (p0) {},
                    ),
                    SizedBox(height: 20.h),
                    SettingLangDown(),
                    SizedBox(height: 20.h),
                    SettingSwitchButton(
                      status: securityStatus,
                      text: "Security".tr,
                      onToggle: (p0) {},
                    ),
                    SizedBox(height: 60.h),
                    CustomButton2(
                        text: "Reset Password".tr,
                        fontsize: 23.sp,
                        fontWeight: FontWeight.bold,
                        width: 290.w,
                        width2: 260.w,
                        height: 49.h,
                        height2: 35.h,
                        gradient1: newblue2liner,
                        gradient2: blueGradient,
                        color: metallicGradient.colors),
                    SizedBox(height: 15.h),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed("/support");
                      },
                      child: CustomButton2(
                          text: "Support".tr,
                          fontsize: 23.sp,
                          fontWeight: FontWeight.bold,
                          width: 290.w,
                          width2: 260.w,
                          height: 49.h,
                          height2: 35.h,
                          gradient1: newblue2liner,
                          gradient2: blueGradient,
                          color: metallicGradient.colors),
                    ),
                    SizedBox(height: 20.h),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
      designSize: const Size(428, 926),
    );
  }
}

class SettingCardProfilePic extends StatefulWidget {
  const SettingCardProfilePic({Key? key}) : super(key: key);

  @override
  State<SettingCardProfilePic> createState() => _SettingCardProfilePicState();
}

class _SettingCardProfilePicState extends State<SettingCardProfilePic> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => CircleAvatar(
        radius: 60.0.r,
        backgroundColor: Colors.transparent,
        child: ClipOval(
          child: Stack(
            children: <Widget>[
              Image.asset('assets/images/avg.png'),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                height: 32.h,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 50.h,
                    width: 30.w,
                    color: const Color.fromARGB(129, 0, 0, 0),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 5.h),
                      child: Row(
                        children: [
                          SizedBox(width: 25.w),
                          InkWell(
                            onTap: () {},
                            child: Icon(Icons.edit,
                                color: Colors.white, size: 13.sp),
                          ),
                          SizedBox(width: 5.w),
                          SizedBox(
                            width: 30.w,
                            child: Text(
                              "Edit".tr,
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.white,
                                  fontSize: 13.sp),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      designSize: const Size(428, 926),
    );
  }
}

class CustomSettingRow extends StatefulWidget {
  final String text;
  final Icon? icon;
  final VoidCallback? onPressed;

  const CustomSettingRow(
      {Key? key, required this.text, this.icon, this.onPressed})
      : super(key: key);

  @override
  State<CustomSettingRow> createState() => _CustomSettingRowState();
}

class _CustomSettingRowState extends State<CustomSettingRow> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => SizedBox(
        width: 300.w,
        height: 29.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.w),
              child: NewCoustomText2(
                text: widget.text,
                fontsize: 20.0.sp,
                fontWeight: FontWeight.bold,
                color: newblacklinergradient.colors,
              ),
            ),
            IconButton(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.zero,
                onPressed: widget.onPressed,
                icon: Icon(Icons.edit, size: 23.sp))
          ],
        ),
      ),
      designSize: const Size(428, 926),
    );
  }
}

class SettingSwitchButton extends StatefulWidget {
  final String text;
  final void Function(bool) onToggle;
  final bool status;

  const SettingSwitchButton({
    Key? key,
    required this.onToggle,
    required bool this.status,
    required this.text,
  }) : super(key: key);

  @override
  State<SettingSwitchButton> createState() => _SettingSwitchButtonState();
}

class _SettingSwitchButtonState extends State<SettingSwitchButton> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => SizedBox(
        width: 300.w,
        height: 29.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NewCoustomText2(
              text: widget.text,
              fontsize: 20.0.sp,
              fontWeight: FontWeight.bold,
              color: newblacklinergradient.colors,
            ),
            FlutterSwitch(
                width: 37.w,
                height: 20.h,
                padding: 2.5.h.w,
                toggleSize: 16,
                activeColor: Color.fromARGB(255, 2, 47, 83),
                inactiveColor: Color.fromARGB(216, 32, 32, 32),
                value: widget.status,
                onToggle: widget.onToggle)
          ],
        ),
      ),
      designSize: const Size(428, 926),
    );
  }
}

class SettingLanguageDropDown extends StatelessWidget {
  final List<String> languages;
  final String language;
  final Function(dynamic) onChanged;

  // ignore: use_key_in_widget_constructors
  const SettingLanguageDropDown({
    required this.languages,
    required this.language,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        height: 25.0.h,
        width: 104.w,
        decoration: BoxDecoration(
          gradient: metallicGradientwithOpacity,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            dropdownColor: Color.fromARGB(255, 131, 131, 131),
            icon: Icon(Icons.arrow_drop_down_circle,
                color: Colors.grey, size: 18.sp),
            value: language,
            items: LocalizationService.langs
                .map((String value) => DropdownMenuItem(
                      value: value,
                      child: Row(
                        children: <Widget>[
                          NewCoustomText(
                              text: value,
                              fontsize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color: newblacklinergradient.colors)
                        ],
                      ),
                    ))
                .toList(),
            onChanged: onChanged,
          ),
        ),
      ),
      designSize: const Size(428, 926),
    );
  }
}

class SettingLangDown extends StatefulWidget {
  const SettingLangDown({Key? key}) : super(key: key);

  @override
  State<SettingLangDown> createState() => _SettingLangDownState();
}

class _SettingLangDownState extends State<SettingLangDown> {
  String _language = "English";
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => SizedBox(
        width: 300.w,
        height: 29.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NewCoustomText(
              text: "Language".tr,
              fontsize: 20.sp,
              fontWeight: FontWeight.bold,
              color: newblacklinergradient.colors,
              shadowoffset: Offset(2.0, 4.0),
              shawdowcolor: Color.fromARGB(33, 51, 51, 51),
              shawdowradius: .5.r,
            ),
            SettingLanguageDropDown(
              languages: [],
              language: _language,
              onChanged: (val) {
                setState(() {
                  this._language = val;
                  LocalizationService().changeLocale(val);
                });
              },
            ),
          ],
        ),
      ),
      designSize: const Size(428, 926),
    );
  }
}
