import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mo_lines/module/authentication/controllers/auth_controller.dart';

import '../../../models/setting_model.dart';
import '../../../routes/app_routes.dart';
import '../../../services/settings_service.dart';
import '../../../utils/global_widgets/block_button_widget.dart';
import '../../../utils/global_widgets/circular_loading_widget.dart';
import '../../../utils/global_widgets/text_field_widget.dart';
import '../../../utils/helper.dart';
import '../../../utils/images_provider.dart';
import '../../../utils/ui.dart';

///
class LoginView extends GetView<AuthController> {
  final Setting _settings = Get.find<SettingsService>().setting.value;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: Helper().onWillPop,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Login".tr,
              style: Get.textTheme.headline6
                  ?.merge(TextStyle(color: context.theme.primaryColor)),
            ),
            centerTitle: true,
            backgroundColor: Get.theme.colorScheme.secondary,
            automaticallyImplyLeading: false,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Get.theme.primaryColor),
              onPressed: () => {
                // Get.find<RootController>().changePageOutRoot(0)
              },
            ),
          ),
          body: Form(
            key: controller.loginFormKey,
            child: ListView(
              primary: true,
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Container(
                      height: 180,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: Get.theme.colorScheme.secondary,
                        borderRadius:
                            const BorderRadius.vertical(bottom: Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                              color: Get.theme.focusColor.withOpacity(0.2),
                              blurRadius: 10,
                              offset: Offset(0, 5)),
                        ],
                      ),
                      margin: const EdgeInsets.only(bottom: 50),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Text(
                              _settings.appName ?? "",
                              style: Get.textTheme.headline6?.merge(TextStyle(
                                  color: Get.theme.primaryColor, fontSize: 24)),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Welcome to the best service provider system!".tr,
                              style: Get.textTheme.caption?.merge(
                                  TextStyle(color: Get.theme.primaryColor)),
                              textAlign: TextAlign.center,
                            ),
                            // Text("Fill the following credentials to login your account", style: Get.textTheme.caption.merge(TextStyle(color: Get.theme.primaryColor))),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: Ui.getBoxDecoration(
                        radius: 14,
                        border:
                            Border.all(width: 5, color: Get.theme.primaryColor),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        child: Image.asset(
                          ImagesPath.logo,
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                  ],
                ),
                Obx(() {
                  if (controller.loading.isTrue) {
                    return CircularLoadingWidget(height: 300);
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFieldWidget(
                          labelText: "Email Address/Username",
                          hintText: "johndoe@gmail.com".tr,
                          // initialValue: (controller.currentUser != null &&
                          //         controller.currentUser?.value.email != null)
                          //     ? controller.currentUser!.value.email
                          //     : "",
                          // onSaved: (input) => controller.currentUser!.value.email = input,
                          validator: (input) => !input!.contains('@')
                              ? "Should be a valid email".tr
                              : null,
                          iconData: Icons.alternate_email,
                        ),
                        Obx(() {
                          return TextFieldWidget(
                            labelText: "Password".tr,
                            hintText: "••••••••••••".tr,
                            //initialValue: controller.currentUser!.value.password!,
                            // initialValue: (controller.currentUser != null &&
                            //         controller.currentUser?.value.password !=
                            //             null)
                            //     ? controller.currentUser!.value.password
                            //     : "",
                            // onSaved: (input) =>
                            //     controller.currentUser!.value.password = input,
                            validator: (input) => input!.length < 2
                                ? "Should be more than 2 characters".tr
                                : null,
                            obscureText: controller.hidePassword.value,
                            iconData: Icons.lock_outline,
                            keyboardType: TextInputType.visiblePassword,
                            isLast: false,
                            //for bottom padding
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.hidePassword.value =
                                    !controller.hidePassword.value;
                              },
                              color: Theme.of(context).focusColor,
                              icon: Icon(controller.hidePassword.value
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined),
                            ),
                          );
                        }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                //Get.toNamed(Routes.FORGOT_PASSWORD);
                              },
                              child: Text("Forgot Password?".tr),
                            ),
                          ],
                        ).paddingSymmetric(horizontal: 20),
                        BlockButtonWidget(
                          onPressed: () async{
                            //controller.login();
                            await Get.offAndToNamed(Routes.dashBoard);
                          },
                          color: Get.theme.colorScheme.secondary,
                          text: Text(
                            "Login".tr,
                            style: Get.textTheme.headline6?.merge(
                                TextStyle(color: Get.theme.primaryColor)),
                          ),
                        ).paddingSymmetric(vertical: 10, horizontal: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                // Get.toNamed(Routes.REGISTER);
                               // Get.off(SignUpScreenView());
                              },
                              child: Wrap(
                                children: [
                                  Text("You don't have an account? ",
                                      style: Get.theme.textTheme.titleMedium?.copyWith(fontSize: 15,)),
                                  Text("SignUp",
                                      style: Get.theme.textTheme.titleMedium?.copyWith(fontSize: 15,))
                                ],
                              ),
                            ),
                          ],
                        ).paddingSymmetric(vertical: 2),
                      ],
                    );
                  }
                }),
              ],
            ),
          ),
        ));
  }
}
