import 'package:connect_firebase/app/config/theme/my_colors.dart';
import 'package:connect_firebase/app/core/extensions/buid_context_extension.dart';
import 'package:connect_firebase/app/modules/auth/domain/providers/auth_providers.dart';
import 'package:connect_firebase/app/modules/auth/widgets/my_forms_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterScreen extends ConsumerWidget {
  RegisterScreen({super.key});
  final registerFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.read(authControllerProvider.notifier);
    final formProvider = ref.watch(authFormController);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primary_500,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(context.translate.register,
            style: context.textTheme.headlineMedium
                ?.copyWith(fontSize: 16, color: MyColors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyAuthForm(
              registerFormKey: registerFormKey,
            ),
            SizedBox(
              height: context.screenHeight * 0.04,
            ),
            ElevatedButton(
              onPressed: () {
                if (registerFormKey.currentState?.validate() == true) {
                  authController.register(
                      email: formProvider.email,
                      userName: formProvider.userName,
                      password: formProvider.password);
                }
              },
              child: Text(context.translate.register,
                  style: context.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: MyColors.primary_500)),
            ),
            ElevatedButton(
              onPressed: () {
                if (registerFormKey.currentState?.validate() == true) {
                  authController.register(
                      email: formProvider.email,
                      userName: formProvider.userName,
                      password: formProvider.password);
                }
              },
              child: Text(context.translate.googleSign,
                  style: context.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: MyColors.primary_500)),
            ),
          ],
        ),
      ),
    );
  }
}
