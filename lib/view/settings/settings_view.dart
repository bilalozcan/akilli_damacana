import 'package:flutter/material.dart';
import 'package:smart_carboy/core/base/base_data.dart';
import '../../core/constants/icon/app_icons.dart';
import '../../core/init/theme/light/color_scheme_light.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'package:stacked/stacked.dart';
import '../../core/extensions/context_extension.dart';
import 'settings_view_model.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
        viewModelBuilder: () => SettingsViewModel(),
        onModelReady: (viewModel) => viewModel.initialize(context),
        builder: (context, viewModel, child) {
          return Scaffold(
            body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                    ColorSchemeLight.instance!.lightBlue1,
                    ColorSchemeLight.instance!.lightBlue2,
                  ])),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(13),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    context.themeData.colorScheme.primaryVariant,
                                width: 1),
                            borderRadius: BorderRadius.circular(200)),
                        child: CircleAvatar(
                          radius: 100,
                          backgroundColor: context.themeData.colorScheme.primary
                              .withOpacity(0.5),
                          backgroundImage: AssetImage('assets/background.png'),
                          child: Center(
                              child: Icon(
                            Icons.camera_alt_rounded,
                            color: context.themeData.colorScheme.primaryVariant,
                            size: 64,
                          )),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: CustomButton(
                                  onPressed: null,
                                  text: 'Profili Düzenleme',
                                  backgroundColor:
                                      context.themeData.colorScheme.primary,
                                  textColor: context
                                      .themeData.colorScheme.primaryVariant)),
                          // SizedBox(width: context.dynamicWidth(0.02)),
                          // Expanded(
                          //     child: CustomButton(
                          //         onPressed: () {},
                          //         text: 'Şifre Değiştir',
                          //         backgroundColor:
                          //             context.themeData.colorScheme.primary,
                          //         textColor: context
                          //             .themeData.colorScheme.primaryVariant)),
                        ],
                      ),
                      SizedBox(height: context.dynamicHeight(0.05)),
                      CustomTextFormField(viewModel.addressController, hintText: 'Adres', icon: Icons.add_location,),
                      CustomTextFormField(viewModel.phoneNumberController, hintText: 'Telefon', icon: Icons.phone,),
                      CustomTextFormField(viewModel.ageController, hintText: 'Yaş', icon: Icons.calendar_today,),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: CustomTextFormField(viewModel.waterCountController, hintText: 'Tüketilen Su (Lt)', icon: AppIcons.person,)),
                          SizedBox(width: context.dynamicWidth(0.07)),
                          CustomButton(
                            height: context.dynamicHeight(0.08),
                              width: context.dynamicWidth(0.25),
                              onPressed: null,
                              text: '${viewModel.waterCount}LT',
                              backgroundColor:
                              context.themeData.colorScheme.primary,
                              textColor: context
                                  .themeData.colorScheme.primaryVariant)
                        ],
                      ),
                      CustomButton(
                          height: context.dynamicHeight(0.09),
                          onPressed: () => viewModel.save(),
                          text: 'Kaydet',
                          backgroundColor:
                          context.themeData.colorScheme.primary,
                          textColor: context
                              .themeData.colorScheme.primaryVariant)
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
