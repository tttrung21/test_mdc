import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_mdc/core/app_colors.dart';

class PasswordChangeDonePage extends StatelessWidget {
  const PasswordChangeDonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Stack(
        children: [
          SizedBox(
            height: 90,
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
                            onTap: Modular.to.pop,
                            child: Icon(Icons.chevron_left),
                          ),
                          InkWell(
                            onTap: () {
                              Modular.to.popUntil((route) => route.isFirst,);
                            },
                            child: Icon(Icons.close),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Center(child: _buildBody())
        ],
      ),
    );
  }

  Widget _buildBody(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.check_circle,color: AppColors.primaryColor,size: 84,),
        SizedBox(height: 32,),
        Text('Your password was successfully changed'),
        SizedBox(height: 16,),
        Text('Please close this window and login again'),
        SizedBox(height: 32,),
      ],
    );
  }
}
