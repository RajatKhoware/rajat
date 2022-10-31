import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tambola_frontend/view/constants/new_gradints.dart';

class UpdateTextfield extends StatelessWidget {
  const UpdateTextfield({Key? key, this.onPressed, required this.controller})
      : super(key: key);
  final VoidCallback? onPressed;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: TextFormField(
        style: TextStyle(
          fontSize: 20.0.sp,
          fontWeight: FontWeight.bold,
                color: Colors.black87,
        ),
        decoration: InputDecoration(
          // contentPadding: EdgeInsets.zero,
          // labelText: Strings.AuthPage.PASSWORD,
          // hasFloatingPlaceholder: true,
          suffixIcon: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.done,
              color: Colors.black,
            ),
            onPressed: onPressed,
          ),
        ),
        controller: controller,
        // obscureText: snapshot.data,
      ),
    );
  }
}
