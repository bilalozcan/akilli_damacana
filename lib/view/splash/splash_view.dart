import 'package:flutter/material.dart';
import 'package:smart_carboy/core/init/theme/light/color_scheme_light.dart';
import 'package:smart_carboy/view/splash/splash_view_model.dart';
import 'package:smart_carboy/widgets/base_container.dart';
import 'package:smart_carboy/widgets/custom_text.dart';
import 'package:stacked/stacked.dart';
import 'package:smart_carboy/core/extensions/context_extension.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
        viewModelBuilder: () => SplashViewModel(),
        onModelReady: (viewModel) => viewModel.initialize(context),
        builder: (context, viewModel, child) {
          return Scaffold(
            body: BaseContainer(
             child: Stack(
                children: [
                  Column(children: [
                    Container(height: context.dynamicHeight(0.3)),
                    Container(
                      height: context.dynamicHeight(0.7),
                      width: context.dynamicWidth(1),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/girissonrasi.png'),
                              fit: BoxFit.fill)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: context.dynamicHeight(0.1)),
                            child: Container(
                              width: context.dynamicWidth(0.5),
                              child: ElevatedButton(
                                onPressed: () {},
                                child: CustomText('LOADING',
                                    color: context.themeData.colorScheme.primaryVariant,
                                    fontWeight: FontWeight.bold),
                                style: ElevatedButton.styleFrom(
                                    primary: context.themeData.colorScheme.primary,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: BorderSide(
                                            color: ColorSchemeLight.instance!.lightBlue0,
                                            width: 4))),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
                  Positioned(
                      top: context.dynamicHeight(0.18),
                      width: context.dynamicWidth(1),
                      child:
                          Center(child: Image.asset('assets/girislogosu.png')))
                ],
              ),
            ),
          );
        });
  }
}
