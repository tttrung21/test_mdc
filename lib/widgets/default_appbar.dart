import 'package:flutter/material.dart';
import 'package:test_mdc/core/app_colors.dart';
import 'package:test_mdc/core/app_text_style.dart';

class DefaultAppbar extends StatelessWidget {
  const DefaultAppbar({super.key, required this.title, this.backTap, this.closeTap});

  final String title;
  final Function()? backTap;
  final Function()? closeTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: LayoutBuilder(
        builder: (context, constraints) {
          double imageHeight = constraints.maxHeight * 0.6;
          return Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30)),
                child: ColoredBox(
                  color: AppColors.appbarBgColor,
                  child: SizedBox(
                    height: 220,
                    width: double.infinity,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 20,
                right: 20,
                child: Image.asset(
                  'assets/foreground_img.png',
                  height: imageHeight,
                ),
              ),
              Positioned(
                top: constraints.maxHeight * 0.3,
                left: 24,
                right: 24,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: backTap,
                      child: Icon(Icons.chevron_left),
                    ),
                    Text(title,style: AppTextStyle.title,),
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
