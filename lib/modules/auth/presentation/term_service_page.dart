import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_mdc/core/app_colors.dart';
import 'package:test_mdc/core/app_text_style.dart';
import 'package:test_mdc/core/route_name.dart';
import 'package:test_mdc/widgets/app_button.dart';
import 'package:test_mdc/widgets/appbar_no_background.dart';

class TermServicePage extends StatelessWidget {
  const TermServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            AppbarNoBackground(backTap: Modular.to.pop,),
            Expanded(
              child: SingleChildScrollView(
                child: _buildBody(),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          padding: EdgeInsets.only(bottom: 24, right: 24, left: 24),
          child: AppButton(
              buttonText: 'I Agree Term and Condition',
              onPress: () {
                Modular.to.pushNamed(RouteName.newPassword);
              }),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          color: AppColors.bgColor,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'General Term of service',
                  style: AppTextStyle.header,
                ),
                SizedBox(height: 24),
                Text(
                  'Terms of service (also known as terms of use and terms and conditions, commonly abbreviated as TOS or ToS, ToU or T&C) are the legal agreements between a service provider and a person who wants to use that service. The person must agree to abide by the terms of service in order to use the offered service.',
                  style: AppTextStyle.title.copyWith(color: AppColors.subtitle),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(32, 30, 32, 26),
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(text: '“', style: AppTextStyle.typo.copyWith(fontSize: 27,color: AppColors.subtitle)),
                    TextSpan(text: 'Running macOS and Windows 10 on the Same Computer', style: AppTextStyle.typo.copyWith(color: AppColors.subtitle)),
                    TextSpan(text: '“', style: AppTextStyle.typo.copyWith(fontSize: 27,color: AppColors.subtitle)),
                  ])),
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eleifend nulla non placerat placerat. Aliquam suscipit ante ut tortor suscipit gravida. Aliquam erat volutpat. Fusce aliquet molestie dolor, vitae lacinia nisi mollis ut. Aliquam erat volutpat. Cras erat augue, gravida a pellentesque sit amet, ultrices at lacus. Donec pretium mollis sapien et ornare. Ut ultricies tellus at tortor hendrerit, quis dictum mi hendrerit. Proin vel consequat dolor, iaculis scelerisque ante. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Suspendisse tincidunt, erat sed dictum vulputate, justo augue rhoncus justo, vitae vulputate elit mi ut arcu. Etiam ac imperdiet mi, id sodales lectus. Nunc viverra odio et semper semper. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Suspendisse tincidunt, erat sed dictum vulputate, justo augue rhoncus justo, vitae vulputate elit mi ut arcu. Etiam ac imperdiet mi, id sodales lectus. Nunc viverra odio et semper semper.',
                  style: AppTextStyle.title.copyWith(color: AppColors.subtitle),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
