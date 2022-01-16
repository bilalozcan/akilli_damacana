import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_carboy/core/constants/icon/app_icons.dart';
import 'package:smart_carboy/core/extensions/context_extension.dart';
import 'package:smart_carboy/widgets/base_container.dart';
import 'package:smart_carboy/widgets/custom_button.dart';
import 'package:smart_carboy/widgets/custom_text_form_field.dart';
import 'package:smart_carboy/widgets/loading_widget.dart';
import 'package:stacked/stacked.dart';

import 'register_view_model.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
        viewModelBuilder: () => RegisterViewModel(),
        onModelReady: (viewModel) => viewModel.initialize(context),
        builder: (context, viewModel, child) {
          return Scaffold(
            body: SingleChildScrollView(
              child: BaseContainer(
                image: 'assets/girissonrasi.png',
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: context.dynamicHeight(0.05),
                          horizontal: context.dynamicWidth(0.16)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: context.dynamicHeight(0.06)),
                            child:
                                Image.asset('assets/girislogosu.png', scale: 1),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: context.dynamicHeight(0.1)),
                            child: Column(
                              children: [
                                CustomTextFormField(viewModel.email,
                                    hintText: 'Email', icon: AppIcons.person),
                                CustomTextFormField(viewModel.password,
                                    hintText: 'Şifre', icon: AppIcons.lock),
                                CustomTextFormField(viewModel.password,
                                    hintText: 'Şifre Tekrar',
                                    icon: AppIcons.lock),
                                Container(
                                    height: context.dynamicHeight(0.06),
                                    child: CustomButton(
                                        text: 'Kaydet',
                                        onPressed: ()=> viewModel.register())),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                        top: 35,
                        left: 10,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            onPressed: () => context.pop(),
                          ),
                        )),
                    LoadingWidget(viewModel.isLoading)
                  ],
                ),
              ),
            ),
          );
        });
  }
}
