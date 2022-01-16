import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/icon/app_icons.dart';
import '../../core/init/theme/light/color_scheme_light.dart';
import '../../model/product.dart';
import '../main/main_view_model.dart';
import '../../widgets/brand_container.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../../core/extensions/context_extension.dart';
import '../../widgets/loading_widget.dart';
import 'basket_view_model.dart';

class BasketView extends StatefulWidget {
  const BasketView({Key? key}) : super(key: key);

  @override
  State<BasketView> createState() => _BasketViewState();
}

class _BasketViewState extends State<BasketView> {

  @override
  Widget build(BuildContext context) {
    return Consumer<BasketViewModel>(builder: (context, viewModel, child) {
      return Scaffold(
        appBar: buildAppBar(),
        body: Stack(
          children: [Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  ColorSchemeLight.instance!.lightBlue1,
                  ColorSchemeLight.instance!.lightBlue2,
                ])),
            child: viewModel.isSuccess ? buildSuccessBody(viewModel) : basketBody(viewModel),
          ),
          LoadingWidget(viewModel.isLoading)
          ],
        ),
      );
    });
  }

  Padding buildSuccessBody(BasketViewModel viewModel) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.2)),
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
                        ColorSchemeLight.instance!.lightGrayishBlue,
                        ColorSchemeLight.instance!.lightGrayishBlue3,
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
                        border: Border.all(color: context.themeData.primaryColor, width: 4),
                        borderRadius: BorderRadius.circular(100)),
                    child: Center(
                        child: Icon(
                      AppIcons.basket,
                      size: 64,
                      color: context.themeData.primaryColor,
                    )),
                  ),
                  SizedBox(height: context.dynamicHeight(0.01)),
                  Column(
                    children: [
                      CustomText(
                        'Siparişiniz\nYola Çıktı!',
                        color: context.themeData.primaryColor,
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
              onPressed: () {
                viewModel.isSuccess = false;
                context.read<MainViewModel>().bottomBarIndex = 2;
              },
              backgroundColor: context.themeData.colorScheme.primary,
              text: 'Profile Git',
              textColor: context.themeData.colorScheme.primaryVariant,
              textWeight: FontWeight.bold,
            )
          ],
        ),
      ),
    );
  }

  Padding basketBody(BasketViewModel viewModel) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.05)),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Expanded(
                child: viewModel.basketList.isNotEmpty
                    ? ListView(
                        children: viewModel.basketList
                            .map((product) =>
                                basketItemContainer(product, viewModel))
                            .toList()
                        )
                    : Center(
                        child: CustomText('SEPET BOŞ',
                            color: context.themeData.colorScheme.primaryVariant, fontWeight: FontWeight.bold),
                      )),
            SizedBox(height: context.dynamicHeight(0.02)),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              height: context.dynamicHeight(0.06),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: context.themeData.colorScheme.primaryVariant,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: context.themeData.colorScheme.primary.withOpacity(0.25),
                        offset: Offset(0, 4),
                        blurRadius: 4)
                  ]),
              child: Center(
                child: CustomText(
                  'TOPLAM TUTAR : ${viewModel.totalCount.toStringAsFixed(2).replaceAll('.', ',')} TL',
                  color: context.themeData.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: CustomButton(
                height: context.dynamicHeight(0.06),
                onPressed: () =>
                  viewModel.postOrder()
                ,
                backgroundColor: context.themeData.colorScheme.primary,
                text: 'SİPARİŞİ ONAYLA',
                textColor: context.themeData.colorScheme.primaryVariant,
                textWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget basketItemContainer(Product product, BasketViewModel viewModel) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Container(
        height: context.dynamicWidth(0.3),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: context.dynamicWidth(0.30),
                child: BrandContainer(product, false)),
            Container(
                width: context.dynamicWidth(0.60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText('19 Lt ${product.brand} Damacana Su',
                            color: context.themeData.colorScheme.primaryVariant, fontWeight: FontWeight.bold),
                        SizedBox(height: context.dynamicHeight(0.01)),
                        CustomText(
                          '${product.price} Tl',
                          color: context.themeData.colorScheme.primaryVariant,
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
                                    color: context.themeData.colorScheme.primary.withOpacity(0.25),
                                    offset: Offset(0, 4))
                              ]),
                          child: Row(children: [
                            InkWell(
                              onTap: () =>
                                  viewModel.basketUpdate(product, false),
                              child: Container(
                                height: context.dynamicHeight(0.04),
                                width: context.dynamicWidth(0.08),
                                decoration: BoxDecoration(
                                  color: context.themeData.colorScheme.primaryVariant,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10)),
                                ),
                                child: Icon(
                                  Icons.remove,
                                  color: context.themeData.primaryColor,
                                ),
                              ),
                            ),
                            Container(
                              width: context.dynamicWidth(0.2),
                              color: context.themeData.colorScheme.primary,
                              child: Center(
                                child: CustomText(
                                  // '$_count',
                                  '${product.count}',
                                  color: context.themeData.colorScheme.primaryVariant,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () =>
                                  viewModel.basketUpdate(product, true),
                              child: Container(
                                height: context.dynamicHeight(0.04),
                                width: context.dynamicWidth(0.08),
                                decoration: BoxDecoration(
                                  color: context.themeData.colorScheme.primaryVariant,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: context.themeData.primaryColor,
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
      backgroundColor: context.themeData.primaryColor,
      elevation: 0,
      title: CustomText('SEPETİM',
          color: context.themeData.colorScheme.primaryVariant, fontWeight: FontWeight.bold, fontSize: 20),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 15),
          child: Icon(AppIcons.basket),
        )
      ],
    );
  }
}
