import 'package:flutter/cupertino.dart';
import 'package:test_mdc/core/app_colors.dart';
import 'package:test_mdc/core/app_text_style.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.buttonText, required this.onPress});

  final String buttonText;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      borderRadius: BorderRadius.circular(30),
      onPressed: onPress,
      color: AppColors.primaryColor,
      padding: EdgeInsets.zero,
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          width: double.maxFinite,
          alignment: Alignment.center,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: AppColors.primaryColor.withValues(alpha: 0.2738),
              offset: Offset(0, 4),
              blurRadius: 10,
              spreadRadius: 0,
            )
          ]),
          child: Text(
            buttonText,
            style: AppTextStyle.button.copyWith(color: AppColors.white),
          )),
    );
  }
}
