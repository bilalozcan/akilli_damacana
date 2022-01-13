import 'package:flutter/material.dart';
import 'package:smart_carboy/view/login/login_view_model.dart';
import 'package:smart_carboy/widgets/base_container.dart';
import 'package:smart_carboy/widgets/custom_button.dart';
import 'package:smart_carboy/widgets/custom_text_form_field.dart';
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
            body: BaseContainer(
              Container(
                height: context.dynamicHeight(1),
                width: context.dynamicWidth(1),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/girissonrasi.png'),
                        fit: BoxFit.fill)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: context.dynamicHeight(0.05),
                      horizontal: context.dynamicWidth(0.16)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(top: context.dynamicHeight(0.06)),
                        child: Image.asset('assets/girislogosu.png', scale: 1),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(bottom: context.dynamicHeight(0.1)),
                        child: Column(
                          children: [
                            CustomTextFormField(viewModel.userName,
                                hintText: 'Kullanıcı Adı', icon: Icons.person),
                            CustomTextFormField(viewModel.password,
                                hintText: 'Şifre', icon: Icons.lock),
                            Container(
                                height: context.dynamicHeight(0.06),
                                child: CustomButton(
                                    text: 'Giriş Yap', onPressed: null)),
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
              ),
            ),
          );
        });
  }
}
