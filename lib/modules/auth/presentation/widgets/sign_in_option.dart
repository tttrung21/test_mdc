import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_mdc/core/app_text_style.dart';

class SignInOption extends StatelessWidget {
  const SignInOption({
    super.key,
    required this.image,
    required this.title,
    this.imageColor,
    required this.textColor,
    required this.bgColor,
    required this.onPress,
    required this.hasShadow,
  });

  final String image;
  final String title;
  final Color? imageColor;
  final Color textColor;
  final Color bgColor;
  final Function() onPress;
  final bool hasShadow;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPress,
      padding: EdgeInsets.zero,
      child: Container(
        padding: EdgeInsets.fromLTRB(24, 16, 20, 16),
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(30),
            boxShadow: hasShadow
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      offset: Offset(0, 4),
                      blurRadius: 40,
                      spreadRadius: 0,
                    ),
                  ]
                : null),
        child: Center(
          child: Row(
            children: [
              Image.asset(
                image,
                color: imageColor,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                title,
                style: AppTextStyle.title1.copyWith(color: textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
