// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/gradients.dart';

class CoustomTextformfield extends StatefulWidget {
  final String labeltext;
  CoustomTextformfield({
    Key? key,
    required this.labeltext,
  }) : super(key: key);

  @override
  State<CoustomTextformfield> createState() => _CoustomTextformfieldState();
}

class _CoustomTextformfieldState extends State<CoustomTextformfield> {
  String name = "";

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, child) => Container(
            width: 359,
            height: 45.h,
            decoration: BoxDecoration(
                gradient: blackLinear,
                borderRadius: BorderRadius.circular(10.r)),
            child: TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0.r),
                ),
                fillColor: Colors.transparent,
                labelStyle: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                  foreground: Paint()..shader = textlinearGradient,
                ),
                labelText: widget.labeltext,
              ),
              onChanged: (value) {
                name = value;
                setState(() {});
              },
            )));
  }
}
