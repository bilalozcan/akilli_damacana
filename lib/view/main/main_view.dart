import 'package:flutter/material.dart';
import 'package:smart_carboy/core/constants/icon/app_icons.dart';
import 'package:smart_carboy/core/extensions/context_extension.dart';
import 'package:smart_carboy/view/basket/basket_view.dart';
import 'package:smart_carboy/view/home/home_view.dart';
import 'package:smart_carboy/view/main/main_view_model.dart';
import 'package:smart_carboy/widgets/brand_container.dart';
import 'package:smart_carboy/widgets/custom_text.dart';
import 'package:stacked/stacked.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
        viewModelBuilder: () => MainViewModel(),
        onModelReady: (viewModel) => viewModel.initialize(context),
        builder: (context, viewModel, child) {
          return Scaffold(
            key: _scaffoldKey,
            appBar: buildAppBar(context),
            body: body(viewModel.bottomBarIndex),
            bottomNavigationBar: buildBottomNavigationBar(viewModel),
            endDrawer: Drawer(
              elevation: 16.0,
              backgroundColor: Color(0xff0F608E),
              child: Container(
                width: context.dynamicWidth(0.2),
                child: Padding(
                  padding:
                      EdgeInsets.only(top: context.dynamicStatusBarHeight()),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      drawerBaseContainer(drawerHeader()),
                      SizedBox(height: context.dynamicHeight(0.025)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          drawerButton('Ana Sayfa', 1, viewModel),
                          drawerButton('Sipariş Et', 0, viewModel),
                          drawerButton('Ayarlar', 2, viewModel)
                        ],
                      ),
                      SizedBox(height: context.dynamicHeight(0.05)),
                      drawerBaseContainer(Center(
                        child: CustomText(
                          'Önerilen Su Markaları',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      )),
                      SizedBox(height: context.dynamicHeight(0.025)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: context.dynamicWidth(0.04)),
                        child: Center(
                          child: GridView.count(
                            shrinkWrap: true,
                            crossAxisCount: 3,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            children: [
                              BrandContainer(),
                              BrandContainer(),
                              BrandContainer(),
                              BrandContainer(),
                              BrandContainer(),
                              BrandContainer(),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Padding drawerBaseContainer(Widget child) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: context.dynamicWidth(0.8),
        height: context.dynamicHeight(0.06),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Color(0xff1D91D2),
        ),
        child: child,
      ),
    );
  }

  Row drawerHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          'MENU',
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 20,
        ),
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              AppIcons.close,
              color: Colors.white,
            ))
      ],
    );
  }

  Widget drawerButton(String title, int index, MainViewModel viewModel) {
    return InkWell(
      onTap: () {
        viewModel.bottomBarIndex = index;
        Navigator.pop(context);
      },
      child: Container(
          height: context.dynamicHeight(0.05),
          width: context.dynamicWidth(0.5),
          decoration: BoxDecoration(
              color:
                  viewModel.bottomBarIndex == index ? Color(0xff1D91D2) : null),
          child: Padding(
            padding: EdgeInsets.only(left: context.dynamicWidth(0.1)),
            child: Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                title,
                fontWeight: viewModel.bottomBarIndex == index
                    ? FontWeight.bold
                    : FontWeight.normal,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          )),
    );
  }

  Widget body(int index) {
    switch (index) {
      case 0:
        return BasketView();
      case 1:
        return HomeView();
      case 2:
        return Center(child: CustomText('Ayarlar'));
      default:
        return Center(child: CustomText('Default'));
    }
  }

  BottomNavigationBar buildBottomNavigationBar(MainViewModel viewModel) {
    return BottomNavigationBar(
      currentIndex: viewModel.bottomBarIndex,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      iconSize: 28,
      backgroundColor: Color(0xff0F608E),
      unselectedItemColor: Color(0xff1D91D2),
      onTap: (value) {
        viewModel.bottomBarIndex = value;
      },
      items: [
        BottomNavigationBarItem(icon: Icon(AppIcons.basket), label: 'Basket'),
        BottomNavigationBarItem(icon: Icon(AppIcons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(AppIcons.settings), label: 'Setting'),
      ],
    );
  }

  AppBar buildAppBar(BuildContext context) => AppBar(
        title: Container(
          // width: context.dynamicWidth(1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/logo_yatay.png'),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () => _scaffoldKey.currentState!.openEndDrawer(),
                icon: Icon(AppIcons.menu, color: Color(0xff1D91D2))),
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      );
}
