import 'package:flutter/material.dart';
import 'package:smart_carboy/core/constants/icon/app_icons.dart';
import 'package:smart_carboy/widgets/brand_container.dart';
import 'package:smart_carboy/widgets/custom_button.dart';
import 'package:smart_carboy/widgets/custom_text.dart';
import 'package:stacked/stacked.dart';
import 'package:smart_carboy/core/extensions/context_extension.dart';
import 'basket_view_model.dart';

class BasketView extends StatefulWidget {
  const BasketView({Key? key}) : super(key: key);

  @override
  State<BasketView> createState() => _BasketViewState();
}

class _BasketViewState extends State<BasketView> {
  int _count = 0;
  bool _isSuccess = false;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BasketViewModel>.reactive(
        viewModelBuilder: () => BasketViewModel(),
        onModelReady: (viewModel) => viewModel.initialize(context),
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: buildAppBar(),
            body: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                    Color(0xff05B4FF),
                    Color(0xff118BBF),
                  ])),
              child: _isSuccess
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: context.dynamicWidth(0.2)),
                      child: Container(
                        width: context.dynamicWidth(1),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: context.dynamicWidth(0.6),
                              width: context.dynamicWidth(0.6),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xffE2F2FC),
                                        Color(0xffA1D2F1),
                                      ]),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: context.dynamicWidth(0.30),
                                    width: context.dynamicWidth(0.30),
                                    decoration: BoxDecoration(
                                        // color: Colors.red,
                                        border: Border.all(
                                            color: Color(0xff1D91D2), width: 4),
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Center(
                                        child: Icon(
                                      AppIcons.basket,
                                      size: 64,
                                      color: Color(0xff1D91D2),
                                    )),
                                  ),
                                  SizedBox(height: context.dynamicHeight(0.01)),
                                  Column(
                                    children: [
                                      CustomText(
                                        'Siparişiniz\nYola Çıktı!',
                                        color: Color(0xff1D91D2),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: context.dynamicHeight(0.01)),
                            CustomButton(
                              onPressed: () {},
                              backgroundColor: Color(0xff0F608E),
                              text: 'Profile Git',
                              textColor: Colors.white,
                              textWeight: FontWeight.bold,
                            )
                          ],
                        ),
                      ),
                    )
                  : basketBody(context),
            ),
          );
        });
  }

  Padding basketBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.05)),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                basketItemContainer(context),
                basketItemContainer(context),
              ],
            )),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              height: context.dynamicHeight(0.06),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xff0F608E).withOpacity(0.25),
                        offset: Offset(0, 4),
                        blurRadius: 4)
                  ]),
              child: Center(
                child: CustomText(
                  'TOPLAM TUTAR : 37,80',
                  color: Color(0xff0F608E),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: CustomButton(
                height: context.dynamicHeight(0.06),
                onPressed: () {
                  setState(() {
                    _isSuccess = true;
                  });
                },
                backgroundColor: Color(0xff0F608E),
                text: 'SİPARİŞİ ONAYLA',
                textColor: Colors.white,
                textWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget basketItemContainer(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Container(
        height: context.dynamicWidth(0.3),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: context.dynamicWidth(0.30), child: BrandContainer()),
            Container(
                width: context.dynamicWidth(0.60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText('19 Lt Hayat Damacana Su',
                            color: Colors.white, fontWeight: FontWeight.bold),
                        SizedBox(height: context.dynamicHeight(0.01)),
                        CustomText(
                          '19.90 Tl',
                          color: Colors.white,
                          fontSize: 14,
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: context.dynamicWidth(0.36),
                          height: context.dynamicHeight(0.04),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xff0F608E).withOpacity(0.25),
                                    offset: Offset(0, 4))
                              ]),
                          child: Row(children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _count != 0 ? _count -= 1 : null;
                                });
                              },
                              child: Container(
                                height: context.dynamicHeight(0.04),
                                width: context.dynamicWidth(0.08),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10)),
                                ),
                                child: Icon(
                                  Icons.remove,
                                  color: Color(0xff1D91D2),
                                ),
                              ),
                            ),
                            Container(
                              width: context.dynamicWidth(0.2),
                              color: Color(0xff0F608E),
                              child: Center(
                                child: CustomText(
                                  '$_count',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _count += 1;
                                });
                              },
                              child: Container(
                                height: context.dynamicHeight(0.04),
                                width: context.dynamicWidth(0.08),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Color(0xff1D91D2),
                                ),
                              ),
                            )
                          ]),
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Color(0xff1D91D2),
      elevation: 0,
      title: CustomText('SEPETİM',
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 15),
          child: Icon(AppIcons.basket),
        )
      ],
    );
  }
}
