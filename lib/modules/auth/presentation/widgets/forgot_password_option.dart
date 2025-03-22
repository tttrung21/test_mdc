import 'package:flutter/material.dart';
import 'package:test_mdc/core/app_colors.dart';
import 'package:test_mdc/core/app_text_style.dart';

class ForgotPasswordOption extends StatelessWidget {
  const ForgotPasswordOption({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final bool isSelected;
  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: AppColors.white,
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    offset: Offset(0, 4),
                    blurRadius: 40,
                    spreadRadius: 0,
                  ),
                ]
              : null,
        ),
        child: ListTile(
          leading: CircleAvatar(
            child: Icon(
              icon,
              color: AppColors.primaryColor,
            ),
          ),
          title: Row(
            children: [
              Expanded(
                  child: Text(
                title,
                style: AppTextStyle.title,
              )),
              if (isSelected)
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 20,
                ),
            ],
          ),
          subtitle: Text(
            subtitle,
            style: AppTextStyle.title2.copyWith(color: AppColors.subtitle),
          ),
        ),
      ),
    );
  }
}
