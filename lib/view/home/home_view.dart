import 'package:flutter/material.dart';
import 'package:smart_carboy/widgets/base_container.dart';
import 'package:smart_carboy/widgets/brand_container.dart';
import 'package:stacked/stacked.dart';
import 'package:smart_carboy/core/extensions/context_extension.dart';
import 'home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onModelReady: (viewModel) => viewModel.initialize(context),
        builder: (context, viewModel, child) {
          return Scaffold(
            body: BaseContainer(
                image: 'assets/background.png',
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.dynamicWidth(0.07)),
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
                        BrandContainer(),
                        BrandContainer(),
                        BrandContainer(),
                        BrandContainer(),
                        BrandContainer(),
                        BrandContainer(),
                      ],
                    ),
                  ),
                )),
          );
        });
  }


}
