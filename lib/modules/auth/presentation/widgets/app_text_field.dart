import 'package:flutter/material.dart';
import 'package:test_mdc/core/app_colors.dart';
import 'package:test_mdc/core/app_text_style.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.title,
    required this.placeholder,
    required this.controller,
    required this.isShowSuffix,
    this.togglePassword,
    this.isShowPassword = false,
  });

  final String title;
  final String placeholder;
  final TextEditingController controller;
  final bool isShowSuffix;
  final Function()? togglePassword;
  final bool isShowPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: AppTextStyle.title1,),
        SizedBox(height: 8,),
        Container(
          height: 54,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                offset: Offset(0, 4),
                blurRadius: 40,
                spreadRadius: 0,
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            style: AppTextStyle.subheader,
            decoration: InputDecoration(
                hintStyle: TextStyle(
                  color: AppColors.subtitle,
                ),
                hintText: placeholder,
                suffix: _getSuffix(),
                border: OutlineInputBorder(borderSide: BorderSide.none)),
          ),
        )
      ],
    );
  }

  Widget? _getSuffix() {
    if (!isShowSuffix) return null;
    return InkWell(
      onTap: () {
        if (togglePassword != null) {
          togglePassword?.call();
        }
      },
      child: Icon(
        isShowPassword ? Icons.visibility_off : Icons.visibility,
        color: AppColors.subtitle,
      ),
    );
  }
}
