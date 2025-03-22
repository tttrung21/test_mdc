import 'package:flutter/material.dart';
import 'package:test_mdc/core/app_colors.dart';
import 'package:test_mdc/core/app_text_style.dart';

class AppbarNoBackground extends StatelessWidget {
  const AppbarNoBackground({super.key, this.title, this.backTap, this.closeTap});

  final String? title;
  final Function()? backTap;
  final Function()? closeTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30)),
                child: ColoredBox(
                  color: AppColors.white,
                  child: SizedBox(
                    height: 60,
                    width: double.infinity,
                  ),
                ),
              ),
              Positioned(
                top: constraints.maxHeight * 0.55,
                left: 24,
                right: 24,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: backTap,
                      child: Icon(Icons.chevron_left),
                    ),
                    Text(title ?? '',style: AppTextStyle.title,),
                    InkWell(
                      onTap: closeTap,
                      child: Icon(Icons.close),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
