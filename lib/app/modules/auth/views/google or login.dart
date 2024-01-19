import 'package:connect_firebase/app/config/routes/my_named_routes.dart';
import 'package:connect_firebase/app/config/theme/my_colors.dart';
import 'package:connect_firebase/app/core/extensions/buid_context_extension.dart';
import 'package:connect_firebase/app/modules/auth/domain/providers/auth_providers.dart';
import 'package:connect_firebase/app/modules/auth/widgets/my_forms_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.read(authControllerProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.secondary_400,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(context.translate.login,
            style: context.textTheme.headlineMedium
                ?.copyWith(fontSize: 16, color: MyColors.white)),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.pushNamed(MyNamedRoutes.register);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.blue), // Change this color
                ),
                child: Text(
                  context.translate.register,
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: MyColors.black,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  authController.signInWithGoogle().then((value) {
                    if (value == true) {
                      context.goNamed(MyNamedRoutes.splash);
                    }
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.blue), // Change this color
                ),
                child: Text(
                  context.translate.googleSign,
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: MyColors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
