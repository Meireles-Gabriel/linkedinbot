import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linkedinbot/design.dart';

class MainScreen extends ConsumerWidget {
  MainScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fieldController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.baseColor,
      body: Center(
        child: SizedBox(
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text(
              //   'Connections Bot', style: AppTextStyles.montserratLarge(),
              // ),
              SizedBox(
                  height: 40,
                  child: myTextField('Email', 1, false, emailController)),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                  height: 40,
                  child: myTextField('Password', 1, true, passwordController)),
              const SizedBox(height: 20),
              SizedBox(
                  height: 40,
                  child: myTextField(
                      'Field of Interest', 1, false, fieldController)),
              const SizedBox(height: 20),
              myTextField('Message to Send', null, false, messageController),
            ],
          ),
        ),
      ),
    );
  }

  TextField myTextField(label, maxLines, obscure, controller) {
    return TextField(
      maxLines: maxLines,
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: label,
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(
            color: AppColors.callToActionColor,
            width: 2.0,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(
            color: AppColors.callToActionColor,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
