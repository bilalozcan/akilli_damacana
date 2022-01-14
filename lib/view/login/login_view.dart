import 'package:flutter/material.dart';
import 'package:smart_carboy/core/constants/icon/app_icons.dart';
import 'package:smart_carboy/view/home/home_view.dart';
import 'package:smart_carboy/view/login/login_view_model.dart';
import 'package:smart_carboy/view/main/main_view.dart';
import 'package:smart_carboy/widgets/base_container.dart';
import 'package:smart_carboy/widgets/custom_button.dart';
import 'package:smart_carboy/widgets/custom_text_form_field.dart';
import 'package:smart_carboy/widgets/loading_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:smart_carboy/core/extensions/context_extension.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
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
                            padding:
                                EdgeInsets.only(top: context.dynamicHeight(0.06)),
                            child:
                                Image.asset('assets/girislogosu.png', scale: 1),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: context.dynamicHeight(0.1)),
                            child: Column(
                              children: [
                                CustomTextFormField(viewModel.userName,
                                    hintText: 'Kullanıcı Adı',
                                    icon: AppIcons.person),
                                CustomTextFormField(viewModel.password,
                                    hintText: 'Şifre', icon: AppIcons.lock),
                                Container(
                                    height: context.dynamicHeight(0.06),
                                    child: CustomButton(
                                        text: 'Giriş Yap',
                                        onPressed: () {
                                          viewModel.login();
                                        })),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 10,
                                        child: CustomButton(
                                            text: 'Kayıt Ol', onPressed: null)),
                                    Expanded(flex: 1, child: SizedBox()),
                                    Expanded(
                                        flex: 18,
                                        child: CustomButton(
                                            text: 'Şifremi Unuttum',
                                            onPressed: null))
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    LoadingWidget(viewModel.isLoading)
                  ],
                ),
              ),
            ),
          );
        });
  }
}
