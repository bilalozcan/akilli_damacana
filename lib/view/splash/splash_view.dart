import 'package:flutter/material.dart';
import 'package:smart_carboy/view/splash/splash_view_model.dart';
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
            body: Container(
              height: context.dynamicHeight(1),
              width: context.dynamicWidth(1),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color(0xffA1D2F1),
                    Color(0xffE2F2FC),
                    Color(0xff9FD1F1),
                  ])),
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
                                    fontWeight: FontWeight.bold),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Color(0xff0F608E)),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            side: BorderSide(
                                                color: Color(0xff05D2FF),
                                                width: 4)))),
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
