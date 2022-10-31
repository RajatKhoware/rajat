import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:tambola_frontend/view/constants/colors.dart';
import 'package:tambola_frontend/view/constants/gradients.dart';
import 'package:tambola_frontend/view/constants/new_gradints.dart';
// import 'package:tambola_frontend/view/components/custom_text.dart';

// import '../widgets/gradient_text.dart';

class BuildTextField extends StatefulWidget {
  final bool isHide;
  final String? label;
  final String hintText;
  final TextInputType type;
  final Color color;
  final int maxLength;
  final Gradient textGradient;
  final TextEditingController controller;
  final double? width;
  final double? hieght;
  final bool validator;

  const BuildTextField({
    Key? key,
    this.label,
    this.isHide = false,
    required this.hintText,
    this.type = TextInputType.text,
    this.color = textFieldColor,
    this.maxLength = 10,
    this.textGradient = blueLiner2Gradient,
    required this.controller,
    this.width = 335,
    this.hieght = 38,
    this.validator = false,
  }) : super(key: key);

  @override
  State<BuildTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<BuildTextField> {
  bool isVisible = false;
  setVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 15.w),
            width: widget.width,
            height: widget.hieght,
            decoration: BoxDecoration(
                gradient: newblacklinergradient,
                borderRadius: BorderRadius.circular(10.r)),
            child: TextFormField(
              expands: false,
              controller: widget.controller,
              style: TextStyle(
                fontSize: 12.sp,
                foreground: Paint()..shader = textlinearGradient,
              ),
              validator: widget.validator
                  ? (value) {
                      if (value!.isEmpty) {
                        return "This field can't be left empty";
                      }
                      if (value.length < 4) {
                        return "Enter min. 4 characters";
                      } else {
                        return null;
                      }
                    }
                  : null,
              obscureText: false,
              keyboardType: widget.type,
              maxLength:
                  widget.type == TextInputType.number ? widget.maxLength : null,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 0.h, bottom: 5.h),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                  // foreground: Paint()..shader = textlinearGradient,
                ),
                 
                suffix: widget.isHide
                    ? IconButton(
                        padding: EdgeInsets.zero,
                        color: isVisible ? Colors.blue : Colors.grey,
                        icon: Icon(!isVisible
                            ? Icons.visibility
                            : Icons.visibility_off_outlined),
                        onPressed: () {
                          setVisibility();
                        },
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BuildTextField2 extends StatefulWidget {
  final bool isHide;
  final String? label;
  final String hintText;
  final TextInputType type;
  final Color color;
  final int maxLength;
  final Gradient textGradient;
  final TextEditingController controller;

  const BuildTextField2({
    Key? key,
    this.label,
    this.isHide = false,
    required this.hintText,
    this.type = TextInputType.text,
    this.color = textFieldColor,
    this.maxLength = 10,
    this.textGradient = blueLiner2Gradient,
    required this.controller,
  }) : super(key: key);

  @override
  State<BuildTextField2> createState() => _InputTextField2State();
}

class _InputTextField2State extends State<BuildTextField2> {
  bool isVisible = true;
  setVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 15.w),
            width: 356.w,
            height: 33.h,
            decoration: BoxDecoration(
                color: fromCssColor("#FFFFFF").withOpacity(0.30),
                borderRadius: BorderRadius.circular(10.r)),
            child: TextFormField(
              expands: false,
              controller: widget.controller,
              style: TextStyle(
                fontSize: 11.sp,
                foreground: Paint()..shader = textlinearGradient,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "This field can't be left empty";
                }
                if (value.length < 4) {
                  return "Enter min. 4 characters";
                } else {
                  return null;
                }
              },
              obscureText: false,
              keyboardType: widget.type,
              maxLength:
                  widget.type == TextInputType.number ? widget.maxLength : null,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 15.h),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  fontSize: 9.sp,
                  fontWeight: FontWeight.w500,
                  foreground: Paint()..shader = textlinearGradient2,
                ),
                suffixIcon: widget.isHide
                    ? IconButton(
                        padding: EdgeInsets.zero,
                        color: !isVisible ? Colors.blue : Colors.grey,
                        icon: Icon(isVisible
                            ? Icons.visibility
                            : Icons.visibility_off_outlined),
                        onPressed: () {
                          setVisibility();
                        },
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
