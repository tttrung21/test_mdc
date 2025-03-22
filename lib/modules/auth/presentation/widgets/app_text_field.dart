import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_mdc/core/app_colors.dart';
import 'package:test_mdc/core/app_text_style.dart';

class AppTextField extends StatelessWidget {
  AppTextField({
    super.key,
    required this.title,
    required this.placeholder,
    required this.controller,
    required this.isShowSuffix,
    this.togglePassword,
    this.isShowPassword,
    required this.onChanged,
  });

  final String title;
  final String placeholder;
  final TextEditingController controller;
  final bool isShowSuffix;
  final Function()? togglePassword;
  final bool? isShowPassword;
  final Function(String) onChanged;

  Icon icon1 = Icon(Icons.visibility, color: AppColors.subtitle);
  Icon icon2 = Icon(Icons.visibility_off, color: AppColors.subtitle);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.title1,
        ),
        SizedBox(
          height: 8,
        ),
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
            obscureText: isShowPassword ?? false,
            decoration: InputDecoration(
                hintStyle: TextStyle(
                  color: AppColors.subtitle,
                ),
                hintText: placeholder,
                suffixIcon: _getSuffix(),
                border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
            onChanged: (value) => onChanged(value),
          ),
        )
      ],
    );
  }

  Widget? _getSuffix() {
    if (!isShowSuffix) return null;
    return CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          if (togglePassword != null) {
            togglePassword?.call();
          }
        },
        child: _getSuffixIcon());
  }

  Icon _getIcon1() {
    togglePassword == null
        ? icon1 = Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 20,
          )
        : icon1;
    return icon1;
  }

  Widget _getSuffixIcon(){
    if(isShowSuffix && isShowPassword == null) return _getIcon1();
    return (isShowPassword ?? false) ? icon2 : _getIcon1();
  }
}
